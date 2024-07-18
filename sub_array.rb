def sub_array(input_array, start, stop)
  len = stop - start
  return input_array[start] if len <= 1
  sums = []
  first = input_array.sum
  sums << first
  sums << sub_array(input_array, start, stop - 1)
  sums << sub_array(input_array, start + 1, stop)
  puts sums.to_s
  return sums.max
end

def max_sub_array(nums)
  len = nums.length
  sums = []
  for i in 0...len do
    this_i = nums[i]
    i_sums = [this_i]
    for j in (i + 1)...len do
      this_i += nums[j]
      i_sums << this_i
    end
    sums << i_sums.max
  end
  return sums.max
end

def print_response(response, name, run_time)
  puts "Max Sum: #{response} | #{name} | #{run_time * 1000}"
end

def run_compare(input_array)
  start = Time.now
  response = sub_array(input_array, 0, input_array.length - 1)
  stop = Time.now
  print_response(response, 'better', stop - start)
  start = Time.now
  response = max_sub_array(input_array)
  stop = Time.now
  print_response(response, 'too slow', stop - start)
end

run_compare([-2,1,-3,4,-1,2,1,-5,4])