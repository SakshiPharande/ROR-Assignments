require 'ipaddr'

def findClassFromIP(ip)
  begin

    # Create an IPAddr object from a valid IPv4 address
    ip_address = IPAddr.new(ip)

    # Check for Class A
    if ip_address >= IPAddr.new('0.0.0.0') && ip_address <= IPAddr.new('127.255.255.255')
      "Class A"
    # Check for Class B
    elsif ip_address >= IPAddr.new('128.0.0.0') && ip_address <= IPAddr.new('191.255.255.255')
      "Class B"
    # Check for Class C
    elsif ip_address >= IPAddr.new('192.0.0.0') && ip_address <= IPAddr.new('223.255.255.255')
      "Class C"
    # Check for Class D
    elsif ip_address >= IPAddr.new('224.0.0.0') && ip_address <= IPAddr.new('239.255.255.255')
      "Class D"
    # Check for Class E
    elsif ip_address >= IPAddr.new('240.0.0.0') && ip_address <= IPAddr.new('255.255.255.255')
      "Class E"
    else
      "Invalid IP Address"
    end
    
  #string is not a valid IP address, it raises an error
  rescue IPAddr::InvalidAddressError
    "Invalid IP Address"
  end
end

# Take user input
puts "Enter an IP address:"
input_ip = gets.chomp
puts "The class of the IP address #{input_ip} is: #{findClassFromIP(input_ip)}"
