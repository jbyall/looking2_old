class Contact
  include Mongoid::Document
  field :name
  field :street
  field :local
  field :phone
  field :url
  embedded_in :physician
end
