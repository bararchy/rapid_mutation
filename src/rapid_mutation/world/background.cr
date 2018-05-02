module RapidMutation
  module World
    class Background
      getter :texture, :sprite

      def initialize(texture_path : String)
        @texture = SF::Texture.from_file(texture_path, SF.int_rect(0, 0, 1024 * 1024, 1024*1024))

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
end
