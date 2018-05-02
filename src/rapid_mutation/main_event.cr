module RapidMutation
  class MainEvent
    

    def initialize
      mode = SF::VideoMode.new(800, 600)
      @window = SF::RenderWindow.new(mode, "Rapid Mutation")
      @window.vertical_sync_enabled = true
    end

    def draw(player, background)
      @window.clear SF::Color.new(0, 0, 0)
      @window.draw background.sprite
      @window.draw player.sprite
      @window.display
    end

    def run
      
      player = Player.new("resources/pingu.png")
      background = World::Background.new("resources/grass/tilable-IMG_0044-grey.png")
      speed = 20.0

      while @window.open?
        while event = @window.poll_event
          case event
          when SF::Event::Closed
            @window.close
          when SF::Event::KeyPressed
            case event.code
            when .w?
              while SF::Keyboard.key_pressed?(SF::Keyboard::W)
                player.move(:up)
                if SF::Keyboard.key_pressed?(SF::Keyboard::A)
                  player.move(:left)
                elsif SF::Keyboard.key_pressed?(SF::Keyboard::D)
                  player.move(:right)
                end
                draw(player, background)
              end
            when .a?
              while SF::Keyboard.key_pressed?(SF::Keyboard::A)
                player.move(:left)
                if SF::Keyboard.key_pressed?(SF::Keyboard::S)
                  player.move(:down)
                elsif SF::Keyboard.key_pressed?(SF::Keyboard::W)
                  player.move(:up)
                end
                draw(player, background)
              end
            when .s?
              while SF::Keyboard.key_pressed?(SF::Keyboard::S)
                player.move(:down)
                if SF::Keyboard.key_pressed?(SF::Keyboard::A)
                  player.move(:left)
                elsif SF::Keyboard.key_pressed?(SF::Keyboard::D)
                  player.move(:right)
                end
                draw(player, background)
              end
            when .d?
              while SF::Keyboard.key_pressed?(SF::Keyboard::D)
                player.move(:right)
                if SF::Keyboard.key_pressed?(SF::Keyboard::S)
                  player.move(:down)
                elsif SF::Keyboard.key_pressed?(SF::Keyboard::W)
                  player.move(:up)
                end
                draw(player, background)
              end
            when .space?
              player.speed += 1
            when .escape?
              @window.close
            end
          end
        end
        draw(player, background)
      end
    end
  end
end
