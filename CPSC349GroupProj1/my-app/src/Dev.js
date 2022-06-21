import { Avatar } from "@mui/material";
import React from 'react';
import "./Dev.css";

function Dev({ image, profileSrc, title}) {
    return (
        <div style={{backgroundImage: `url(${image})`}}
        className = "dev">
            <span className="tool-tip-intro">Hello, my name is {title}</span>
            <Avatar className="dev__avatar" src={profileSrc} />
            <h4>{title}</h4>
        </div>
    );
}

export default Dev
