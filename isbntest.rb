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
    

end