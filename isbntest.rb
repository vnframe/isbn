require "minitest/autorun"
require_relative "isbnfunct.rb"

class TestISBN < Minitest::Test
    def test_ten
        num = "1-234-567-89x".delete!"-"
        assert_equal(num.length, 10)
    end
    def test_for_x
        num = "123456789x"
        assert_equal(num.split('').last, "x")
    end
    def test_for_arr
        num = "123456789x"
        assert_equal(["1", "2", "3", "4", "5", "6", "7", "8", "9", "x"], num_to_array(num))
    end
    def test_with_dashes
        num = "12-3456-789x"
        assert_equal(["1", "2", "3", "4", "5", "6", "7", "8", "9", "x"], num_to_array(num))
    end
    def test_ten_func
        num = "123456789x"
        assert_equal(true, isbn_ten_length(num))
        p num
    end
end
