require "./basic_char/basic_char.cr"

module RapidMutation
  class Player < BasicChar
    def stats : SF::Text
      @attributes.each do |at|
      end
      text = SF::Text.new

      # select the font
      # text.font = font # font is a SF::Font

      # set the string to display
      text.string = "Hello world"

      # set the character size
      text.character_size = 24 # in pixels, not points!

      # set the color
      text.color = SF::Color::Red

      # set the text style
      text.style = (SF::Text::Bold | SF::Text::Underlined)
      text
    end
  end
end
