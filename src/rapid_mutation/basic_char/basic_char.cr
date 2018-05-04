require "../organism/organism.cr"

module RapidMutation
  class BasicChar < Organism
    getter :sprite, :mutation_counter, :attributes, :name
    property :health

    def initialize(texture_path : String, @name : String = "", @health : Int32 = 10)
      @speed = 1
      @texture = SF::Texture.from_file(texture_path)
      @sprite = SF::Sprite.new(@texture)
      @mutation_counter = 0_i64
      @attributes = Array(Attribute).new

      attr1 = Attribute.random_basic
      attr2 = Attribute.random_basic
      until attr1 != attr2
        attr2 = Attribute.random_basic
      end
      [attr1, attr2].each { |a| @attributes << a }

      reset_sprite_position
    end

    def reset_sprite_position
      @sprite.origin = @texture.size / 2.0
      @sprite.scale = SF.vector2(0.2, 0.2)
      @sprite.position = SF.vector2(250, 300)
    end

    def position
      @sprite.position
    end

    def position(pos : SF::Vector2)
      @sprite.position = pos
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
