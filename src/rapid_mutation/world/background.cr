module RapidMutation
  module World
    class Background
      getter :texture, :sprite

      def initialize(texture_path : String)
        @texture = SF::Texture.from_file(texture_path)
        @sprite = SF::Sprite.new(@texture)
      end
    end
  end
end
