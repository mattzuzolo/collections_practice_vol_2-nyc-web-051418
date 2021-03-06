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
      passed_array.each do |passed_hash|
        passed_hash[:count] = 0


          passed_array.each do |deeper_hash|

            if deeper_hash[:name] == passed_hash[:name]
              passed_hash[:count] += 1
            end #end if
          end  #end passed array deeper each
        

    end #end passed_array each
    
    # passed_array.reject { |thing| passed_array.count(thing) > 1}
    passed_array.uniq
end #end method

def merge_data (keys, data)
  
  output_array = []
  
  #get names from the key parameter
  keys.each do |person|
    
    #rest of the info is in the data parameter
      data.each do |more_info|
        
        #need to make sure you're accessing info for right person
        if more_info[person[:first_name]]
          
            #using .merge to combine the first hash (with first name) and second hash (with the rest of the data). Need to be aware of data levels so use person
            #[:first_name] to maintain right level
            complete_info = {first_name: person[:first_name]}.merge(more_info[person[:first_name]])
  
            #add to the output_array on each iteration. Must return the array outside though because it will be overwritten on subsequent iterations
            output_array << complete_info
          # binding.pry
          end
      end #end data each
  end #end keys each
  output_array
end #end big method

def find_cool (input)
  output_array = []
  
  input.each do |name_and_temp|
    
    if name_and_temp[:temperature] == "cool"
      
      # output_array << name_and_temp[:temperature]
    output_array << name_and_temp
    #binding.pry
     
    end
    
  end
  output_array
end



# def organize_schools (input)
  
#   hash_by_city = {}
#   school_name_array = []
  
  
#   school_name_nyc = []
#   school_name_sf = []
#   school_name_chicago = []
  
#   input.each do |school_name, location_hash|
    
#     # binding.pry
    
#     location_hash.each do |location_key, location_value|
      
      
    
#     if location_value == "NYC"
#       school_name_nyc << school_name
#       hash_by_city["NYC"] = school_name_nyc
#     elsif location_value == "SF"
#       school_name_sf << school_name
#       hash_by_city["SF"] = school_name_sf
#     elsif location_value == "Chicago"
#       school_name_chicago << school_name
#       hash_by_city["Chicago"] = school_name_chicago  
#     else
#     end
    
#     # if location_value == location_hash[:location]
#     #   hash_by_city[location_value] = school_name_array
    
#     # end   
      
        
#     end #end location hash
    
#   end #input each end
#   hash_by_city
#   #binding.pry
  
# end #method end

#input:

# {"flatiron school bk"=>{:location=>"NYC"},
# "flatiron school"=>{:location=>"NYC"},
# "dev boot camp"=>{:location=>"SF"},
# "dev boot camp chicago"=>{:location=>"Chicago"},
# "general assembly"=>{:location=>"NYC"},
# "Hack Reactor"=>{:location=>"SF"}}


#sort by city

#{"NYC"=>["flatiron school bk", "flatiron school", "general assembly"], "SF"=>["dev boot camp", "Hack Reactor"], "Chicago"=>["dev boot camp chicago"]}




def organize_schools (input)
  
  hash_by_city = {}
  iteration_location = ""
  
  #create a new hash and fill out the keys with each city present in the input. Add an empty array as a value to be filled later
  input.each do |school_name, location_hash|
    location_hash.each do |location_key, location_value|
      iteration_location = location_value
      hash_by_city[location_value] = []
    end
  end  
    
  #now iterate over the new hash to begin filling it with data. Iterate over the input hash and check for repeated keys. If repeat then input apropriate value  
  hash_by_city.each do |city, school_name_array_key|
    input.each do |school_name, location_hash|
      location_hash.each do |location_key, location_value|
        if city == location_value
          hash_by_city[city] << school_name
        end
      end
    end
  end  
  hash_by_city
end



  # binding.pry
  #       if location_hash[location] == 
  #       hash_by_city[ location_hash[:location] ] = school_name_array
  #       hash_by_city[ location_hash[:location] ] << school_name if location_hash[:location] == hash_by_city[location]










