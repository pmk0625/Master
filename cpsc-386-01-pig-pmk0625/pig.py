#!/usr/bin/env python3

import random
import sys
import json

def roll():
  #Dice, Random number generator
  return random.randint(1,6)

def mode_1(player1, computer, computer_s, player_s):
  #Player vs. Computer
  turn = 0
  point = 0
  while True:
    r = roll()
    print("You rolled a {} ".format(r))
    turn += r
    # Dice = 1 -> end turn
    if r == 1:
      return 0
    else:
      #total point during the turn
      total = 'Your turn total is ' + str(turn)
      print(total)
      #player1 != 0
      if not player1:
        point = turn + computer_s
      #player1 != 0 && point >= player_score
      if not player1 and point >= player_s:
        return turn
      #player1 != 0 && turn >= comp
      if not player1 and turn >= computer:
        return turn
      #if player input 'n', end turn
      elif player1:
        stop = input ("Would you like to roll again? [y/n]: ")
        if stop.lower() == 'n':
          return turn

#Compute total function
def mode_1_total(player1_total, computer_total):
  print('Player1: {}'.format(player1_total))
  print('Computer: {}'.format(computer_total))
  print()

#Print _____ turn! function
def mode_1_turn(turn):
  if turn:
    print("It is player1's turn")
  else:
    print("It is computer's turn")

#Boolean for passing turns
def mode_1_next(next):
  if next:
    next = False
    return next
  else: 
    next= True
    return next       

def mode_2(player1, player2, computer, computer_s, player1_s, player2_s):
  #player vs player
  turn = 0
  point = 0
  while True:
    r = roll()
    print("You rolled a {} ".format(r))
    turn += r
    #Dice = 1 -> end-turn
    if r == 1:
      return 0
    else:
      #Compute total points in that turn
      total = 'Your turn total is ' + str(turn)
      print(total)
      #player1 != 0
      if not player1:
        point = turn + computer_s
      #player2 != 0
      if not player2:
        point = turn + computer_s
      #player1 != 0 and point >= player1_score
      if not player1 and point >= player1_s:
        return turn
      #player2 != 0 and point >= player2_score
      if not player2 and point >= player2_s:
        return turn
      #player1 != 0 and turn >= comp
      if not player1 and turn >= computer:
        return turn
      #player2 != 0 and turn >= comp
      if not player2 and turn >= computer:
        return turn
      #player1 input 'n', end-turn
      elif player1:
        stop = input ("Would you like to roll again? [y/n]: ")
        print()
        if stop.lower() == 'n':
          return turn
      #player2 input 'n', end-turn
      elif player2:
        stop = input ("Would you like to roll again? [y/n]: ")
        print()
        if stop.lower() == 'n':
          return turn

#Print whose turn
def mode_2_turn(turn_p1, turn_p2):
  if turn_p1:
    print("It is player1's turn")
  elif turn_p2:
    print("It is player2's turn")
  else:
    print("It is computer's turn")

#Print players' totals
def mode_2_total(player1_total, player2_total):
  print('Player1: {}'.format(player1_total))
  print('Player2: {}'.format(player2_total))
  print()

#Player class for array
class Player:
  def __init__(self, id, name, score = 0, wins = 0, loses = 0):
    self._id = id
    self._name = name
    self.score = score
    self.wins = wins
    self.loses = loses
    self._roll_history = []
  def name(self):
    return self._name
  def id(self):
    return self._id
  def add_roll(self, roll):
    self._roll_history.append(roll)
  def roll_history(self):
    return ','.join(self.roll_history)
  def __str__(self):
    return self._name
  def __repr__(self):
    return 'Player({}, \'{}\', {}, {}, {})'.format(self._id, self._name, self.score, self.wins, self.loses)

