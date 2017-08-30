def num_to_array(id)
    id = id.delete"-"
    id = id.chars
    p id
end
def isbn_ten_length(id)
    num_to_array(id)
    if id.length == 10
        true
    else
        false
end
end