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

    module Category
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
    end

    getter :name, :familiy, :category

    def initialize(@name : String, @familiy : Familiy, @category : Category)
    end
  end
end
