import React from 'react';
import "./Widgets.css";

function Widgets() {
    var rand_num = Math.trunc(Math.random(3)*3);
    if(rand_num >= 3) {
        rand_num = 0;
    }
    console.log(rand_num)
    if(rand_num === 0){
        return (
            <div className="widgets">
                <iframe
                    title="widget__side"
                    src="https://www.fullerton.edu/ecs/cs/"
                    width="340"
                    height="65%"
                    style={{ border: 'none', overflow: 'hidden' }}
                    scrolling="no"
                    frameborder="0"
                    allowTransparency="true"
                    allow="encrypted-media"
          ></iframe>
            </div>
            )
    } else if(rand_num === 1){
        return(
        <div className="widgets">
            <iframe
                title="widget__side"
                src="https://news.fullerton.edu/"
                width="340"
                height="63.5%"
                style={{ border: 'none', overflow: 'hidden' }}
                scrolling="no"
                frameborder="0"
                allowTransparency="true"
                allow="encrypted-media"
      ></iframe>
        </div>
        )
    } else {
        return (
        <div className="widgets">
        <iframe
            title="widget__side"
            src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FCSUFofficial&tabs=timeline&width=340&height=1500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId"
            width="340"
            height="100%"
            style={{ border: 'none', overflow: 'hidden' }}
            scrolling="no"
            frameborder="0"
            allowTransparency="true"
            allow="encrypted-media"
  ></iframe>
    </div>
        )
    }
}

export default Widgets
//https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FCSUFofficial&tabs=timeline&width=340&height=1500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId