class Physician
  include Mongoid::Document
  field :type
  field :nameSearch, type: Array #
  field :locationSearch, type: Array #
  field :categoryDisplay
  field :categoriesSearchDisplay, type: Array #
  embeds_one :contact
  field :treatmentsDisplay, type: Array #
  field :physiciansDisplay, type: Array #
  field :summary, type: Array #
  # field :name #
  # field :street
  # field :city
  # field :state
  # field :region
  # field :phone #
  # field :url #
  # field :primaryService
  # field :serviceAreas
  # field :physicians, type: Array #
  # field :tags
end
