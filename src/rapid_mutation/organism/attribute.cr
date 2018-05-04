require "uuid"

module RapidMutation
  class Attribute
    enum Familiy
      Extremity
      Skelatal
      Cerebral
      DNA
      Body
      Internal
    end
    getter :name, :familiy, :category

    def initialize(@name : String, @familiy : Familiy, @category : Category)
    end

    def inspect
      <<-EOF
      name: #{@name}
      familiy: #{@familiy}
      category: #{@category.inspect}
      EOF
    end

    def self.random_basic
      attr = [
        {name: "beak", familiy: Familiy::Extremity, category: Category.new(size: Size::Small, strength: Strength::Weak)},
        {name: "posion sting", familiy: Familiy::Extremity, category: Category.new(size: Size::Small, strength: Strength::Weak)},
        {name: "claw", familiy: Familiy::Extremity, category: Category.new(size: Size::Small, strength: Strength::Weak)},
        {name: "poisonous", familiy: Familiy::Internal, category: Category.new(efficiency: Efficiency::Low, strength: Strength::Weak)},
        {name: "big frame", familiy: Familiy::Body, category: Category.new(size: Size::Big)},
      ].sample
      self.new(attr[:name], attr[:familiy], attr[:category])
    end
  end
end
