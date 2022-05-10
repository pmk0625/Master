import React from "react";
import './App.css';
import Feed from "./Feed";
import Header from "./Header";
import Sidebar from "./Sidebar";
import Widgets from "./Widgets";
import Login from "./Login";
import { useStateValue } from "./StateProvider";
import './scrollbar.css';

//This is a change to show github
function App() {
  const [{ user }, dispatch] = useStateValue();
  return (
    <div className="app-dark">
      {!user ? (
        <Login />
        ) : (
        <>
        <Header />

        <div className="app__body">
          <Sidebar />
          <Feed />
          <Widgets />
        </div>
        </>
      )}
    </div>
  );
}

export default App;
