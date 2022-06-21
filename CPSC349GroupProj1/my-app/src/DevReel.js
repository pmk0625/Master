import React from 'react';
import "./DevReel.css";
import Dev from "./Dev.js";

function DevReel() {
    return <div className='devReel'>
      <Dev
        image="https://wallpapercave.com/wp/wp2328617.jpg"
        profileSrc="https://i.imgur.com/EucMjsn.png"
        title="Jason Zhu"
      />
      <Dev
        image="https://i.imgur.com/rEq5YmM.jpg"
        profileSrc="https://i.imgur.com/wdEr7ea.png"
        title="Jacob Coyle"
      />
      <Dev
        image="https://i.imgur.com/jIc8PId.jpg"
        profileSrc="https://i.imgur.com/5LSF4N4.jpg?1"
        title="Ricardo Barojas"
      />
      <Dev
        image="https://i.imgur.com/nMrQGDI.png"
        profileSrc="https://i.imgur.com/nMrQGDI.png"
        title="Minkyu Park"
      />
    
    </div>
}

export default DevReel
