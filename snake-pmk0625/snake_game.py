
import pygame
from snakeplayer import *
from snakefood import *
from scene import *
import sys

def display_info():
    """ Print out information about the display driver and video information. """
    print('The display is using the "{}" driver.'.format(pygame.display.get_driver()))
    print('Video Info:')
    print(pygame.display.Info())  

def main():
    print('hello world!')
    pygame.init()
    
    clock = pygame.time.Clock()
    display_info()
    window_size = (660, 660)

    screen = pygame.display.set_mode((window_size), 0, 32)
    title = 'Snake++'
    pygame.display.set_caption(title)
    end = 'Press any key to exit'
    pygame.display.set_caption(end)

    snake = SnakePlayer(screen)
    food = SnakeFood(screen)
    bound = GameLevel(screen, snake, food)

    scoreFont = pygame.font.SysFont("monospace", 16)
    #pygame.mixer.music.load("hiccup.mp3")

    scene_list = [Scene(screen), TitleScene(screen, title, rgbcolors.green, 72),
    GameLevel(screen, snake, food), EndScene(screen, end, rgbcolors.green4, 62)]

    for scene in scene_list:
        while scene.is_valid():
            clock.tick(10)
            snake.move()
            for e in pygame.event.get():
                scene.process_event(e)
            if (snake.head_position() == food._position):
                #pygame.mixer.music.play(0, 0.0, 0)
                snake._length += 1
                snake._score += 1
                food.random_position()
                print('Snake ate the Food!')
            #if not pygame.Rect.contains(bound._boundary_rect, snake.head_position()):
            #    snake.reset()
            food.draw()
            scene.update()
            scene.draw()
            score = scoreFont.render("Score {0}".format(snake._score), 1, rgbcolors.black)
            screen.blit(score, (5, 10))
            pygame.display.update()
    pygame.quit()