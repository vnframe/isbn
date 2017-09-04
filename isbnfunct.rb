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
    valid = false
	sum = 0
	index_pos = 0
	index_count = 1
	counter = id.pop
	#alternate between multiplying by 1 and 3
	#If index % 2 equals 0 we have an even number, so multiply by 1
	#Otherwise multiply by 3
	#Add to sum each iteration
	counter.length.times do
		if index_pos % 2 == 0
			sum = sum + id[index_pos].to_i *  1
			else 
				sum = sum + id[index_pos].to_i * 3
		end
		index_pos += 1
		index_count += 1
	end	
	
	check_digit = (10 - (sum %10))% 10
	#Calculates check digit
		if check_digit == id[-1].to_i
			valid = true

		end
valid
end