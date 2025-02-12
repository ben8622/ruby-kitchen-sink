# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  # Use hash table to track # of occurences for each prefix
  hash_tbl = {}
  hash_tbl.default = 0 # set default to 0 to avoid null pointer errors

  # pre-populate the hash_tbl with the first elements pre-fixes
  hash_tbl = populate_hash(strs[0], hash_tbl)

  # skip first str, start populating hash table
  (1..strs.length-1).each do |i|
    str = strs[i]

    # if empty str, there is no prefix
    if(str == "")
      return ""
    end

    # if first char exists, populate, else there is no prefix
    first_char = str.slice(0..0)
    if hash_tbl.has_key?(first_char)
      hash_tbl = populate_hash(str, hash_tbl)
    else
      return ""
    end

  end

  puts(hash_tbl)

  answer = ""
  hash_tbl.each do |key, value|
    # skip if not all strings had prefix
    next if value != strs.length

    # else track longest 
    answer = if key.length > answer.length then key else answer end
  end


  return answer;
end

def populate_hash(str, hash_tbl)
  (0..str.length-1).each do |i|
    sub_str = str.slice(0..i)
      hash_tbl[sub_str] = hash_tbl[sub_str] + 1
  end
  return hash_tbl
end

# This is one of the 'optimal' solutions posted on leetcode. The idea is that the 
# shortest string and longest string (when sorted alphabetically) is all we have to look at since
# these two strings will be the most "different" from one another.
# 1. Handle the base case of a single string
# 2. Grab the shortest and longest strings (length of them)
# 3. Iterate through their characters, if they are equal append them to a "answer" string
# 4. Continue until they're not equal OR reach the end of the shortest string
# 5. return "answer" string
def longest_common_prefix_optimal(strs)
  # 1. Handle base cases
  if(strs.length == 0)
    return ""
  elsif(strs.length == 1)
    return strs[0]
  end

  # 2. Grab shortest and longest strings through sorting the array by lexographically
  strs.sort!
  shortest = strs[0]
  longest = strs[strs.length - 1]

  # 3. Iterate through characters, tracking if they're equal
  ans = ""
  (0..shortest.length-1).each do |i|
    # Pull chars out
    short_char = shortest[i]
    long_char = longest[i]

    # 4. Continue until not equal or reach end of shortest string
    if short_char == long_char
      ans = ans + short_char
    else
      break
    end
  end

  # 5. Return answer
  return ans
end

if __FILE__ == $0
  input_one = ["flower","flow","flight"]
  input_two = ["aaa","aa","aaa"]
  input_three = ["dog","racecar","car"]
  input_four = ["abab","aba","abc"]
  
  puts("Input one: #{longest_common_prefix_optimal(input_one)}")
  puts("Input two: #{longest_common_prefix_optimal(input_two)}")
  puts("Input three: #{longest_common_prefix_optimal(input_three)}")
  puts("Input four: #{longest_common_prefix_optimal(input_four)}")

end