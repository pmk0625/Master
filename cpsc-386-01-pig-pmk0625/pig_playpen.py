#!/usr/bin/env python3
import random
from time import sleep
import json

class SixSidedDie:
    def roll(self):
      return random.randint(1,6)

"""
      - Data members
      Name
      points or score
      roll_history
      wins
      losses
      id
      
      - Methods
      *play/roll/hold
      
"""
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
    
  
"""
    -Data Members
    Name
    points or score
    roll history
    wins
    losses
    id
  
    -Methods
    *play/roll/hold
"""
class AI:
  def __init__(self, id, other_player = None):
    self._id = id
    self._opponent = other_player
    self.score = 0
    self.wins = 0
    self.loses = 0
    self._roll_history = []
  def name(self):
    return 'Skynet'
  def id(self):
    return self._id
  def add_roll(self, roll):
    self._roll_history.append(roll)
  def roll_history(self):
    return ','.join(self.roll_history)
  def __str__(self):
    return self.name()
  def __repr__(self):
    return 'AI({})'.format(self._id)
  def what_to_do(self):
    n = random.randint(1,2)
    if self._opponent.score > self.score:
      return 'roll'
    if n == 1:
      return 'roll'
    else:
      return 'hold'

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

def main():
  die = SixSidedDie()
  num_players = int(input("How many players? [2-4] "))
  players = []
  
  if num_players < 1:
    # Error
    print("Whoa too few players")
    sys.exit(1)
  elif num_players == 1:
    # you v. skynet
    print('You are going to be playing against SkyNet! Prepare yourself.')
    name = input('What is the player\'s name? ')
    input('Ready to roll? Hit any key when ready!')
    r = die.roll()
    print('{} rolled {}'.format(name, r))
    u = Player(r, name)
    players = [u, AI(random.randint(1,6), u)]
  elif num_players >= 2 and num_players <= 4:
    # regular game
    for p in range(num_players):
      name = input('What is player {}\'s name? '.format(p+1))
      #name = names[p]
      input('Ready to roll? Hit any key when ready!')
      r = die.roll()
      print('{} rolled {}'.format(name, r))
      new_player = Player(r, name)
      players.append(new_player)
  else:
    #something crazy happened. exit.
    print("Something went wrong. Exiting.")
    sys.exit(1)

  sorted_players = sorted(players, key=lambda x: x.id())

  counter = 0
  pq = PlayerQueue(sorted_players)
  
  
  for current_player in pq:
    print(current_player)
    roll = die.roll()
    score = 0
    
    if roll == 1:
      print('Sorry you lost your turn! Next!!')
      continue
    else:
      print('You rolled {}'.format(roll))
      score = score + roll

      # restricted_input("the prompt?", "y", "n")
      while True:
        answer = input('Do you want to roll again? [y/n]')
        if answer == 'n':
          continue
        elif answer == 'y':
          print("Let's roll again...")
          break
        else:
          print('Please answer "y" or "n". Try again.')
          
      
    #input('Roll again? [y/n]')
    current_player.score += score
    print('{}: {}'.format(current_player, current_player.score))
    if current_player.score >= 10:
      #pq.stop()
      break

  print(sorted_players)
  
  #list_of_dictionaries = [x.__dict__ for x in sorted_players]
  #with open('saved_game_data.dat', 'w') as fh:
    # List of dictionaries
    #json.dump(list_of_dictionaries, fh)
  
      



if __name__ == '__main__':
  main()