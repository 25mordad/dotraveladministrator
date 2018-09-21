/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */
import Second from './app/components/screens/timer/timer';
import Home from './app/components/screens/home/home';

import React, {Component} from 'react';
import {Platform, StyleSheet, View,Button} from 'react-native';
import t from 'tcomb-form-native'; // 0.6.9
import {StackNavigator} from 'react-navigation';

const AppNavigator = StackNavigator({
  HomeScreen: { screen: Home },
  SecondScreen: { screen: Second }
});

export default class App extends Component {
  render() {
    return (
      <AppNavigator />
    );
  }
}



