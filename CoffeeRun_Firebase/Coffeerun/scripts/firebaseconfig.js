(function (window) {
  'use strict';
  var App = window.App || {};

  var FirebaseConfig = {
    apiKey: "AIzaSyCbdyF5LlLwdUabFcrIU80mOsDhSi7Gi7E", // put your data here
    authDomain: "coffee-run-b6258.firebaseapp.com",
    projectId: "coffee-run-b6258",
    storageBucket: "coffee-run-b6258.appspot.com",
    messagingSenderID: "434445366285",
    appId: "1:434445366285:web:9d01f5f2789ffa0ebb5144",
    measurementId: "G-51CXKZZCV2"
  };

  App.FirebaseConfig = FirebaseConfig;
  firebase.initializeApp(App.FirebaseConfig);
  
  window.App = App;
})(window);

/*
// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCbdyF5LlLwdUabFcrIU80mOsDhSi7Gi7E",
  authDomain: "coffee-run-b6258.firebaseapp.com",
  projectId: "coffee-run-b6258",
  storageBucket: "coffee-run-b6258.appspot.com",
  messagingSenderId: "434445366285",
  appId: "1:434445366285:web:9d01f5f2789ffa0ebb5144",
  measurementId: "G-51CXKZZCV2"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
*/