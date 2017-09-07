require "csv"
def check_through_csv_file()
	initial = CSV.read('input_isbn_file.csv')

    initial.shift
    p initial

	returned = []

	initial.each do |value|
		if choose_isbn_type(value[1]) == true
			value.push("valid")
		else
			value.push("invalid") 
		end
        returned.push(value)
        p returned
	end
        CSV.open("output_isbn_file.csv", "w") do |csv|
		    csv << returned
    end
end

def num_to_array(id)
    id = id.delete" -"
    id = id.chars
     id
end
def isbn_ten_length(id)
    #id = num_to_array(id)
    if id.length == 10
        true
    else
        false
    end
end
def isbn_thirteen_length(id)
    #id = num_to_array(id)
    if id.length == 13
        true
    else
        false 
    end
end
def check_for_letters(id)
    # id = num_to_array(id)
    p "in check for letters, ID id #{id}"
    last = id.pop
    if (id && ["a-zA-Z"]).any?
        true
    else
        false
    end
end

def check_ten(id)
    # if id.class == String
    # id = num_to_array(id)
    # end
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
    # if id.class == String
    # id = num_to_array(id)
    # end
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
    #p "id is #{id.class}"
    #p "check is #{check.class}"
    #p "check digit is #{check_digit.class}"
    check_digit = check_digit.to_s
    check = check.to_s
        if check_digit == check
            # p "check digit is #{check_digit.class}"
            # p "check is #{check.class}"
            true
        else 
            false

        end
end

def isbn_ten_full(id)
    if isbn_ten_length(id) == true && check_ten(id) == true && check_for_letters(id) == false
        true
    else 
        false
    end
end
def isbn_thirteen_full(id)
    if isbn_thirteen_length(id) == true && check_thirteen(id) == true
        true
    else 
        false
    end 
end 

def choose_isbn_type(id)
    id = num_to_array(id)
    p "ID is #{id}"
    if id.length == 10
        isbn_ten_full(id)
    elsif id.length == 13
        isbn_thirteen_full(id)
    else 
        false
    end 
end
check_through_csv_file()
