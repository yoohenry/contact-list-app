class Contact
 
  attr_accessor :id, :name, :email

  def initialize(id, name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    @id = id
  end
 
  #def to_s
    # TODO: return string representation of Contact
   # Contact.to_s
  #end

  # def to_s
  #   "#{id}, #{name}, #{email}"
  # end
 
  ## Class Methods
  class << self
    def create(id, name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      Contact.new(id, name, email)
    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      contacts = ContactDatabase.read
      match = contacts.find_all do |contact|
        contact[1].include? term || contact[2].include? term
      end

      match.each do |contact|
        puts "#{contact[0]}: #{contact[1]}, #{contact[2]}"
      end

    end
 
    def all
      # TODO: Return the list of contacts, as is
      
    end

    
    def show(id)
      # TODO: Show a contact, based on ID

    end

  
  end
 
end