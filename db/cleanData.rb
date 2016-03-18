# Data migration script
#Connect to mongodb
# client = Mongo::Client.new(['127.0.0.1:27017'], :database => 'looking2_development')

# result = client[:physicians].insert_one({
# 	name: '',
# 	organization: '',
# 	phone: '',
# 	url: '',
# 	category: '',
# 	specialization: '',
# 	treatment: '',
# 	title: '',
# 	Address:
# 	})
require 'csv'
require 'mongo'

def clean_stuff()
	#client = Mongo::Client.new(['127.0.0.1:27017'], :database => 'looking2_development')
	
	count = 1
	# formatter = "%{0} - %{1}"
	CSV.foreach("/Users/JBYALL/looking2/db/PhysicianDataExport.csv") do |row|
		 if count < 200
			# puts "#{count}.\tcontact - #{remove_whitespaces(remove_crap(row[0].scrub))}"
			# puts "\tcategory - #{remove_whitespaces(remove_crap(row[1].scrub))}"
			# puts "\taddress - #{remove_whitespaces(remove_crap(row[2].scrub))}"
			# puts "\thospital - #{remove_whitespaces(remove_crap(row[3].scrub)).split(':')[1]}"
			# puts "\tdescription - #{remove_crap(row[4])}"

			# puts "#{count}.\tcontact - #{remove_crap(row[0].scrub)}"
			# puts "\tcategory - #{remove_crap(row[1].scrub)}"
			# puts "\taddress - #{remove_crap(row[2].scrub)}"
			# puts "\thospital - #{remove_crap(row[3].scrub).split(':')[1]}"
			# puts "\tdescription - #{remove_crap(row[4])}"
			puts "#{count}."
			contact = remove_crap(row[0]).split('/')
			contact.each do |part|
				puts "\t#{part.strip}"
			end
			# category = remove_whitespaces(remove_crap(row[1]))
			# address = remove_whitespaces(remove_crap(row[2]))
			# hospital = remove_whitespaces(remove_crap(row[3])).split(':')[1]
			# highlights = remove_crap(row[4])

			# TODO: parse the contact fields

			# TODO: parse the category fields

			# TODO: parse the address fields

			# TODO: parse hospital

			# TODO: parse highlights (if necessary)



			# result = client[:physicians].insert_one({
			# 	name: value
			# })
			#values = value.split(",")
			
			count += 1
		else
			break
		end
		
	end
end

#removes vertical tabs from string
def remove_crap(myString)
	return myString.gsub(/\v/, '/')
end

#removes all whitespaces from string
def remove_whitespaces(myString)
	return myString.gsub(/\s+/, "")
end

def is_person(myString)
	
end
clean_stuff
