#Method 1

def print_alphabet_reverse
  # ord function converts char to its ASCII Value
  for letter in 'z'.ord.downto('a'.ord)
    # Convert ASCII value back to character and print
    print letter.chr + " " 
  end
  #to move on next line after printing
  puts
end

print_alphabet_reverse


#Method 2

#puts ('A'..'Z').to_a.reverse 

