module RapidMutation
  class SideBar
    getter :texture, :sprite

    def initialize
      @texture = SF::Texture.from_file("resources/sidebar/mutation.jpg", SF.int_rect(0, 0, 1024, 1024))
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
