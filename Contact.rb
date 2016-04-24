require "./Person"

class Contact < Person
	attr_accessor :address, :telephone

	def initialize(name, lastname, address, telephone)
		super(name, lastname)
		@address = address
		@telephone = telephone
	end
	
end