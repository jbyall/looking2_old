# script for printing info to shell
require 'csv'
require 'mongo'
require 'pry'

def clean_stuff()
	count = 1
	people = 0
	phones = 0
	urls = 0
	client = Mongo::Client.new(['127.0.0.1:27017'], :database => 'looking2_dev')

	CSV.foreach("/Users/JBYALL/looking2/db/PhysicianDataExport.csv") do |row|
		 # if count < 100
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
			# puts "#{count}."
			person = ""
			phone = ""
			url = ""
			myPeeps = ""
			org = ""

			contact = remove_crap(row[0]).split('/')
			# binding.pry
			contact.each do |part|
				# if count > 106
				# 	# binding.pry
				# end
				if is_person(part) #parse person
					person = part.capitalize
					people += 1
				elsif is_phone(part) #parse phone
					phone = part
					phones += 1
				elsif is_url(part) #parse url
					url = part
					urls += 1
				elsif part.include? "[" #parse cs string of people
					part_people = part.split(',')
					myPeeps = part
					# TODO: add as people to organization
				else 
					# TODO: add as organization
					org = part
					# puts "#{count} - #{part.strip}"
				end
			end
			puts "#{count}. Person - #{person}\n\tPhone - #{phone}\n\tURL - #{url}\n\tPeoples - #{myPeeps}\n\tOrg - #{org}"
			# TODO: parse the category fields

			# TODO: parse the address fields

			# TODO: parse hospital

			# TODO: parse highlights (if necessary)
			
			count += 1
		# else
		# 	break
		# end
	end
	puts "People count - #{people}"
	puts "Phone count - #{phones}"
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
	if myString.include? "MD"#(myString.include? ",") && (myString.include? "MD")
		return true
	end
	return false
end

def is_phone(myString)
	if /(\d{3})\.(\d{3})\.(\d{4})?(.+)/ =~ myString
		return true
	end
	return false
end

def is_url(myString)
	if /\w+\.(com|gov|org)/ =~ myString
		return true
	end
	return false
end

clean_stuff

