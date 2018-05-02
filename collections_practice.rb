# your code goes here

require 'pry'

def begins_with_r (passed_array)
  
  i = 0
  still_true = true
  
  while passed_array.length > i
  
    if passed_array[i][0].downcase != "r"
        return false
    else
        still_true = true
    end
     i += 1
  end    
  still_true
end



def contain_a (passed_array)
  
    passed_array.select { |elements| elements.include?("a") }
 
end


def first_wa (passed_array)
  
  new_array = []
  
  passed_array.each do |item|
    new_array << item
  end  

  
  passed_array.map! {|elements| elements.to_s}
  passed_array.map! {|elements| elements[0,2]}
  
  passed_array.each_with_index {|elements, index|
  
      if elements == "wa"
        return new_array[index]
      end  
  }
end




def remove_non_strings (passed_array)
    new_array = []
    passed_array.map {|item| item.class == String ? new_array << item : nil}.compact!.flatten
end




def count_elements (passed_array)
  
    name_array = []
    passed_array.each {|item| name_array << item }


    #desired output: [{:name=>"blake", :count=>2}, {:name=>"ashley", :count=>1}]
end







