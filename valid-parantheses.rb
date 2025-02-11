# @param {String} s
# @return {Boolean}
def valid(s)

  # Have to initialize the hash table like this to use Strings instead of symbols
  map = {}
  map['('] = ')'
  map['{'] = '}'
  map['['] = ']'

  stack = []

  # Handle base cases
  if s.length % 2 == 1
    return false
  end

  # Iterate over the string, add corresponding bracket to stack, and pop as it comes off, should exit the loop cleanly with nothing left on the stack
  s.split("") do |char|
    if map.has_key?(char)
      stack << map[char]
    elsif stack.length > 0
      next_on_stack = stack.pop()
      if next_on_stack != char
        return false
      end
    else
      return false
    end
  end

  return stack.length == 0
end

if __FILE__ == $0
  input_one = "()"
  input_two = "(){}[{}]"
  input_three = "({)"
  input_four = "))"
  
  puts("Input one: #{valid(input_one)}")
  puts("Input two: #{valid(input_two)}")
  puts("Input three: #{valid(input_three)}")
  puts("Input four: #{valid(input_four)}")

end