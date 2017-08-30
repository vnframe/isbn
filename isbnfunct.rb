def num_to_array(id)
    id = id.delete"-"
    id = id.delete" "
    id = id.chars
     id
end
def isbn_ten_length(id)
    num_to_array(id)
    if id.length == 10
        true
    else
        false
end
end
def check(id)
    id = num_to_array(id)
    #id = id[0..9]
    sum=0

    id.each_with_index do |value, index|
        sum = sum + ((index + 1).to_i * value.to_i)
    end
    
    check_digit = sum % 11
    if check_digit == 10
        id << "x"
        digit = "x"
    elsif check_digit == 0
        id << "0"
        digit = 0
    else isbn << check_digit.to_s
    end 
    digit
end