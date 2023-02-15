
class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if (@side1 <= 0) || (@side2 <= 0) || (@side3 <= 0)
      raise TriangleError, "All sides must be greater than 0."
    end

    sides = [@side1, @side2, @side3].sort

    if (sides[0] + sides[1] <= sides[2])
      raise TriangleError, "Invalid triangle. The sum of any two sides must be greater than the third."
    end

    if (@side1 == @side2) && (@side2 == @side3)
      :equilateral
    elsif (@side1 == @side2) || (@side2 == @side3) || (@side1 == @side3)
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end
end
