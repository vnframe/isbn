def num_to_array(id)
    id = id.delete"-"
    id = id.delete" "
    id = id.chars
     id
end
def isbn_ten_length(id)
    id = num_to_array(id)
    if id.length == 10
        true
    else
        false
    end
end
def isbn_thirteen_length(id)
    id = num_to_array(id)
    if id.length == 13
        true
    else
        false 
    end
end
def check(id)
    id = num_to_array(id)
    check_digit = id.pop
    sum=0

    id.each_with_index do |value, index|
        sum = sum + ((index + 1).to_i * value.to_i)
    end
    
    last = sum % 11
    if check_digit == "x" && last == 10
        true
      
    elsif check_digit.to_i == last.to_i
        true
    else 
        false
    end 
end

def check_thirteen(id)
    id = num_to_array(id)
	sum = 0
	# index_pos = 1
	# index_count = 1
	check = id.pop

	id.each_with_index do |value, index_pos|
		if index_pos.to_i % 2 == 0
            sum += value.to_i * 1
          else
            sum += value.to_i * 3
  end
		# index_pos += 1
		# index_count += 1
	end	
	
    check_digit = (10 - (sum %10))% 10
    #Calculates check digit
    p "id is #{id.class}"
    p "check is #{check}"
    p "check digit is #{check_digit}"
		if check_digit == check
            true
        else 
            false

        end
end