import random
import pygame
import rgbcolors
import sys

up = (0, -1)
down = (0, 1)
left = (-1, 0)
right = (1, 0)

class SnakePlayer:
    def __init__(self, screen):
        self._screen = screen
        (w, h) = screen.get_size()
        self._length = 1
        self._position = [(330, 330)]
        self._direction = random.choice([up, down, left, right])
        self._score = 0
    
    def head_position(self):
        return self._position[0]

    def turn(self, point):
        if self._length > 1 and (point[0]*-1, point[1]*-1) == self._direction:
            return
        else:
            self._direction = point

    def move(self):
        current = self.head_position()
        x, y = self._direction
        new = (((current[0]+(x*30))%660), (current[1]+(y*30))%660)
        if len(self._position) > 2 and new in self._position[2:]:
            self.reset()
            print('Snake Collided with itself')
        else:
            self._position.insert(0, new)
            if len(self._position) > self._length:
                self._position.pop()

    
    def reset(self):
        self._length = 1
        self._position = [(330, 330)]
        self._direction = random.choice([up, down, left, right])
        self._score = 0

    def draw(self):
        for position in self._position:
            _avatar = pygame.Rect((position[0], position[1]), (30, 30))
            pygame.draw.rect(self._screen, rgbcolors.green, _avatar)

    def process_event(self, event):
        #for event in pygame.event.get():
            #if event.type == pygame.QUIT:
                #pygame.quit()
                #sys.exit()
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_RIGHT:
                print('right arrow key pressed!')
                self.turn(right)
            elif event.key == pygame.K_LEFT:
                print('left arrow key pressed!')
                self.turn(left)
            elif event.key == pygame.K_UP:
                print('up arrow key pressed!')
                self.turn(up)
            elif event.key == pygame.K_DOWN:
                print('down arrow key pressed!')
                self.turn(down)
        