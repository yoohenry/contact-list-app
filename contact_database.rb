## TODO: Implement CSV reading/writing
require 'csv'
# require_relative 'contact_list'


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

    def count_lines
      total = 0
       CSV.foreach('contacts.csv') do |line|
        total += 1
       end
       total
    end

  end 

end