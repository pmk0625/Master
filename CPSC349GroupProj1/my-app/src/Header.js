//Navbar Header for the Website
//Import react
import React, {useState} from 'react'
import "./Header.css";
import "./App.js";
//Import Icons from Material UI
import SearchIcon from '@mui/icons-material/Search';
import HomeIcon from '@mui/icons-material/Home';
import ArrowDownwardIcon from '@mui/icons-material/ArrowDownward';
import FlagIcon from '@mui/icons-material/Flag';
import CalendarTodayIcon from '@mui/icons-material/CalendarToday';
import SupervisedUserCircleIcon from '@mui/icons-material/SupervisedUserCircle';
import ColorLensIcon from '@mui/icons-material/ColorLens';
import { Avatar, IconButton } from "@mui/material";
import AddIcon from '@mui/icons-material/Add';
import ForumIcon from '@mui/icons-material/Forum';
import NotificationsActiveIcon from '@mui/icons-material/NotificationsActive';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import EmojiPeopleIcon from '@mui/icons-material/EmojiPeople';
import { useStateValue } from "./StateProvider";
import Popup from './Popup.js'
import './Popup.css'

function Header() {
    const [{ user }, dispatch] = useStateValue();
    const [isOpen, setIsOpen] = useState(false);
    const PopupToggle = () => { //toggle function for pop up (whether it is open or not)
        setIsOpen(!isOpen);
    }
    

    return <div id="header" className='header-dark'>
    <div>
    {isOpen && <Popup information = {<>
    <b className="welcome-user-popup">Welcome to our site, {user.displayName}!</b>
    </>}
    CloseHandler={PopupToggle}
    />}
    </div>
        <div className="header__left">
            <img
                src="https://i.imgur.com/S4TF9YI.png" alt=""
            />
            <div className="header__input">
                <SearchIcon />
                <input placeholder="Search" type="text" />
            </div>
        </div>
        <div className="header__center" >
        {/* Apply Imported Icons from Material UI library*/}
        <div className="header__option header__option--active"  onClick={HomeButtonHandler}>
            <HomeIcon fontSize="large"/>
        </div>
            <div className="header__option" onClick={ToggleTheme}>
                <ColorLensIcon fontSize="large"/>
            </div>
            <div className="header__option" onClick={BottomScreenHandler}>
                <ArrowDownwardIcon fontSize="large"/>
            </div>
            <div className="header__option" onClick={CalanderTime}>
                <CalendarTodayIcon fontSize="large"/>
            </div>
            <div className="header__option"  onClick={PopupToggle}>
                <EmojiPeopleIcon fontSize="large"/>
                
            </div>
        </div>




        <div className="header__right">
            <div className="header__info">
                <Avatar src={user.photoURL} />
                <h4>{user.displayName}</h4>
            </div>

            {/* Material UI that allows for clickable icons */}
            <IconButton>
                <AddIcon style={{fill: "#e4e6eb"}}/>
            </IconButton>
            <IconButton>
                <ForumIcon style={{fill: "#e4e6eb"}}/>
            </IconButton>
            <IconButton>
                <NotificationsActiveIcon style={{fill: "#e4e6eb"}}/>
            </IconButton>
            <IconButton>
                <ExpandMoreIcon style={{fill: "#e4e6eb"}}/>
            </IconButton>
        </div>

    </div>;
}

export default Header

function HomeButtonHandler() { //scrolls to top of screen
    document.body.scrollTop = 0; //Safari
    document.documentElement.scrollTop = 0; // Chrome, Firefox, IE and Opera
}

function BottomScreenHandler(){ //scroll to bottom of screen
    window.scrollTo(0,document.body.scrollHeight);
}

function CalanderTime(){ //calculates the time with math. This is based off the get"Time" functions
    const monthNames = [1,2,3,4,5,6,7,8,9,10,11,12];
    const dateObj = new Date();
    const month = monthNames[dateObj.getMonth()];
    const day = String(dateObj.getDate()).padStart(2, '0');
    const year = dateObj.getFullYear();
    const output = month  + '/'+ day  + '/' + year;
    var time = new Date();
    alert("The current time is: " + Math.trunc(time/1000) + " seconds\nOR: " + 
    Math.trunc(time/86400000) + " days\nOR: " + Math.trunc(time/31557600000) + " years\n" +
    "This translates into todays date: " + output + "\nOr in more detail: \n" + time)
    console.log("testing CalanderTime")
}

function ToggleTheme(){ //finds out which header to use
    if(document.getElementById("header").className === "header-dark") {
        setTheme("header-random");
    } else {
        setTheme("header-dark");
    }
}

//This function sets the random color theme.
function setTheme(theme){
    document.getElementById("header").className = theme;
    if(theme === "header-random"){ //If the toggle class is random, then randomize the color and set it.
        var random_color;
        random_color = Math.floor(Math.random()*16777215).toString(16);
        document.getElementById("header").style.backgroundColor = "#" + random_color;
    } else { //If the toggle class is Dark Theme, switch it back to dark (forcibly since it wouldn't do so)
        document.getElementById("header").style.backgroundColor = "#242526";
    }
}