require "./basic_char/basic_char.cr"

module RapidMutation
  class Player < BasicChar
    def continous_movment
      # Right
      while SF::Keyboard.key_pressed?(SF::Keyboard::D)
        player.move(:right)
        if SF::Keyboard.key_pressed?(SF::Keyboard::S)
          player.move(:down)
        elsif SF::Keyboard.key_pressed?(SF::Keyboard::W)
          player.move(:up)
        end
        draw(player, background)
      end
      # Down
      while SF::Keyboard.key_pressed?(SF::Keyboard::S)
        player.move(:down)
        if SF::Keyboard.key_pressed?(SF::Keyboard::A)
          player.move(:left)
        elsif SF::Keyboard.key_pressed?(SF::Keyboard::D)
          player.move(:right)
        end
        draw(player, background)
      end
      # Right
      while SF::Keyboard.key_pressed?(SF::Keyboard::A)
        player.move(:left)
        if SF::Keyboard.key_pressed?(SF::Keyboard::S)
          player.move(:down)
        elsif SF::Keyboard.key_pressed?(SF::Keyboard::W)
          player.move(:up)
        end
        draw(player, background)
      end
    end
  end
end
