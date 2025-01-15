require 'ipaddr'

def find_class_from_IP(ip)
  begin
    # Create an IPAddr object from a valid IPv4 address
    ip_address = IPAddr.new(ip)

    # Determine the class of the IP address using a case statement
    case ip_address
    when IPAddr.new('0.0.0.0')..IPAddr.new('127.255.255.255')
      "Class A"
    when IPAddr.new('128.0.0.0')..IPAddr.new('191.255.255.255')
      "Class B"
    when IPAddr.new('192.0.0.0')..IPAddr.new('223.255.255.255')
      "Class C"
    when IPAddr.new('224.0.0.0')..IPAddr.new('239.255.255.255')
      "Class D"
    when IPAddr.new('240.0.0.0')..IPAddr.new('255.255.255.255')
      "Class E"
    else
      "Invalid IP Address"
    end
    
  # Handle invalid IP address errors
  rescue IPAddr::InvalidAddressError
    "Invalid IP Address"
  end
end

# Take user input
puts "Enter an IP address:"
input_ip = gets.chomp.strip
puts "The class of the IP address #{input_ip} is: #{find_class_from_IP(input_ip)}"
