module RapidMutation
  class World
    @world_grid : Array(Array(Background))

    def initialize(@world_size_x : Int32, @world_size_y : Int32)
      @texture = SF::Texture.from_file("resources/grass/tilable-IMG_0044-grey.png")
      @world_grid = generate_world
    end

    def get_background_at(x, y)
      @world_grid[y][x].sprite
    end

    def generate_world
      world_grid = Array(Array(Background)).new
      # [
      #  [background_forest, background_forest],
      #  [background_forest, background_forest],
      #  [background_forest, background_forest],
      #  [background_forest, background_forest],
      #  [background_desert, background_desert],
      #  [background_desert, background_desert],
      #  [background_desert, background_desert],
      #  [background_desert, background_desert],
      # ]
      @world_size_y.times do
        layer = Array(Background).new
        @world_size_x.times do
          layer << Background.new(@texture)
        end
        world_grid << layer
      end
      world_grid
    end
  end
end
