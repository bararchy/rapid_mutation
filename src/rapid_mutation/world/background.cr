module RapidMutation
  class Background
    getter :texture, :sprite

    def initialize(@texture : SF::Texture)
      @texture.repeated = true
      @sprite = SF::Sprite.new(@texture)
    end

    def next
    end

    def position
      @sprite.position
    end

    def position(pos : SF::Vector2)
      @sprite.position = pos
    end
  end
end
