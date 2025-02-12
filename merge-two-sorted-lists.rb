# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  
      # Handle empty lists
      if(list1 == nil and list2 != nil)
        return list2
      elsif(list1 != nil and list2 == nil)
        return list1
      elsif(list1 == nil and list2 == nil)
        return list1
      end
    
      ans = []
      
      # Set initial node 
      if(list1.val >= list2.val)
        ans << list2.val
        list2 = list2.next
      else
        ans << list1.val
        list1 = list1.next
      end

    
      # Iterate over the linked lists until reaching the end of one
      while list1 != nil and list2 != nil do
        if(list1.val >= list2.val)
          ans << list2.val
          list2 = list2.next
        else
          ans << list1.val
          list1 = list1.next
        end
      end

    
      # If there is any nodes left in a linked list add them
      while(list1 != nil)
        ans << list1.val
        list1 = list1.next
      end
      while(list2 != nil)
        ans << list2.val
        list2 = list2.next
      end
    
    return ans
end

if __FILE__ == $0
  one_three = ListNode.new(6, nil)
  one_two = ListNode.new(4, one_three)
  one_root = ListNode.new(2, one_two)

  two_three = ListNode.new(5, nil)
  two_two = ListNode.new(3, two_three)
  two_root = ListNode.new(1, two_two)
  
  puts("Input one: #{merge_two_lists(one_root, two_root)}")

end