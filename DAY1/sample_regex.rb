=begin
^: Asserts the start of the string.
[a-zA-Z0-9._%+-]+: Matches one or more characters that can be letters (a-z, A-Z), digits (0-9), underscores (_), dots (.), plus signs (+), and percent signs (%)
@: Matches the literal @ symbol, which is required in all valid email addresses
[a-zA-Z0-9.-]+: Matches one or more characters that can be letters (a-z, A-Z), digits (0-9), dots (.), or hyphens (-) for the domain name
\.: Matches a literal dot (.) that separates the domain name from the top-level domain (TLD)
[a-zA-Z]{2,}: Matches two or more letters for the TLD (e.g., .com, .org)
$: Asserts the end of the string
=end

=begin
  ^: Start of the string
  \d+: One or more digits (0-9)
  (\.\d{1,2})?: An optional group that matches :
  \.: A literal decimal point
  \d{1,2}: One or two digits after the decimal point
  $: End of the string
=end

validation_rules = {
  mobile_number: /^([789]\d{9})$/, # Indian mobile numbers starting with 7, 8, or 9
  email_address: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
  name: /^[a-zA-Z\s]+$/, # Names can contain letters and spaces
  gender: /^[MF]$/, # Gender can be M or F
  amount: /^\d+(\.\d{1,2})?$/ # Amount can be a whole number or decimal with up to two decimal places
}

def validate_input(input, regex)
  if input.match?(regex)
    puts "#{input} is valid."
  else
    puts "#{input} is invalid."
  end
end

# Function to take user input and validate it
def get_and_validate_input(field_name, regex)
  print "Enter #{field_name}: "
  input = gets.chomp.strip
  validate_input(input, regex)
end

# Validate each input using the defined validation rules
puts "Validating Inputs:\n"

get_and_validate_input("Mobile Number", validation_rules[:mobile_number])
get_and_validate_input("Email Address", validation_rules[:email_address])
get_and_validate_input("Name", validation_rules[:name])
get_and_validate_input("Gender (M/F)", validation_rules[:gender])
get_and_validate_input("Amount", validation_rules[:amount])
