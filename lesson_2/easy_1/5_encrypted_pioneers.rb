=begin
Encrypted Pioneers
The following list contains the names of individuals who are pioneers in the field of computing or that 
have had a significant influence on the field. The names are in an encrypted form, though, using a 
simple (and incredibly weak) form of encryption called Rot13.

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Write a program that deciphers and prints each of these names .
=end

ALPHABET = ('a'..'z').to_a
UPPERALPHA = ('A'..'Z').to_a

def decipher(name)
  letters = name.split('')
  deciphered = []
  letters.each do |letter|
    if ALPHABET.include?(letter)
      og_index = ALPHABET.index(letter)
      new_index = og_index + 13
      if new_index < 25
        deciphered << ALPHABET[new_index]
      else
        deciphered << ALPHABET[new_index - 26]
      end
    elsif UPPERALPHA.include?(letter)
      og_index = UPPERALPHA.index(letter)
      new_index = og_index + 13
      if new_index < 25
        deciphered << UPPERALPHA[new_index]
      else
        deciphered << UPPERALPHA[new_index - 26]
      end
    else
      deciphered << letter
    end
  end
  deciphered_name = deciphered.join
end



p decipher('Nqn Ybirynpr') == "Ada Lovelace"
p decipher('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv') 
p decipher('Tenpr Ubccre')
p decipher('Nqryr Tbyqfgvar')
p decipher('Nyna Ghevat')
p decipher('Puneyrf Onoontr')
p decipher('Wbua Ngnanfbss')
p decipher('Ybvf Unvog')
p decipher('Pynhqr Funaaba')
p decipher('Fgrir Wbof')
p decipher('Ovyy Tngrf')
p decipher('Gvz Orearef-Yrr')
p decipher('Fgrir Jbmavnx')
p decipher('Xbaenq Mhfr')
p decipher('Fve Nagbal Ubner')
p decipher('Zneiva Zvafxl')
p decipher('Lhxvuveb Zngfhzbgb')
p decipher('Unllvz Fybavzfxv')
p decipher('Tregehqr Oynapu')

=begin
LS Solution

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end
=end
