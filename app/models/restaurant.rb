class Restaurant
  include Mongoid::Document
  field :name, type: String
  field :location, type: String
  field :style, type: String
end
