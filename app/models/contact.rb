class Contact
  #include Mongoid::Document
  #field :name
  #field :street
  #field :local
  #field :phone
  #field :url
  #embedded_in :physician
  #ßattr_accessor :name, :street, :local, :phone, :url
  attr_reader :name, :street, :local, :phone, :url
  # attr_accessible :name, :street, :local, :phone, :url
	def initialize
		
	end
	def initialize(name, street, local, phone, url)
	
		@name = name
		@street = street
		@local = local
		@phone = phone
		@url = url
	end

	def mongoize
		[ name, street, local, phone, url ]
	end
  class << self

    # Get the object as it was stored in the database, and instantiate
    # this custom class from it.
    def demongoize(object)
    	if object != nil
      		Contact.new(object[0], object[1], object[2], object[3], object[4])
      	end
    end

    # Takes any possible object and converts it to how it would be
    # stored in the database.
    def mongoize(object)
    	#debug()
      if object != nil
	      	Contact.new(object[:name], object[:street], object[:local], object[:phone], object[:url]).mongoize
	  end
    end

    # Converts the object that was supplied to a criteria and converts it
    # into a database friendly form.
    def evolve(object)
      if object != nil
	      	object.mongoize
	  end
	end
  end
end