#PlayerQueue for array
class PlayerQueue:
  def __init__(self, l):
    self._players = l
    self._counter = 0
    self._should_stop = False
  def stop(self):
    self._should_stop = True
  def __iter__(self):
    return self
  def __next__(self):
    if self._should_stop:
      raise StopIteration
    if self._counter >= len(self._players):
      self._counter = 0
    player = self._players[self._counter]
    self._counter += 1
    return player

#main
def main():
  #Set win score to 100
  final_score = 100
  computer = 20

  #initialize variables
  player1 = True
  player2 = True
  player3 = True
  player4 = True

  #initialize array
  players = []

  #intro
  print("Welcome to the game of Pig!")
  print()

  #initialize total
  player1_tot = 0
  player2_tot = 0
  player3_tot = 0
  player4_tot = 0
  computer_tot = 0

  #display
  print("How many players are there?")
  print()

  #input number of players
  num_players = int(input())

  #When 0 players -> exit
  if num_players < 1:
    print()
    print("There cannot be 0 players")
    print()
    #exit
    sys.exit(1)

  #When 1 player -> Player vs. Computer
  elif num_players == 1:
    print()
    print("You will play against the computer!")
    print()
    #Loop until player score is greater than final score
    while player1_tot < final_score and computer_tot < final_score:
      mode_1_turn(player1)
      #Call function to work the game
      points = mode_1(player1, computer, computer_tot, player1_tot)
      #add up score
      if player1:
        player1_tot += points
      else:
        computer_tot += points
      #display total scores
      mode_1_total(player1_tot, computer_tot)
      player1 = mode_1_next(player1)

    #Display who won the game
    if player1_tot > computer_tot:
      print("Player1 has won this round of game of pig!")
    else:
      print("Computer has won this round of game of pig!")

  #When 2 players -> Player vs Player
  elif num_players == 2:
    print()
    print("You will play against another player!")
    print()
    #Loop until players reach final score
    while player1_tot < final_score and player2_tot < final_score:
      mode_2_turn(player1, player2)
      #Call function for game to start
      points = mode_2(player1, player2, computer, computer_tot, player1_tot, player2_tot)
      #add up the total score
      if player1:
        player1_tot += points
      elif player2:
        player2_tot += points
      #Display the total scores
      mode_2_total(player1_tot, player2_tot)
      player1 = mode_1_next(player1)

    #Display who won the game
    if player1_tot > player2_tot:
      print("Player1 has won this round of game of pig!")
    else:
      print("Player2 has won this round of game of pig!")      

  #When 3 or 4 players, multiplayer
  elif num_players > 2 and num_players <= 4:
    # regular game
    for p in range(num_players):
      name = input('What is player {}\'s name? '.format(p+1))
      #name = names[p]
      input('Ready to roll? Hit any key when ready!')
      r = roll()
      print('{} rolled {}'.format(name, r))
      print()
      #make array 
      new_player = Player(r, name)
      #save array
      players.append(new_player)

    #Sort function
    sorted_players = sorted(players, key=lambda x: x.id())
    #initialize counter
    counter = 0
    #PlayerQueue function
    pq = PlayerQueue(sorted_players)
    
    #Loop going through array
    for current_player in pq:
      print(current_player)
      ro = roll()
      #initialize score
      score = 0

      #When rolled 1, end turn
      if ro == 1:
        print('Sorry you lost your turn!')
        continue
      else:
        #display
        print('You rolled {}'.format(ro))
        #sum up the score
        score = score + ro

        while True:
          #When input y, roll again, when input n, dont roll again
          stop = input ("Would you like to roll again? [y/n]: ")
          if stop.lower() == 'n':
            continue
          else:
            break
        
        #Save score in the array
        current_player.score += score
        print('{}: {}'.format(current_player, current_player.score))
        if current_player.score >= final_score:
          break
    #Display Array
    print(sorted_players)
  
  else:
    #something crazy happened. exit.
    print("Something went wrong. Exiting.")
    sys.exit(1)
      

if __name__ == '__main__':
  main()