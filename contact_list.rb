require_relative 'contact'
require_relative 'contact_database'
require 'pry'
require 'pry-byebug'



print ">> "
command = gets.chomp
case command
when "help"
  puts "Here is a list of available commands:
    new  - Create a new contact
    list - List all contacts
    show - Show a contact
    find - Find a contact"
else
  puts "Undefined Command."
end

#yan = Contact.new("Yan Hong", "onlyhongyan@gmail.com")
ContactDatabase.read_data
Contact.all
Contact.show(gets.chomp)
#binding.pry
