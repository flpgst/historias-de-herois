import { initializeApp } from "firebase/app";
import { getFirestore, collection, getDocs } from "firebase/firestore/lite";

// Import the functions you need from the SDKs you need
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: process.env.VUE_APP_APIKEY,
  authDomain: process.env.VUE_APP_AUTHDOMAIN,
  projectId: process.env.VUE_APP_PROJECTID,
  storageBucket: process.env.VUE_APP_STORAGEBUCKET,
  messagingSenderId: process.env.VUE_APP_MESSAGINGSENDERID,
  appId: process.env.VUE_APP_APPID,
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

export default async function getCharacters() {
  const db = getFirestore(app);
  const characters = collection(db, "characters");
  const charactersSnapshot = await getDocs(characters);
  console.log("object :>> ", charactersSnapshot);
  const characterList = charactersSnapshot.docs.map((doc) => doc.data());
  return characterList;
}
