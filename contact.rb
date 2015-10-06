class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
 
  def to_s
    # TODO: return string representation of Contact
    Contact.to_s
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      contact_list = []
      contact_list << contact = Contact.new(name, email)
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
      contact[id]
    end
    
  end
 
end