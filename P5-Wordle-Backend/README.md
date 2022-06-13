# Wordle Clone

Following Project is accessible via Linux Environment. We Used Ubuntu.

### Project 5 by
* Evan Delasota
* Iftekharul Islam
* Minkyu Ray Park
* Quauhtli Garcia-Brindis

### Projects 2-4 by
* Aaron Lieberman
* Armanul Ambia
* Iftekharul Islam
* Jacob Nguyen

## Installation

1. Clone the directory
```bash
git clone https://github.com/AaronLieb/WordleClone.git
```

2. Enter the repository directory
```bash
cd WordleClone
```

3. Install the required libraries and tools
```bash
sudo apt update
sudo apt install --yes python3-pip ruby-foreman sqlite3 httpie jq
python3 -m pip install 'fastapi[all]' sqlite-utils
sudo apt install --yes redis
sudo apt install --yes python3-hiredis
python3 -m pip install httpx
sudo apt-get install gnome-schedule
```
If `sudo apt-get install gnome-schedule` doesn't work try
```bash
sudo apt-get install cron
```

4. Go into the `api` directory
```bash
cd api
```

5. Run the initialization script
```bash
./bin/init.sh
```
This will download the wordle wordlists, parse them, create the database, and fill the database

If an error related to Redis occurs while running the init script, run the following line in a separate terminal:
```bash
redis-server
```

6. Start all the microservices and the load balancer
```bash
./start.sh
```

7. To view the documentation of the endpoints, open the swagger docs

On the port for the microservice use the `/docs/` endpoint to check the available endpoints for that microservice

8. In a separate terminal, you can test the microservices using the scripts in the `bin/endpoint-tests/` directory
Most of the scripts use command line arguments to send words, here is an example of one being used

## Project 2 Endpoints

Check if a guess is a valid five-letter word:
```bash
./bin/endpoint-tests/put_validate.sh <word>
```

Check a guess against the word of the day:
```bash
./bin/endpoint-tests/put_check.sh <word>
```

Add a word to the valid words database:
```bash
./bin/endpoint-tests/post_word.sh <word>
```

Delete a word from the valid words database:
```bash
./bin/endpoint-tests/delete_word.sh <word>
```

Add a word to the answers database:
```bash
./bin/endpoint-tests/post_answer.sh <word>
```

Delete a word from the answers database:
```bash
./bin/endpoint-tests/delete_answer.sh <word>
```

Change the current word of the day to a custom word:
```bash
./bin/endpoint-tests/post_next_answer.sh <word>
```

Remove the custom word of the day and set it back to the original:
```bash
./bin/endpoint-tests/delete_next_answer.sh
```


## Project 3 Endpoints

Test posting win or loss:
```bash
./bin/endpoint-tests/post_win_loss.sh <username> <game_id> <guesses> <won>
```
In this script, 5 argument parameters are passed in, username: int, game_id: int, guesses: int, and won: bool (1 or 0)

Test getting stats:
```bash
./bin/endpoint-tests/get_stats.sh <user_name>
```

Test Getting Users with Most Wins:
```bash
./bin/endpoint-tests/get_top_wins.sh
```

Test Getting Users with Longest Streak:
```bash
./bin/endpoint-tests/get_longest_streak.sh
```


## Project 4 Endpoints

#### NOTE: og_id is the original user integer ID, NOT the user's UUID.

Start a new game for a specific user:
```bash
./bin/p4-endpoints/start_game.sh <og_id> <game_id>
```

Check the guesses made and the number of guess remaining for a specific game a specific user is playing:
```bash
./bin/p4-endpoints/get_game.sh <og_id> <game_id>
```

Make a guess on a specific game for a specific user:
```bash
./bin/p4-endpoints/make_guess.sh <og_id> <game_id> <word>
```


## Project 5 - Dependency Changes
1. change /start/ in redis_connect.py to take in a username and return the status, user_id, game_id. It will also return the guesses made if the game is in progress

2. change /get_game/ in redis_connect.py to take in a UUID as user_id instead of the old user_id. This method now returns a status for if the user_id is invalid, the game_id is invalid, or if both are valid. If both are valid, the endpoint still gives the current guesses and remainig guesses. It is also now a POST request instead of GET.

3. change /make_guess/ in redis_connect.py to take in a UUID as user_id instead of the old user_id

4. change /finish/ in stats.py to take in a UUID as user_id instead of the old user_id

5. change /stats/ in stats.py to take in a UUID as user_id instead of the old user_id


## Project 5 Endpoints

Start the game of the day for a specific user:
```bash
./bin/p5-endpoints/new_game.sh <username>
```

Make a guess for a specific user for a specific game. Evaluates guess validity and compares to answer. Outputs information for that game when in-progress and user stats if won/lost.
```bash
./bin/p5-endpoints/game_info.sh <game_id> <user_id> <guess>
```
## Previews

![Screenshot from 2022-06-12 22-21-44](https://user-images.githubusercontent.com/36967168/173285253-e88f8564-2d6e-416f-b198-e041a3f1e3ec.png)

On the right side of the capture, 
```bash
./bin/init.sh 
```

First, in the api folder, ```bash ./bin/init.sh ``` will start up the code (wordle wordlist, parsing, databases, filling databases).

On the right side of the capture, ```bash redis-server ``` will fire up redis server for load balancer. (Seperate terminal)

![Screenshot from 2022-06-12 22-21-44](https://user-images.githubusercontent.com/36967168/173285877-8c6ba707-e724-457e-a090-e62c40cd838c.png)

Start the application using ```bash ./start.sh ```

After starting the game, using ```bash ./bin/p5-endpoints/new_game.sh qwalton ```where "qwalton" is username in the database, it will bring up user's game_id, user_id.

Copy the game_id, user_id, enter guess (5 letter word) with the following command: ```bash ./bin/p5-endpoints/game_info.sh <game_id> <user_id> <guess>```. Happy Wordling using Back-End.


![Screenshot from 2022-06-12 22-48-36](https://user-images.githubusercontent.com/36967168/173288216-2795eee5-c489-40dc-8c1a-06f7f34765b4.png)

![Screenshot from 2022-06-12 22-48-56](https://user-images.githubusercontent.com/36967168/173288231-6170432b-b870-4667-b950-4a46d8e83150.png)
