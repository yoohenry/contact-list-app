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

  def to_s
    "#{id}, #{name}, #{email}"
  end
 
  ## Class Methods
  class << self
    def create(id, name, email)
      
      # TODO: Will initialize a contact as well as add it to the list of contacts
      Contact.new(id, name, email)

    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      term.find_all {|term| term == @name || @email}
    end
 
    def all
      # TODO: Return the list of contacts, as is
      contact_list
    end
    
    def show(id)
      # TODO: Show a contact, based on ID

    end
    
  end
 
end