def cipher(_string, _offset)

  final = ""

  _string.each_char do |char|
    if char.ord > 96 && char.ord < 123
      final += shift_lowercase(char.ord, _offset).chr
    elsif char.ord > 64 && char.ord < 91
      final += shift_uppercase(char.ord, _offset).chr
    else
      final += char
    end
  end
   final # RETURN VALUE
end

# Upper case = 65 - 90
# Lower case = 97 - 122
def shift_uppercase(_int, _shift)
  if _shift < 0
    _shift *= -1
    while _shift > 0
      _shift = _shift - 1
      _int = _int - 1
      if _int <= 64
        _int = 90
      end
    end
  else
    while _shift > 0
      _shift = _shift - 1
      _int = _int + 1
      if _int >= 90
        _int = 64
      end
    end
  end
  _int #RETURN VALUE
end

def shift_lowercase(_int, _shift)
  if _shift < 0
    _shift *= -1
    while _shift > 0
      _shift = _shift - 1
      _int = _int - 1
      if _int < 97
        _int = 122
      end
    end
  else
    while _shift > 0
      _shift = _shift - 1
      _int = _int + 1
      if _int > 122
        _int = 97
      end
    end
  end
  _int #RETURN VALUE
end

#TESTS

#COMPONENT
a_to_c_upper = shift_uppercase('A'.ord,2) # SHOULD RETURN 'C'
a_to_y_upper = shift_uppercase('A'.ord,-2) # SHOULD RETURN 'Y'

puts a_to_y_upper.chr
puts a_to_c_upper.chr

#COMPONENT
a_to_c_lower = shift_lowercase('a'.ord, 2)
a_to_y_lower = shift_lowercase('a'.ord, -2)

puts a_to_c_lower.chr
puts a_to_y_lower.chr

#METHOD
originalValue = -4;
reverseValue = originalValue * -1

main = cipher("Hello World", originalValue)
mainRev = cipher(main, (originalValue * -1))

puts main
puts mainRev

# USER FUNCTIONS - Yes I know I need validity checks here...
puts 'String To Flip:'
string = gets.chomp

puts 'Amount To Move:'
amount = gets.chomp.to_i

puts cipher(string, amount)
