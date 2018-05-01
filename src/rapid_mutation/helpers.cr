module RapidMutation
  module Move
    extend self

    def up(speed = 0)
      SF.vector2(0, -1 + -speed)
    end

    def down(speed = 0)
      SF.vector2(0, 1 + speed)
    end

    def right(speed = 0)
      SF.vector2(1 + speed, 0)
    end

    def left(speed = 0)
      SF.vector2(-1 + -speed, 0)
    end
  end
end
