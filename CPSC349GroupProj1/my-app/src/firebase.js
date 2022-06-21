import firebase from "firebase"

const firebaseConfig = {
    apiKey: "AIzaSyBVfuC6wW__3_5vUShqzTuwIS5x6xAAj3Q",
    authDomain: "cpsc349groupproj.firebaseapp.com",
    projectId: "cpsc349groupproj",
    storageBucket: "cpsc349groupproj.appspot.com",
    messagingSenderId: "666114807914",
    appId: "1:666114807914:web:dc0c536461a5836d64d213",
    measurementId: "G-QY544Y3X8B"
};

const firebaseApp = firebase.initializeApp(firebaseConfig);
const db = firebaseApp.firestore();
const auth = firebase.auth();
const provider = new firebase.auth.GoogleAuthProvider();

//Test Change
export { auth, provider };
export default db;