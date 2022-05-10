import React from 'react';
//import './Popup.css';

const Popup = props => {
    return (
        <div className = "popup-box">
            <div className = "box">
                    <span className="close-icon" onClick={props.CloseHandler}>X</span>
                {props.information}
            </div>
        </div>
    );
};

export default Popup;