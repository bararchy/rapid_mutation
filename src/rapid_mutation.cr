require "./rapid_mutation/**"
require "crsfml"

module RapidMutation
  mode = SF::VideoMode.new(800, 600)
  window = SF::RenderWindow.new(mode, "Rapid Mutation")
  window.vertical_sync_enabled = true
  player = Player.new("resources/pingu.png")
  speed = 20.0

  while window.open?
    while event = window.poll_event
      case event
      when SF::Event::Closed
        window.close
      when SF::Event::KeyPressed
        case event.code
        when .w?
          player.move(:up)
        when .a?
          player.move(:left)
        when .s?
          player.move(:down)
        when .d?
          player.move(:right)
        when .space?
          player.speed += 1
        when .escape?
          window.close
        end
      end
    end

    window.clear SF::Color.new(0, 0, 0)
    window.draw player.sprite
    window.display
  end
end
