require_relative 'contact'
require_relative 'contact_database'
require 'pry'
require 'pry-byebug'


ContactDatabase.read_data
command = ARGV
#binding.pry
if command[0] == "help"
  puts "Here is a list of available commands:
    new  - Create a new contact (new firstname lastname email)
    list - List all contacts
    show - Show a contact
    find - Find a contact"
elsif command[0] == "new" && command[1].match(/[a-zA-Z]+/) && command[2].match(/[a-zA-Z]+/) && command[3].match(/.+@.+\.[a-zA-Z]+/) && command[4].match(/[a-zA-Z]+\:\d{3}\-\d{3}\-\d{4}/)
      Contact.create("#{command[1]} #{command[2]}", command[3], command[4])
elsif command[0] == "new" && command[1].match(/[a-zA-Z]+/) && command[2].match(/[a-zA-Z]+/) && command[3].match(/.+@.+\.[a-zA-Z]+$/)
  Contact.create("#{command[1]} #{command[2]}", command[3], nil)
elsif command[0] == "list"
  Contact.all
elsif command[0] == "show" && command[1].match(/\d+/)
  Contact.show(command[1])
elsif command[0] == "find" && command[1].match(/.+/)
  Contact.find(command[1])
else
  puts "Undefined Command."
end

#yan = Contact.new("Yan Hong", "onlyhongyan@gmail.com")
#ContactDatabase.read_data
#Contact.all
#Contact.show(gets.chomp)
#binding.pry
