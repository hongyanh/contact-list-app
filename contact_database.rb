## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase
  @@filename = "contacts.csv"
  $filedata = []
  def initialize
    raise "No file 'contacts.csv' found." unless File.exists?(@@filename)
  end

  def self.read_data
    data = File.open(@@filename).readlines.each do |line| 
      $filedata << {:id => line.split(%r{,\s*})[0], :name => line.split(%r{,\s*})[1], :email => line.split(%r{,\s*})[2].chomp}
    end
  end

  def self.write_data(data)
    file = File.open(@@filename , "a")
    file.close
  end

end