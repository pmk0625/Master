import { Avatar } from "@mui/material";
import React, { useState } from 'react';
import ThumbUpIcon from '@mui/icons-material/ThumbUp';
// import ChatBubbleOutlineIcon from '@mui/icons-material/ChatBubbleOutline';
// import AccountCircleIcon from '@mui/icons-material/AccountCircle';
// import NearMeIcon from '@mui/icons-material/NearMe';
// import { ExpandMoreOutlined } from '@mui/icons-material';
import './Post.css';
import db from "./firebase";

function Post({profilePic, image, username, timestamp, message, likes, id }) {
    const[like, setLike] = useState(false);
    const[identity, setId] = useState("");
    const[likeOnce, setLikeOnce] = useState(false);

    function handleClick(e) {
        setLike(true);
        setId(id);
    }

    const greenColor={
        color:"#2fc31d"
    }

    if (like && id===identity && !likeOnce) {
        db.collection("posts").doc(id).update({likes:likes+1}).catch(err=>{console.log(err);});
        setLikeOnce(true);
    }


    return (
        <div className='post'>
            <div className="post__top">
                <Avatar src= {profilePic} 
                className="post__avatar" />
                <div className="post__topInfo">
                    <h3>{username}</h3>
                    <p>{new Date(timestamp?.toDate()).toUTCString()}</p>
                </div>
            </div>

            <div className="post__bottom">
                <p>{message}</p>
            </div>

            <div className="post__image">
                <img src={image} alt="" />
            </div>

            <div className="post__options">
                <div className="post__option" name={identity}>
                    <ThumbUpIcon onClick={handleClick} style={like ? greenColor : null} />
                    <p onClick={handleClick}>Like {likes}</p>
                </div>
            </div>
        </div>
    );
}

export default Post
