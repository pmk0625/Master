# Two-RESTFful-Back-End-Microservice

In this project we will build two RESTful back-end microservices.

This project is implementation of game Wordle using back-end microservices. 

More complete version in terms of utilization of back-end microservices is linked below:

**https://github.com/pmk0625/Master/tree/main/P5-Wordle-Backend**

## Authors:

Yujin Chung - yujin.chung@csu.fullerton.edu

Jason Liu - jliu96@csu.fullerton.edu

Minkyu Park - pmk0625@csu.fullerton.edu / pmk062595@gmail.com

Steven Tran - transteven@csu.fullerton.edu

## To initialize the databases and start the services, run:

python3 stats.py for user stats service

python3 app.py for game playing service which sets up words database

python3 main.py configure traefik and uvicorn using fastapi

## Preview

Below is how the game is played. A answer is given, user has total of 5 guesses to guess the answer. There are hints, green = right letter and right location, yellow = right letter and wrong location, grey = wrong letter and wrong location.

![Screenshot from 2022-06-21 00-42-36](https://user-images.githubusercontent.com/36967168/174744969-075a5d48-0f3d-4d93-8fb7-bf5b5b65a142.png)

There are databases, sharded.

![Screenshot from 2022-06-21 00-50-09](https://user-images.githubusercontent.com/36967168/174745852-ea37882b-7fe7-4683-9ff3-c1c97364271f.png)

Guess must be 5 letter valid word. Each guess will be logged in json file until game is complete. Once game is complete, for security purposes, all data will be deleted.

![Screenshot from 2022-06-21 00-52-48](https://user-images.githubusercontent.com/36967168/174746503-dc45286f-6b54-4192-a47f-e69b13084b0e.png)

This program utilizes python, traefik, SQL, databases, json, redis
