class PhoneNumber
  include Mongoid::Document

  field :country_code, type: String
  field :area_code, type: String
  field :number, type: String
  field :type, type: String

  embedded_in :phoneable, polymorphic: true
end
