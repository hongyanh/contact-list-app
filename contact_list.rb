require_relative 'contact'
require_relative 'contact_database'
require 'pry'
require 'pry-byebug'


ContactDatabase.read_data
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
  Contact.create("#{command.split(%r{\s})[1]} #{command.split(%r{\s})[2]}", command.split(%r{\s})[3])
when "list"
  Contact.all
when /^show\s[0-9]+$/
  Contact.show(command.split(%r{\s})[1])
else
  puts "Undefined Command."
end

#yan = Contact.new("Yan Hong", "onlyhongyan@gmail.com")
#ContactDatabase.read_data
#Contact.all
#Contact.show(gets.chomp)
#binding.pry
