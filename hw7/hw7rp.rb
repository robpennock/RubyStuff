#hw7
#1
def randarray(n) 
	r = Array.new(10){rand(1 .. n)} 
end
#2
def show(n) 
	n.length.times do |i| 
		print ' ', n[i] 
	end 
end
#3
def hist(v)
	v.each_index do |i|
		v[i].times {print "*"}
		puts
	end
end
#4 
def mean(vec)
	sum = 0
	vec.each_index do |i|
		sum += i
	end
	return (sum.to_f / vec.length)
end
#5
#helper funct for sigma
def varsquare(v)
	sum = 0
	v.each_index do |i|
		sum += (i * i)
	end
	return sum.to_f / v.length
end
#helper function for sigma
def meansquare(v)
	return mean(v) * mean(v)
end

def sigma(v)
	return Math.sqrt(varsquare(v) - meansquare(v))
end
#6
def mean_sigma(v)
	return mean(v), sigma(v)
end

#7
#implements a bubble sort
#not efficient but easy
#basic algorithm found
	#http://jlarusso.github.io/blog/2013/04/30/sorting-algorithms-in-ruby/
def sort(vec)
    #must use each_index, not just each
    vec.each_index do |i|
    	(vec.length - i - 1).times do |j|
        	if vec[j] > vec[j + 1]
        		vec[j], vec[j + 1] = vec[j+ 1], vec[j]
		end
    	end
    end
end

#8
#implements the iterative binary search alg used in procedural hw
def binarysearch(v, key)
	low = 0
	high = v.length - 1
	while low <= high
		mid = (low + high) / 2
		#was having trouble with if/else so went with case statement
		case
			when (v[mid] < key)     
                                low = mid + 1
			when (v[mid] > key)  
				high = mid - 1
			else 
				return mid
		end
	end
	-1	#if key not found
end

#10
#not the most efficient algorithm but boy it looks pretty in 2 lines
def minmax(v)
	v = v.sort
	return v.first, v.last
end

def main
	unsorted_array = ([2,7,2,898,3,56,1,0,45])
	sorted_array = ([1,2,3,4,5,6,7,8,9,10])

	puts "beginning main program"
	print "unsorted_array = " + unsorted_array.to_s
	puts "\n\n"
	print "sorted_array = " + sorted_array.to_s
	puts "\n\n"
	puts "running random array generator \n"
	z = randarray(25)
	print(z)
	puts"\n\n";	
	puts "producing histogram based on randarray \n"
	hist(z);
	puts("using z for mean and sigma demo")
	print z
	puts "\n"
	puts "mean(z)";
	puts mean(z)
	puts "\n"
	puts "sigma (z)";
	puts sigma(z);
	puts"\n"
	puts "mean_sigma(z)"
	print mean_sigma(z)
	puts "\n"	
	puts"sorting unsorted_array"
	print unsorted_array
	puts "\n\n"
	print sort(unsorted_array)
	puts"\n"
	puts "binary_search(sorted_array, 7)"
	print "sorted_array = "
	print sorted_array
	puts"\n"
	puts "key is: " +  binarysearch(sorted_array, 7).to_s
	puts"\n"
	puts "minmax (z)"
	print minmax(z)
	puts "\n"
	0
end	
