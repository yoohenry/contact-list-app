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


if ARGV[0] == "find"
  Contact.find(ARGV[1])
end


command = STDIN.gets.chomp
 
# write new contact into csv file
if command == "new"
    
    puts "And the email:"
    email = STDIN.gets.chomp

    Contact.duplicate(email)

    puts "Please state the name of the new contact:"
    name = STDIN.gets.chomp

    id = ContactDatabase.count_lines + 1
    contact =  Contact.create(id, name, email)
    ContactDatabase.write(contact)
end

  # lists all the contacts 
if command == "list"

    contacts = ContactDatabase.read
    # puts contacts.inspect
    contacts.each do |contact|
      puts "#{contact[0]}: #{contact[1]}, #{contact[2]}"
    end

    puts '---'
    puts "#{ContactDatabase.count_lines} records total"
end

if command == "show"
  puts "Input ID: "
  input_id = STDIN.gets.chomp

  contacts = ContactDatabase.read
  contacts.each do |contact|
    if contact[0] == input_id 
      puts "#{contact[0]}: #{contact[1]}, #{contact[2]}"
    else
      "not found"
    end
  end
end





