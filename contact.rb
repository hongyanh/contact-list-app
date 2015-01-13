require 'pry-byebug'

class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
  end
 
  def to_s
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  class << self
    def create(name, email, phone)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      #binding.pry
      if !$filedata.select {|x| x[:email] == email}.empty?
        puts "The contact already exists"
      else
        if !phone.nil?
          $filedata << {:id => $filedata.count+1, :name => name, :email => email, :phone => phone}
          data = "#{name}, #{email}, #{phone}\n"
        else
          $filedata << {:id => $filedata.count+1, :name => name, :email => email}
          data = "#{name}, #{email}\n"
        end
        ContactDatabase.write_data(data)
        puts "Save to id ##{$filedata.count}"
      end
    end
 
    def find(index)
      # TODO: Will find and return contact by index
      find_data = $filedata.select {|x| x[:name].match(/#{index}/) || x[:email].match(/#{index}/) }
      find_data.each do |row|
        print_helper(row)
      end
      puts "not found" if find_data.empty?
    end
 
    def all
      # TODO: Return the list of contacts, as is
      #puts "id | name | email"
      $filedata.each do |row|
        print_helper(row)
      end
      #binding.pry
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      contact = $filedata.find {|x| x[:id] == id.to_i }
      if contact.nil?
        puts "not found"
      else
        print_helper(contact)
      end
    end

    def print_helper(obj)
      str =  "#{obj[:id]}: #{obj[:name]} (#{obj[:email]})"
      if !obj[:phone].nil?
        phones = obj[:phone].split('/')
        phones.each do |phone|
          phone.split(':').each do |p|
            str << " #{p}"
          end
        end
      end
      puts str
    end
  end
 
end