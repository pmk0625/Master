import { Avatar } from "@mui/material";
import React, { useState } from 'react';
import styled from "@emotion/styled"
import "./MessageSender.css";
import { useStateValue } from "./StateProvider";
import db from "./firebase";
import firebase from "firebase";

function MessageSender() {

    const [{ user }, dispatch] = useStateValue();

    //Using react hooks to set values given by form
    const [input, setInput] = useState("")
    const [imageUrl, setImageUrl] = useState("")

    //Handle form submission
    const handleSubmit = e => {
        e.preventDefault();

        db.collection('posts').add({
            userId:user.uid,
            message: input,
            timestamp: firebase.firestore.FieldValue.serverTimestamp(),
            profilePic: user.photoURL,
            username: user.displayName,
            image: imageUrl,
            likes: 0
        });

        //Reset Form to empty
        setInput("")
        setImageUrl("")
    };

    const Button = styled.button`
    background-color: #2fc31d;
    color: white;
    font-size: 16px;
    padding: 10px 60px;
    border-radius: 5px;
    margin: 10px 0px;
    cursor: pointer;
    `;

    return (
        <><h1 class="messageSender__vent">Vent Out!</h1>
        <p class="messageSender__vent">Be cautious on what you choose to say!</p>
        <div className="messageSender">
            <div className="messageSender__top">
                <Avatar src={user.photoURL} />
                <form>
                    <input
                        value={input}
                        onChange={(e) => setInput(e.target.value)}
                        className="messageSender__input"
                        placeholder={`What are you thinking about, ${user.displayName}?`} />
                    <input
                        value={imageUrl}
                        onChange={(e) => setImageUrl(e.target.value)}
                        placeholder="Image URL (Optional)" />

                    <button onClick={handleSubmit} type="submit">
                        Hidden submit
                    </button>
                </form>
            </div>
            <div className="messageSender__bottom">
                <div className="messageSender__option">
                    <Button onClick={handleSubmit} type="submit">
                        <h3>Shout Into The Void</h3>
                    </Button>
                </div>
            </div>
        </div></>
    );
}

export default MessageSender
