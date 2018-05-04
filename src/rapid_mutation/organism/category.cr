module RapidMutation
  enum Size
    Small
    Big
    Medium
  end

  enum Strength
    Strong
    Weak
  end

  enum Durability
    High
    Low
  end

  enum Efficiency
    High
    Low
  end

  class Category
    getter :size, :strength, :durability, :efficiency

    def initialize(@size : Size? = nil, @strength : Strength? = nil, @durability : Durability? = nil, @efficiency : Efficiency? = nil)
    end
  end
end
