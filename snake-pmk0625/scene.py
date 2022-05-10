
import pygame
import rgbcolors


class Scene:
    def __init__(self, screen):
        self._screen = screen
        self._background = pygame.Surface(self._screen.get_size())
        self._background.fill(rgbcolors.gray)
        self._is_valid = True
        press_any_key_font = pygame.font.Font(pygame.font.get_default_font(), 18)
        self._press_any_key = press_any_key_font.render('Press ESC for next.', True, rgbcolors.black)
        (w, h) = self._screen.get_size()
        self._press_any_key_pos = self._press_any_key.get_rect(center=(w/2, h - 50))
    
    def draw(self):
        self._screen.blit(self._background, (0, 0))
        self._screen.blit(self._press_any_key, self._press_any_key_pos)
    
    def process_event(self, event):
        if event.type == pygame.QUIT:
            print('Good Bye!')
            self._is_valid = False
        if event.type == pygame.KEYDOWN and event.key == pygame.K_ESCAPE:
            print('Bye bye!')
            self._is_valid = False

    def is_valid(self):
        return self._is_valid
    
    def update(self):
        pass

class TitleScene(Scene):
    def __init__(self, screen, title, title_color, title_size):
        super().__init__(screen)
        self._background.fill(rgbcolors.pink)
        title_font = pygame.font.Font(pygame.font.get_default_font(), title_size)
        self._title = title_font.render(title, True, title_color)
        press_any_key_font = pygame.font.Font(pygame.font.get_default_font(), 18)
        self._press_any_key = press_any_key_font.render('Press any key.', True, rgbcolors.black)
        (w, h) = self._screen.get_size()
        self._title_pos = self._title.get_rect(center=(w/2, h/2))
        self._press_any_key_pos = self._press_any_key.get_rect(center=(w/2, h - 50))
    
    def draw(self):
        super().draw()
        self._screen.blit(self._title, self._title_pos)
        self._screen.blit(self._press_any_key, self._press_any_key_pos)
    
    def process_event(self, event):
        super().process_event(event)
        if event.type == pygame.KEYDOWN:
            self._is_valid = False

class GameLevel(Scene):
    def __init__(self, screen, snake, food):
        super().__init__(screen)
        self._background.fill(rgbcolors.aquamarine)
        self._screen = screen
        self._snake = snake
        self._food = food
        (w, h) = self._screen.get_size()
        self._boundary_rect = pygame.Rect((0, 0), (w, h))
    
    def draw(self):
        super().draw()
        self._snake.draw()
        self._food.draw()
        self._draw_boundaries()

    def _draw_boundaries(self):
        (w, h) = self._screen.get_size()
        pygame.draw.rect(self._screen, rgbcolors.red, self._boundary_rect, (w//100), (w//200))
    
    def process_event(self, event):
        super().process_event(event)
        self._snake.process_event(event)


class EndScene(Scene):
    def __init__(self, screen, end, end_color, end_size):
        super().__init__(screen)
        self._background.fill(rgbcolors.pink)
        end_font = pygame.font.Font(pygame.font.get_default_font(), end_size)
        self._end = end_font.render(end, True, end_color)
        press_any_key_font = pygame.font.Font(pygame.font.get_default_font(), 18)
        self._press_any_key = press_any_key_font.render('Thank you for playing!', True, rgbcolors.black)
        (w, h) = self._screen.get_size()
        self._end_pos = self._end.get_rect(center=(w/2, h/2))
        self._press_any_key_pos = self._press_any_key.get_rect(center=(w/2, h - 50))
    
    def draw(self):
        super().draw()
        self._screen.blit(self._end, self._end_pos)
        self._screen.blit(self._press_any_key, self._press_any_key_pos)
    
    def process_event(self, event):
        super().process_event(event)
        if event.type == pygame.KEYDOWN:
            self._is_valid = False