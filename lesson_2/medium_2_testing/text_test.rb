require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample.txt')
    @text = Text.new(@file.read)
  end

  def test_swap
    swapped_file = @text.swap('a', 'e')
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal(expected_text, swapped_file)
  end

  def test_word_count
    counted = @text.word_count

    assert_equal(72, counted)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end

=begin
LS Solution

require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    actual_text = text.swap('a', 'e')
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal expected_text, actual_text
  end

  def teardown
    @file.close
  end
end

Discussion

To write this test we'll need to first create an instance of class Text. Then, we need to pass it the text 
we want to work on. To do that we'll have to read that text from the sample text file. First, we must open 
the file for reading. We want to keep things directly related to our test in our test method. So, any code 
that is necessary to setup the test is a perfect candidate for the #setup method. We do so in our solution 
by opening the file in question and assigning the file object to an instance variable.

Once we have passed in the contents of that file to the Text class, we're ready to make the command that 
will lead to the assertion for this test. That command is the call to Text#swap. In this case, the exercise 
asks us to use a and e as the letters to swap out. The return value of this Text#swap method is what we 
will use to test that this method is working as intended.

Next, we need a String that we can test against the return value of Text#swap. This will be our expected 
value for the later assertion. To get this String, we just take the contents of the file and process it 
manually with our text editor to replace all of the as with es.

Finally, we use assert_equal to ensure that the expected value of the text is equal to the actual value.

LS Solution to Test Word Count

require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  # omitted for brevity

  def test_word_count
    text = Text.new(@file.read)
    assert_equal 72, text.word_count
  end

  def teardown
    @file.close
  end
end

Discussion
For this test we first need to determine the word count of the sample text. That can be ascertained easily 
enough by calling the word_count method manually, or by reading in the file in irb and counting the words 
from there. We then write in that value into our test as the expected value. We also need to make sure that 
we read the file to gain access to the relevant text. We're able to call @file.read since the opening of 
our file is handled in the setup method. If we didn't first open that file, then calling @file.read would 
throw an error. Lastly, we use assert_equal with our hard-coded word count and a call to text.word_count as 
arguments.

Regarding our teardown method, Ruby can be a bit lenient when it comes to closing files. If we didn't call 
@file.close, then the File object associated with @file would be closed when our script is finished running. 
This is a failsafe implemented by the IO class. But it is best to be explicit about these things. Since 
this is an example where we only work with one file, things may turn out ok. But imagine if we were dealing 
with several files, we would want to keep track of when they are opened and closed. It may not seem all 
that intuitive that our File really is closed properly. We could add one more line of code to our test 
file to verify that teardown is called after each test. We'll use the predicate method, closed? to verify 
that we have closed our file.

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  # omitted for brevity

  def test_word_count
    text = Text.new(@file.read)
    assert_equal 72, text.word_count
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end

When we run our test, we should now see 2 lines of output(along with our test output), one line of output 
for each test we have run in this file.
=end
