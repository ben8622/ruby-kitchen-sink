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

if __FILE__ == $0
  input_one = ["flower","flow","flight"]
  input_two = ["flower","","flight"]
  input_three = ["dog","racecar","car"]
  input_four = []
  
  puts("Input one: #{longest_common_prefix(input_one)}")
  puts("Input two: #{longest_common_prefix(input_two)}")
  puts("Input three: #{longest_common_prefix(input_three)}")
  puts("Input four: #{longest_common_prefix(input_four)}")

end