def average(salary)
  max_salary = 0
  min_salary = Float::INFINITY
  num_sal = salary.length - 2
  total = 0
  salary.each do |sal|
    total += sal
    min_salary = [min_salary, sal].min
    max_salary = [max_salary, sal].max
  end
  (total - min_salary - max_salary)/(num_sal * 1.0)
end

puts average([1, 2, 3, 4]) # 2.5
puts average([4000,3000,1000,2000]) # 2500
puts average([1000,2000,3000]) # 2000