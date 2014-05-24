class School
  include Mongoid::Document
  field :name, type: String
  field :building, type: String
  field :street, type: String
  field :locality, type: String
  field :city, type: String
  field :state, type: String
  field :country, type: String
  field :postcode, type: String
  field :phone, type: String
  field :fax, type: String
  field :email, type: String
  field :notes, type: String
end
