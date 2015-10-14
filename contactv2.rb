require 'pg'

class Contact

  attr_reader :id
  attr_accessor :firstname, :lastname, :email

  def initialize(firstname, lastname, email, id = nil)
    @id = id
    @firstname = firstname
    @lastname = lastname
    @email = email
  end

  def self.conn
    @@conn = PG.connect({
      host: 'localhost',
      dbname: 'postgres',
      user: 'development',
      password: 'development'
    })
  end

  def self.get_table_name
  end

  def to_s
    puts @firstname

  end

  def save
    values = []
    if @id
      # columns = instance_variables_hash.keys.join(", ")
      # values = instance_variables_hash.values.map { |val| "'#{val}"}.join(", ")

      # statements = instance_variables_hash.select do |key, val|
      #   key != "id"
      # end.map do |key, val|
      #   "#{key}='#{val}'"
      # end

      puts "Updating.."
      query = "UPDATE contacts SET firstname = $1, lastname = $2, email = $3 WHERE id = $4;"
      values = [@firstname, @lastname, @email, @id]
      puts query
    else 
      # columns = instance_variables_hash.keys.join(", ")
      # values = instance_variables_hash.values.map { |val| "'#{val}"}.join(", ")

      puts "Inserting.."
      query = "INSERT INTO contacts (firstname, lastname, email) VALUES ($1, $2, $3) returning id;"
      values = [@firstname, @lastname, @email]
      puts query
    end
    Contact.conn.exec_params(query, values)
  end

  def self.destroy(id)
    Contact.conn.exec_params("DELETE FROM contacts WHERE id = $1;", [id])
  end

  def self.find(id)
    result = Contact.conn.exec_params("SELECT * FROM contacts WHERE id = '#{id}'")
    puts result[0]['name']
  end

  def self.find_all_by_lastname(name)
    result = Contact.conn.exec_params("SELECT * FROM contacts WHERE lastname LIKE '%#{name.capitalize}%';")
    result.each do |contact|
    puts contact 
    end 
  end

  def self.find_by_email(email)
      #result = Contact.conn.exec_params("SELECT * FROM contacts WHERE email LIKE '%#{email}%';")
    result=Contact.conn.exec_params("SELECT * FROM contacts WHERE email='#{email}';")
    if (result.count!=0)
      result.each do |row|
        puts row["firstname"]
      end
    else
        puts "No record found"
    end
    
  end
 
end

# Contact.find_all_by_lastname("yoo")
Contact.find_by_email("henryhs.yo@gmail.com")

