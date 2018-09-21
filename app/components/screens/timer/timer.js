import React, {Component} from 'react';
import {AsyncStorage, Platform, View,Button,ActivityIndicator} from 'react-native';
import t from 'tcomb-form-native'; // 0.6.9
import styles from './style/styles'; // 0.6.9

const Form = t.form.Form;
const User = t.struct({
  myDate: t.String,
  hour_start: t.String,
  hour_end: t.String
});


const options = {
  fields: {
    terms: {
      label: 'Agree to Terms',
    },
  },
};
const myFormatFunction = format => date => formatDate(format, date)
const myFormat1 = 'yyyy-mm-d h:f:s'
const myFormat2 = 'yyyy-mm-d'
const formOptions = {
  fields: {
    myDate: {
      config: {
        format: myFormatFunction(myFormat1)
      }
    }
  }
}

const values  =  {}
 storeData = {};
export  class Home extends Component {

onChange(value) {

        storeData = async () => {
        try {
        key = Object.keys(value)[0]; // an array of object keys - but only the first level);

            await AsyncStorage.setItem(key,value[key]);
        } catch (error) {
            // Error saving data
            console.error(error)
        }


    }

}



//the functionality of the retrieveItem is shown below
async retrieveItem(key) {
    try {
      const retrievedItem =  await AsyncStorage.getItem(key);
      const item = JSON.parse(retrievedItem);
      return item;
    } catch (error) {
      console.log(error);
    }
    return
  }




 static navigationOptions = {
    title: 'Welcome',
  };

  handleSubmit(){
     navigate('SecondScreen')
  }

   render() {

     return (
       <View style={styles.container}>
       <Form type={User}
         ref={c => this._form = c} // assign a ref
          value={this.storeData}
          options={formOptions} // pass the options via props
          onChange={this.onChange}
       />
       <Button onPress={() => this.props.navigation.navigate('SecondScreen')} title="Home" />

       </View>
     );
   }
 }


 export default Home
