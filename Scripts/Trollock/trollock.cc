#include <iostream>
#include <stdio.h>
#include <SFML/Graphics.hpp>
#include <SFML/Audio.hpp>

int main()
{
  sf::RenderWindow window(sf::VideoMode(1, 1), "Try to confloose me");
  int cpt = 0;
  while (window.isOpen())
  {
    sf::Event event;
    while (window.pollEvent(event))
    {
      if (event.type == sf::Event::LostFocus
         || sf::Keyboard::isKeyPressed(sf::Keyboard::LShift)
         || sf::Keyboard::isKeyPressed(sf::Keyboard::RShift))
      {
        if (!cpt)
        {
          popen("vlc ~/Scripts/Trollock/trololo.wav", "r");
          popen("epi3lock -i ~/Scripts/Trollock/trololo.png", "r");
          cpt++;
        }
      }
    }
  }
}
