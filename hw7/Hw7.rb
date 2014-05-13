#Problem 1
def createArrayOfRandomsUptoTen
	var = Array.new(100)
	0.upto(99)  {|i| var[i] = rand(11)}
	var
end


#Problem 2

def show(vector)
	print "["
	vector.each_index do |i|
		print vector[i]
		if i == vector.length - 1
			print "]"
			puts
		elsif i > 0
			print ", "
		end
	end
end


#Problem 3

def histogram(vector)
	vector.each_index do |i|
		print i, "  "
		vector[i].times {print "*"}
		puts
	end
end


#Problem 4

def mean(vector)
	sum = 0
	vector.each {|number| sum += number}
	sum.to_f / vector.length
end


#Problem 5

def squareMean(vector)
	sum = 0
	vector.each {|number| sum += number * number}
	sum.to_f / vector.length
end

def sigma(vector)
	meanSquaredValue = mean(vector) * mean(vector)
	squareMeanValue = squareMean(vector)
	Math.sqrt(squareMeanValue - meanSquaredValue)
end


#Problem 6

def sigma_mean(vector)
	return mean(vector), sigma(vector)
end


#Problem 7

def bubbleSort(vector)
	if vector.length <= 1
		return vector  
	end
	swapped = true
	while swapped do
		swapped = false
		0.upto(vector.length-2) do |i|
			if vector[i] > vector[i+1]
				vector[i], vector[i+1] = vector[i+1], vector[i]
				swapped = true
			end
		end 
	end
  vector
end

def sort(vector)
	bubbleSort(vector.dup)
end


#Problem 8

def binarysearch(vector, item)
	low = 0
	high = vector.length - 1
	while low <= high
		mid = (low + high) / 2
		case
			when vector[mid] > item then high = mid - 1
			when vector[mid] < item then low = mid + 1
			else return mid
		end
	end
	-1
end


#Problem 9

def minmax(vector)
	min = vector[0]
	max = vector[0]
	
	vector.each do |item|
		if min > item
			min = item
		end
		if max < item
			max = item
		end
	end
	
	return min, max
end


#Problem 10

randArray = createArrayOfRandomsUptoTen

0.upto(99) do |i|
	print randArray[i]

	if i % 10 == 9
		puts
	elsif  i < 99
		print ", "
	end
end

puts
puts

show([1,2,3,4,5,6])

puts
puts

histogram([1,2,3,5,4,2])

puts
puts

print "mean of [1,2,3,4,5,6,7] = #{mean([1,2,3,4,5,6,7])}"

puts
puts

puts "sigma of [1,2,3,2,1] = #{sigma([1,2,3,2,1])}"
print "sigma of [1,3,1,3,1,3] = #{sigma([1,3,1,3,1,3])}"

puts
puts

aMean, stdDev = sigma_mean([1,2,3,2,1])
print "mean, sigma of [1,2,3,2,1] = #{aMean}, #{stdDev}"

puts
puts

testvector = [1,2,3,2,1]
sortedvector = sort(testvector)

print "testvector = #{testvector}, sortedvector = #{sortedvector}"

puts
puts

print "index of first \"2\" inside sortedvector is #{binarysearch(sortedvector, 2)}"

puts
puts

print "minmax of [1,0,3,2,4] = #{minmax([1,0,3,2,4])}"

puts
puts
		
		
		
		
	

	
	

		
	