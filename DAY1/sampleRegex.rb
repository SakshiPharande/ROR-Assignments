def validate_input(input, regex)
    if input.match?(regex)
      puts "#{input} is valid."
    else
      puts "#{input} is invalid."
    end
  end
  
  # Test inputs
  mobile_number = "9123456789"
  email_address = "uniquesp@gmail.com"
  name = "Sakshi Pharande"
  gender = "M"
  amount = "1234.56"
  
  # Validate each input

  puts "Validating Mobile Number:"
  validate_input(mobile_number, /^789\d{7}$/)
  #validation for indian no which starts from 7 or 8 or 9  only 

  puts "\nValidating Email Address:"
  validate_input(email_address, /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
=begin
^: Asserts the start of the string.
[a-zA-Z0-9._%+-]+: Matches one or more characters that can be letters (a-z, A-Z), digits (0-9), underscores (_), dots (.), plus signs (+), and percent signs (%)
@: Matches the literal @ symbol, which is required in all valid email addresses
[a-zA-Z0-9.-]+: Matches one or more characters that can be letters (a-z, A-Z), digits (0-9), dots (.), or hyphens (-) for the domain name
\.: Matches a literal dot (.) that separates the domain name from the top-level domain (TLD)
[a-zA-Z]{2,}: Matches two or more letters for the TLD (e.g., .com, .org)
$: Asserts the end of the string
=end
  
  puts "\nValidating Name:"
  validate_input(name, /^[a-zA-Z\s]+$/)
  
  puts "\nValidating Gender:"
  validate_input(gender, /^[MF]$/)
  

  puts "\nValidating Amount:"
  validate_input(amount, /^\d+(\.\d{1,2})?$/)
=begin
  ^: Start of the string
  \d+: One or more digits (0-9)
  (\.\d{1,2})?: An optional group that matches :
  \.: A literal decimal point
  \d{1,2}: One or two digits after the decimal point
  $: End of the string
=end

