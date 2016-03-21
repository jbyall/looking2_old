class Physician
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  #Display fields
  field :contact, type: Contact
  field :categoryDisplay, type: String
  field :categorySearchDisplay, type: Array
  field :treatmentsDisplay, type: Array
  field :physiciansDisplay, type: Array
  field :summary, type: String

  #Search fields
  field :nameSearch, type: Array
  field :locationSearch, type: Array
  
  #Other
  field :type, type: String # Possible Values = "single" or "multiple"
  field :status, type: String # Possible Values = "new", "approved", "rejected"
  # NOTE - Date fields are specified in include section
  @@count = Physician.all.count
end
