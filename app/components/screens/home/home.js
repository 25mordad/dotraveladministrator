import React, {Component} from 'react';
import {AsyncStorage, Platform, View,Button,ActivityIndicator} from 'react-native';
import t from 'tcomb-form-native'; // 0.6.9
import styles from './style/styles'; // 0.6.9
import { GoogleSignin, GoogleSigninButton } from 'react-native-google-signin';


export  class Home extends Component {


 static navigationOptions = {
    title: 'Log In',
  };

  handleSubmit(){
     navigate('SecondScreen')
  }
    signIn(){

    }
   render() {

     return (
     <View>
       <GoogleSigninButton
          style={{ width: 48, height: 48 }}
          size={GoogleSigninButton.Size.Icon}
          color={GoogleSigninButton.Color.Dark}
          onPress={this._signIn}
          disabled={this.state.isSigninInProgress} />
          </View>
     );
   }
 }


 export default Home
