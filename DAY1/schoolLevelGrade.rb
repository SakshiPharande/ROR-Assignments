def printLevelFromGrade(input_grade)
  if input_grade <= 0
    puts "Invalid Grade , Please Enter Valid Grade"
  elsif input_grade >= 1 && input_grade <= 5
    puts "Elementary Level Student"
  elsif input_grade >= 6 && input_grade <= 8
    puts "Middle School Student"
  elsif input_grade >= 9 && input_grade <= 12
    puts "High School Student"
  else 
    puts "College Student"
  end
end

# Take user input
puts "Enter Grade: "
grade = gets.chomp.to_i
printLevelFromGrade(grade)
