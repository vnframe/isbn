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