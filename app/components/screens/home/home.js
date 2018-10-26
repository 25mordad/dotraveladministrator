import React, {Component} from 'react';
import {AsyncStorage, Platform, View,Button,ActivityIndicator} from 'react-native';
import t from 'tcomb-form-native'; // 0.6.9
import styles from './style/styles'; // 0.6.9
import {GoogleSignin, GoogleSigninButton, statusCodes} from 'react-native-google-signin';


export class Home extends Component {

// Somewhere in your code


signIn = async () => {
  try {
    await GoogleSignin.hasPlayServices();
    const userInfo = await GoogleSignin.signIn();
    this.setState({ userInfo });
  } catch (error) {
    if (error.code === statusCodes.SIGN_IN_CANCELLED) {
      // user cancelled the login flow
    } else if (error.code === statusCodes.IN_PROGRESS) {
      // operation (f.e. sign in) is in progress already
    } else if (error.code === statusCodes.PLAY_SERVICES_NOT_AVAILABLE) {
      // play services not available or outdated
    } else {
      // some other error happened
    }
  }
};

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
