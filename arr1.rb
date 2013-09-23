class DataSource

	def arr0
		[9, 2, 3, 4, 3]
	end

	def arr1
		[5, 22, 29, 39, 19, 51, 78, 96, 84]
	end

	def arr3
		[6, 45, 23, 65, 17, 48, 97, 32, 18, 9, 88, 123]
	end

end

class Test

	def output_arr(data)
		arr = data
		i = 0
		while (i < arr.size)
			puts arr[i]
			i = i + 1
		end
	end

	def simple_sort(data)
		arr = data
		puts "The old array is: " + arr.inspect
		i = 0
		while (i < arr.size )
			if arr[i] > arr[i + 1]
				breakpoint = i
				break
			else
				i = i + 1
			end
		end
		puts "Breakpoint is: " + breakpoint.to_s

		first = arr[breakpoint]
		second = arr[breakpoint + 1]

		#swap values
		arr[breakpoint] = second
		arr[breakpoint + 1] = first
		puts "The new array is: " + arr.inspect
	end

	def custom_sort(data)
		arr = data
		# puts arr.inspect
		i = 0
		sort_ary = []
		while (i < (arr.size - 1))
			first = arr[i]
			second = arr[i + 1]
			if first < second
				i = i + 1
			else
				arr[i] = second
				arr[i + 1] = first
				i = 0
			end
		end
		# puts arr.inspect
		arr
	end

	def split_array(data)
		arr = custom_sort(data)
		size = arr.count + 1
		if size % 2 == 0
			puts "There is an even number of elements in the array(#{size})."
			split_array_output(arr, size)
		else
			puts "There is an uneven amount of elements in the array(#{size})."
			arr[arr.size] = ""
			size = size + 1
			split_array_output(arr, size)
		end
	end

	private

	def split_array_output(arr, size)
		small_ary = []
		big_ary = []
		small_ary = arr[0..(size / 2 -1)]
		big_ary = arr[(size/2-1)..size]
		puts small_ary.to_s + " < " + big_ary.to_s
	end
	
end

data = DataSource.new
test = Test.new

puts "Testing simple_sort with arr1"
test.simple_sort(data.arr1)

puts "Testing split_array with arr3"
puts test.split_array(data.arr3)

puts "Testing custom_sort with arr3"
puts test.custom_sort(data.arr3)


