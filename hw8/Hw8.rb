#PROBLEM 1
class Triangle
	def initialize(a, b, c)
		@a = a
		@b = b
		@c = c
		strArgs = "Sides of length "+a.to_s + " "+ b.to_s+" and "+c.to_s+" do not form a triangle"
		raise ArgumentError, strArgs unless self.test?
	end
	
	def test?()
		sortedSides = sides.sort
		c = sortedSides.last
		a = sortedSides[0]
		b = sortedSides[1]
			
		return a + b > c
	end
	
	def perimeter()
		raise ArgumentError, 'perimeter cannot be calculated because, the sides of length #a #b and #c do not form a triangle' unless self.test?
		@a + @b + @c
	end
	
	def area()
		#Using Herons Formula 
		raise ArgumentError, 'area cannot be calculated because, the sides of length #a #b and #c do not form a triangle' unless self.test?
		s = (@a + @b + @c) / 2
		return Math.sqrt(s * (s - @a) * (s - @b) * (s - @c))
	end
	
	def equilateral?()
		@a == @b && @b == @c
	end
	
	def isosceles?()
		@a == @b || @a == @c || @b == @c
	end
	
	def scalene?()
		#Ruby wouldn't let me use the != not equal operator so I couldn't use
		#@a != @b && != @a != @c && @b != @c
		#but this is logicly equivalent
		!(@a == @b || @a == @c || @b == @c)
	end		
	
	def right?()
		sortedSides = sides.sort
		c = sortedSides.last
		a = sortedSides[0]
		b = sortedSides[1]
		
		#Satisfies the pythagorean theorem
		return a**2 + b**2 == c**2
	end
	
	def triangle?()
		self.test?
	end
	
	def sides()
		return @a, @b, @c
	end
	
	def to_s()
		sides
	end
end

t = Triangle.new(3,4,5)

print "triangle t = ", t.sides, ", perimeter = ", t.perimeter, ", area = ", t.area, ", 
	equilateral? ", t.equilateral?, ", isosceles? ", t.isosceles?, ", isosceles? ", t.isosceles?, ", scalene? ", t.scalene?, " right? ", t.right?, " triangle? ", t.triangle?
	
puts
puts

t = Triangle.new(4,4,4)

print "new triangle t = ", t.sides, ", perimeter = ", t.perimeter, ", area = ", t.area, ", 
	equilateral? ", t.equilateral?, ", isosceles? ", t.isosceles?, ", isosceles? ", t.isosceles?, ", scalene? ", t.scalene?, " right? ", t.right?, " triangle? ", t.triangle?
	
puts
puts

#t = Triangle.new(4,4,9) #this will throw an ArgumentError

puts
puts

#PROBLEM 2
triangleArray = [Triangle.new(3,4,5), Triangle.new(3,4,4), Triangle.new(4,4,4)]


trianglesArea = 0
triangleArray.each do |tri|
	trianglesArea += tri.area
end

print "The sum of the areas of the triangles: ", triangleArray, " = ", trianglesArea

puts
puts

ten = [1,2,3,4,5,6,7,8,9,10]
firstTenSquares = ten.collect{|x| x**2}

print "The first ten squares are ", firstTenSquares

puts

1.upto(20) do |i|
	if i % 10 == 1 then puts end
	if i % 2 == 0 
		print i, " is even; "
	else
		print i, " is odd; "
	end
end

puts
puts

puts "Printing out 10 * characters"
10.times do
	print "*"
end

puts
puts


puts "printing out all the numbers divisable by 5 from 100 to 200"
100.step(200, 5) do |i|
	print i, ", "
end

puts
puts
puts
puts

#PROBLEM 3
class Array
	def limited?(amin, amax)
		self.each do |item|
			if amin > item || amax < item then return false end
		end
		return true
	end
	
	def sorted?()
		increasing = false
		decreasing = false
		index = 0
		
		#skip past all the values that are equal to the previous value		
		self.each_index do |i|
			index = i
			if !(self[index] == self[index+1]) then break end
		end		
		
		lastItem = self[index+1]
		
		#figure out if the first pair of values not equal to each other is increasing or decreasing
		if self[index] <= self[index+1] 
			increasing = true
		else
			decreasing = true
		end
		
		index = index + 1
		
		#go through the rest of the array until you find a pair that does match the required pattern
		(index+1).upto(self.length-1) do |i|
			if (increasing && lastItem > self[i]) ||
				(decreasing && lastItem < self[i])
				return 0
			end
			lastItem = self[i]
		end
		
		#if they all patch the pattern return a integer representing the pattern		
		if increasing 
			return 1
		else
			return -1
		end
	end
end

print "[1,2,3,4,5] limited?(1,5) = ", [1,2,3,4,5].limited?(1,5)
puts
print "[1,2,3,4,5] limited?(2,6) = ", [1,2,3,4,5].limited?(2,6)

puts
puts

print "[1,1,2,3,3,3,4,5] sorted? = ", [1,1,2,3,3,3,4,5] .sorted?
puts
print "[5,5,4,3,2,2,1] sorted? = ",[5,5,4,3,2,2,1].sorted?
puts
print "[5,5,4,3,4,2,2,1] sorted? = ",[5,5,4,3,4,2,2,1].sorted?

puts
puts
puts
puts

#PROBLEM 4
class Sphere
	def initialize(radius)
		@radius = radius
	end
	
	def area()
		4*(@radius**2)*Math::PI
	end
	
	def volume()
		(4*(@radius**3)*Math::PI)/3
	end
end

class Ball < Sphere
	def initialize(radius, color)
		super(radius)
		@color = color
	end
end

class MyBall < Ball
	def initialize(radius, color, owner)
		super(radius, color)
		@owner = owner
	end
	
	def show()
		puts "Instance Variables:"
		puts "-From class MyBall:"
		puts "owner = #{@owner}"
		puts "-From MyBall super class Ball:"
		puts "color = #{@color}"
		puts "-From Ball super class Sphere:"
		puts "radius = #{@radius}"
	end
end

kensBall = MyBall.new(6.7, "white", "Kenneth")

puts "kensBall has..."
kensBall.show()
puts "kensBall has a surface area = #{kensBall.area}"
puts "kensBall has a volume = #{kensBall.volume}"

puts
puts

