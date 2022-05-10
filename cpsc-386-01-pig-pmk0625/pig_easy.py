#!/usr/bin/env python3

import random

def roll():
    return random.randint(1,6)

def turns(player):
    point = 0
    turn = 0
    input("Press enter to begin")
    while turn == 1:
        r = roll()
        print('You rolled {}'.format(r))
        if r == 1:
            point = 0
            turn = 0
        else:
            point += r
            print('Your total: {}'.format(point))
            stop = input("Would you like to roll again? [y/n]:")
            if stop.lower() == 'n':
                turn = 0
            else:
                turn = 1
        print("Your turn is over!")
        return point

def main():
    final_score = 100
    p1 = 0
    p2 = 0
    p3 = 0
    p4 = 0
    while p1 < final_score and p2 < final_score and p3 < final_score and p4 < final_score:
        print("Player points are: " + str(p1))
        print("Player points are: " + str(p2))
        r = turns(1)
        p1 += r
        print("Player points are: " + str(p1))
        print("Player points are: " + str(p2))
    if p1 > p2:
        print("Player one wins!")
    elif p2>p1:
        print("Player two wins!")
    else:
        print("Tie game")

main()
turns(1)
turns(2)

if __name__ == '__main__':
  main()