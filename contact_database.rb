## TODO: Implement CSV reading/writing
#require 'csv'

class ContactDatabase
  @@filename = "contacts.csv"
  $filedata = []
  def initialize
    raise "No file 'contacts.csv' found." unless File.exists?(@@filename)
  end

  def self.read_data
    index = 1
    data = File.open(@@filename).readlines.each do |line| 
      phone = line.split(%r{,\s*})[2].chomp unless line.split(%r{,\s*})[2].nil?
      $filedata << {:id => index, :name => line.split(%r{,\s*})[0], :email => line.split(%r{,\s*})[1].chomp, :phone => phone }
      index += 1
    end
  end

  def self.write_data(data)
    open(@@filename, 'a') { |f|
      f.puts data
    }
  end

end