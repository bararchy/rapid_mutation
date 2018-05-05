require "../organism/organism.cr"

module RapidMutation
  class BasicChar < Organism
    getter :mutation_counter, :attributes, :name, :sprite
    property :health, :speed

    def initialize(texture_path : Array(String), @name : String = "", @health : Int32 = 10)
      @speed = 1
      @images = Array(SF::Image).new
      texture_path.each do |p|
        @images << SF::Image.from_file(p)
      end
      @texture = SF::Texture.from_file(texture_path.first)
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
      loop_texture
    end

    def loop_texture
      if @images.size > 1
        spawn do
          loop do
            @images.each do |i|
              @texture.update(i)
              Fiber.yield
              sleep 0.10
            end
            Fiber.yield
          end
        end
      end
    end

    def reset_sprite_position
      @sprite.origin = @texture.size / 2.0
      @sprite.scale = SF.vector2(0.9, 0.9)
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
