require "./basic_char/basic_char.cr"

module RapidMutation
  class Player < BasicChar
    def stats : SF::Text
      headline = get_text
      headline.string = <<-EOF
      ~~STATS~~
      Health: #{@health}
      Mutation Cycles: #{@mutation_counter}
      ~~Attributes~~
      #{@attributes.map { |a| a.inspect }.join("\n")}
      EOF

      headline
    end

    def get_text : SF::Text
      text = SF::Text.new
      # select the font
      text.font = SF::Font.from_file("resources/fonts/Ubuntu-MI.ttf")
      # set the character size
      text.character_size = 30 # in pixels, not points!
      # set the color
      text.color = SF::Color::White
      text
    end
  end
end
