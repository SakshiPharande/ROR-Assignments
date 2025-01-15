def is_prime?(input_no)
    return "#{input_no} is NOT a PRIME number" if input_no <= 1
    return "#{input_no} is PRIME NUMBER" if input_no <= 3
    
    # Eliminate even numbers and multiples of 3
    return "#{input_no} is NOT a PRIME number" if input_no.even? || input_no % 3 == 0
  
    # Check for factors from 5 to the square root of input_no
    (5..Math.sqrt(input_no)).each do |i|
      if i.even?
        next # Skip even numbers
      end
      return "#{input_no} is NOT a PRIME number" if input_no % i == 0
    end
  
    "#{input_no} is PRIME NUMBER"
  end
  
  # Take user input
  puts "Enter a number to check if it is prime: "
  number = gets.chomp.to_i
  puts is_prime?(number)
  