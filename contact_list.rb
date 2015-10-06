require 'pry'
require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction

# This should be the only file where you use puts and gets
if ARGV[0] == "help"
  puts "Here is a list of available commands:"
  puts "  new   - Create a new contacts"
  puts "  list  - List of all contacts"
  puts "  show  - Show a contact"
  puts "  find  - Find a contact"
end
command = STDIN.gets.chomp
 
# write new contact into csv file
if command == "new"
    puts "Please state the name of the new contact:"
    name = STDIN.gets.chomp
    puts "And the email:"
    email = STDIN.gets.chomp

    id = ContactDatabase.count_lines + 1
    # contact_list << Contact.create(id, name, email)
    contact =  Contact.create(id, name, email)
    # binding.pry
    ContactDatabase.write(contact)
end

  # lists all the contacts 
if command == "list"
    puts ContactDatabase.read
end


