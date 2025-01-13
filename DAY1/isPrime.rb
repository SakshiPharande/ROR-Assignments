def isPrime(input_no)
    if input_no <= 1
        return "#{input_no} is NOT-PRIME number"
    end

    #Two Dots (..): This creates an inclusive range. For example, 2..5 will include 2, 3, 4, and 5.
    for i in 2..Math.sqrt(input_no)
        if input_no % i == 0
            return "#{input_no} is NOT-PRIME number"
        end
    end

    "#{input_no} is PRIME NUMBER"
end


#take user input
puts "Enter number to check is it prime: "

#gets - to take input 
#chomp - method specially for string returned by gets. it removes trailing \n newline character for strings.
#to_i - converts string into integer
number = gets.chomp.to_i

puts isPrime(number)