module RapidMutation
  class Level
    getter :bg
    def initialize(bg_style : Background::Style, level_size_x : Int32, level_size_y : Int32)
      @bg = Background.new(bg_style)
    end
  end
end