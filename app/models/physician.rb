class Physician
  include Mongoid::Document
  #attr_accessible :nameSearch

  field :type, type: String
  field :nameSearch, type: Array
  field :locationSearch, type: Array
  field :categoryDisplay, type: String
  field :categorySearchDisplay, type: Array
  field :treatmentsDisplay, type: Array
  field :physiciansDisplay, type: Array
  field :summary, type: String
  embeds_one :contact
  accepts_nested_attributes_for :contact
end
