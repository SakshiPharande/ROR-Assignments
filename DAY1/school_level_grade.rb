def print_level_from_grade(input_grade)
  case input_grade
  when 1..5
    puts "Elementary Level Student"
  when 6..8
    puts "Middle School Student"
  when 9..12
    puts "High School Student"
  when 13..17 # Assuming grades above 12 are for College students
    puts "College Student"
  else
    puts "Invalid Grade, Please Enter Valid Grade"
  end
end

# Take user input
puts "Enter Grade: "
grade = gets.chomp.to_i
print_level_from_grade(grade)
