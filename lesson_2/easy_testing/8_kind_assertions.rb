=begin
Kind Assertions

Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's 
subclasses (e.g., Integer, Float, etc).
=end

assert_kind_of(Numeric, value)