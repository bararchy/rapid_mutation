module RapidMutation
  class Background
    enum Style
      Forest
      Desert
      Swamp
      Mountains
    end

    getter :sprite

    @sprite : SF::RectangleShape

    def initialize(style : Background::Style, level_size_x : Int32, level_size_y : Int32)
      case style
      when Style::Forest
        rectangle = SF::RectangleShape.new(SF.vector2(level_size_x, level_size_y))

        texture = SF::Texture.from_file("resources/grass/tilable-IMG_0044-grey.png")
        texture.repeated = true
        rectangle.set_texture(texture, reset_rect: false)
      else
        raise "Style Not Supported"
      end

      @sprite = rectangle
    end

    def position
      @sprite.position
    end

    def position=(pos : SF::Vector2)
      @sprite.position = pos
    end
  end
end
