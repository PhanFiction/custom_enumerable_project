module Enumerable
  # Your code goes here
  
  # returns true if block never returns false or nil
  def my_all?
    self.my_each do |elem|
      return false unless yield elem
    end
    true
  end

  # return true if one more elem is not false or nil
  def my_any?
    is_true = false
    self.my_each do |elem|
      is_true = !is_true if yield elem
    end
    is_true
  end

  def my_count
    total = 0
    return self.length unless block_given?

    self.my_each do |elem|
      total += 1 if yield elem
    end
    total
  end

  def my_each_with_index
    length = 0
    arr = []
    self.my_each do |elem|
      yield(elem, length)
      length += 1
    end
    self
  end

  def my_inject(initial_value)
    self.my_each do |elem|
      initial_value = yield(initial_value, elem)
    end
    initial_value
  end

  def my_map
    res = []
    self.my_each do |elem|
      res << yield(elem) # yield elem is evaluated by calling the block with elem 
    end
    res # last expression to be evaluated
  end

  # returns true if the block does not return true for all elements
  def my_none?
    self.my_each do |elem|
      return false if yield elem
    end
    true
  end

  def my_select
    result = []
    self.each do |elem|
      result << elem if yield elem
    end
    result
  end

end

# false => false => false 

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each_index do |index|
      yield(self[index])
    end
    self
  end
end
