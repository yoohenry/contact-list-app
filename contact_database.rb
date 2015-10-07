## TODO: Implement CSV reading/writing
require 'csv'
# require_relative 'contact_list'

# writes to and reads from CSV file
class ContactDatabase
  class << self
    def write(contact)
      CSV.open('contacts.csv','ab') do |file|
        file << [contact.id, contact.name, contact.email]   
      end
    end

    def read
      CSV.read('contacts.csv')
    end

# counts the lines in thc CSV file for assigning ID
    def count_lines
      total = 0
       CSV.foreach('contacts.csv') do |line|
        total += 1
       end
       total
    end

  end 

end