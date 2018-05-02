module RapidMutation
  class MainEvent
    def initialize
      mode = SF::VideoMode.new(800, 600)
      @window = SF::RenderWindow.new(mode, "Rapid Mutation")
      @window.vertical_sync_enabled = true
      @npcs = Array(NPC::Generic).new
      5.times do
        npc = NPC::Generic.new("resources/pingu.png")
        @npcs << npc
      end
      @player = Player.new("resources/pingu.png")
      @background = World::Background.new("resources/grass/tilable-IMG_0044-grey.png")
      @main_view = @window.default_view.as(SF::View)
      @main_view.center = @player.position
    end

    def draw
      @window.clear SF::Color.new(0, 0, 0)
      @window.draw @background.sprite
      @main_view.center = @player.position
      @window.draw @player.sprite
      npc_random_move
      @npcs.each { |n| @window.draw n.sprite }
      @window.view = @window.default_view
      @window.display
    end

    def npc_random_move
      @npcs.each { |n| n.move([:up, :down, :right, :left].sample) }
    end

    def movment
      while SF::Keyboard.key_pressed?(SF::Keyboard::W)
        @player.move(:up)
        if SF::Keyboard.key_pressed?(SF::Keyboard::A)
          @player.move(:left)
        elsif SF::Keyboard.key_pressed?(SF::Keyboard::D)
          @player.move(:right)
        end
        draw
      end
      while SF::Keyboard.key_pressed?(SF::Keyboard::A)
        @player.move(:left)
        if SF::Keyboard.key_pressed?(SF::Keyboard::S)
          @player.move(:down)
        elsif SF::Keyboard.key_pressed?(SF::Keyboard::W)
          @player.move(:up)
        end
        draw
      end
      while SF::Keyboard.key_pressed?(SF::Keyboard::S)
        @player.move(:down)
        if SF::Keyboard.key_pressed?(SF::Keyboard::A)
          @player.move(:left)
        elsif SF::Keyboard.key_pressed?(SF::Keyboard::D)
          @player.move(:right)
        end
        draw
      end
      while SF::Keyboard.key_pressed?(SF::Keyboard::D)
        @player.move(:right)
        if SF::Keyboard.key_pressed?(SF::Keyboard::S)
          @player.move(:down)
        elsif SF::Keyboard.key_pressed?(SF::Keyboard::W)
          @player.move(:up)
        end
        draw
      end
    end

    def run
      while @window.open?
        draw
        while event = @window.poll_event
          draw
          case event
          when SF::Event::Closed
            @window.close
          when SF::Event::KeyPressed
            case event.code
            when .w?
              movment
            when .a?
              movment
            when .s?
              movment
            when .d?
              movment
            when .space?
              @player.speed += 1
            when .escape?
              @window.close
            end
          end
        end
      end
    end
  end
end
