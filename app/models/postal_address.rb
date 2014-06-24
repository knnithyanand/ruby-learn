class PostalAddress
  include Mongoid::Document

  field :type, type: String
  field :street, type: String
  field :area, type: String
  field :state, type: String
  field :city, type: String
  field :country, type: String
  field :postcode, type: String
  
  embedded_in :addressable, polymorphic: true
end
