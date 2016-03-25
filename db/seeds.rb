# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Physician.delete_all
contact1 = Contact.new("David M Goldstein, MD", "2500 Brooktree Rd, Ste 300", "Wexford, PA 15090", "724.934.7780", "www.nhnaturalmedicine.com")
contact1.mongoize()
Physician.create!(
	:type => "single",
	:nameSearch => ["Goldstein","David","North Hills Natural Medicine"],
	:locationSearch => ["pa", "allegheny", "pittsburgh", "wexford"],
	:categoryDisplay => "Doctor",
	:categorySearchDisplay => ["Holistic", "Nutritional Therapy",  "Detoxificaiton", "Hormone Therapy", "Cancer"],
	:treatmentsDisplay => ["Holistic", "Nutritional Therapy", "Detoxificaiton", "Bio-identical hormone therapy"],
	:summary => "Specializing in natural approaces to the improving health and facilitation healing through...",
	:contact => contact1,
	:status => "new")

