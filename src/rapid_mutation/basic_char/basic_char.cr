require "../organism/organism.cr"

module RapidMutation
  class BasicChar < Organism
    getter :sprite, :mutation_counter
    property :speed

    def initialize(texture_path : String, @speed = 1)
      @texture = SF::Texture.from_file(texture_path)
      @sprite = SF::Sprite.new(@texture)
      @mutation_counter = 0_i64
      @attributes = BasicAttributes.new
      reset_sprite_position
    end

    def reset_sprite_position
      @sprite.origin = @texture.size / 2.0
      @sprite.scale = SF.vector2(0.2, 0.2)
      @sprite.position = SF.vector2(250, 300)
    end

    def move(direction : Symbol)
      case direction
      when :up
        @sprite.move Move.up(@speed)
      when :down
        @sprite.move Move.down(@speed)
      when :right
        @sprite.move Move.right(@speed)
      when :left
        @sprite.move Move.left(@speed)
      end
    end
  end
end
