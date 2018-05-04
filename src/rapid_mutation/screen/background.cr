module RapidMutation
  class Background
    enum Style
      Forest
      Desert
      Swamp
      Mountains
    end

    getter :texture, :sprite

    def initialize(style : Background::Style, level_size_x : Int32, level_size_y : Int32)
      case style
      when Style::Forest
        @texture = SF::Texture.from_file("resources/grass/tilable-IMG_0044-grey.png", SF.int_rect(-level_size_x, -level_size_y, level_size_x, level_size_y))
      else
        raise "Style Not Supported"
      end
      @texture.repeated = true
      @sprite = SF::Sprite.new(@texture)
    end

    def position
      @sprite.position
    end

    def position=(pos : SF::Vector2)
      @sprite.position = pos
    end
  end
end
