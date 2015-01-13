require_relative 'contact'
require_relative 'contact_database'
require 'pry'
require 'pry-byebug'



print ">> "
command = gets.chomp
case command
when "help"
  puts "Here is a list of available commands:
    new  - Create a new contact (new firstname lastname email)
    list - List all contacts
    show - Show a contact
    find - Find a contact"
when /^new\s[A-z]+\s[A-z]+\s.+@.+\.[A-z]+$/
  puts "new line"
else
  puts "Undefined Command."
end

#yan = Contact.new("Yan Hong", "onlyhongyan@gmail.com")
ContactDatabase.read_data
Contact.all
Contact.show(gets.chomp)
#binding.pry
