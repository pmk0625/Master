import random
import pygame
import rgbcolors

class SnakeFood:
    def __init__(self, screen):
        self._screen = screen
        (w, h) = screen.get_size()
        self._position = (0, 0)
        self.random_position()
    
    def random_position(self):
        self._position = (random.randint(0, (10))*30, random.randint(0, (10))*30)
        print('Food has spawned')

    def draw(self):
        _food = pygame.Rect((self._position[0],self._position[1]),(30,30))
        pygame.draw.rect(self._screen, rgbcolors.red, _food)