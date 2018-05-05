module RapidMutation
  class MainEvent
    def initialize
      mode = SF::VideoMode.new(1920, 1080)
      @window = SF::RenderWindow.new(mode, "Rapid Mutation")
      @window.vertical_sync_enabled = true
      @npcs = Array(NPC::Generic).new
      5.times do
        npc = NPC::Generic.new(["resources/npc/prey_slug1.png"])
        @npcs << npc
      end
      @player = Player.new(Dir.glob("resources/basic_form/*"))
      @side_bar = SideBar.new
      @level = Level.new(Background::Style::Forest, 1024 * 1024, 1024 * 1024)
      @main_view = @window.default_view.as(SF::View)
      @main_view.viewport = SF.float_rect(0, 0, 0.85, 1)
      @stats_view = SF::View.new
      @stats_view.viewport = SF.float_rect(0.85, 0, 0.25, 1)
      @main_view.center = @player.position
    end

    def draw
      @window.clear SF::Color.new(0, 0, 0)
      @main_view.center = @player.position
      @window.view = @main_view
      @window.draw @level.bg.sprite
      @window.draw @player.sprite
      npc_random_move
      @npcs.each { |n| @window.draw n.sprite }
      @window.view = @stats_view
      @window.draw @side_bar.sprite
      @window.draw @player.stats
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
        Fiber.yield
      end
      while SF::Keyboard.key_pressed?(SF::Keyboard::A)
        @player.move(:left)
        if SF::Keyboard.key_pressed?(SF::Keyboard::S)
          @player.move(:down)
        elsif SF::Keyboard.key_pressed?(SF::Keyboard::W)
          @player.move(:up)
        end
        Fiber.yield
      end
      while SF::Keyboard.key_pressed?(SF::Keyboard::S)
        @player.move(:down)
        if SF::Keyboard.key_pressed?(SF::Keyboard::A)
          @player.move(:left)
        elsif SF::Keyboard.key_pressed?(SF::Keyboard::D)
          @player.move(:right)
        end
        Fiber.yield
      end
      while SF::Keyboard.key_pressed?(SF::Keyboard::D)
        @player.move(:right)
        if SF::Keyboard.key_pressed?(SF::Keyboard::S)
          @player.move(:down)
        elsif SF::Keyboard.key_pressed?(SF::Keyboard::W)
          @player.move(:up)
        end
        Fiber.yield
      end
    end

    def draw_loop
      loop do
        draw
        Fiber.yield
        break unless @window.open?
      end
    end

    def run
      spawn draw_loop
      while @window.open?
        while event = @window.poll_event
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
            when .escape?
              @window.close
            end
          end
          Fiber.yield
        end
        Fiber.yield
      end
    end
  end
end
