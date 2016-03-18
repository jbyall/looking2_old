# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'


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


Physician.delete_all


CSV.foreach("/Users/JBYALL/looking2/db/PhysicianDataExport.csv") do |row|
	person = ""
	phone = ""
	url = ""
	myPeeps = Array.new
	org = ""
	part_people = ""

	contact = remove_crap(row[0]).split('/')

	contact.each do |part|
		if is_person(part) #parse person
			myPeeps.push(part.capitalize)
		elsif is_phone(part) #parse phone
			phone = part
		elsif is_url(part) #parse url
			url = part
		elsif part.include? "[" #parse cs string of people
			part_people = part.split(',')
			part_people.each do |blah|
				myPeeps.push(blah)
			end
		else
			org = part
		end
	end
	# TODO: parse the category fields

	# TODO: parse the address fields

	# TODO: parse hospital

	# TODO: parse highlights (if necessary)
	
	Physician.create!(:name => org, :phone => phone, :url => url, :physicians => myPeeps)
end

