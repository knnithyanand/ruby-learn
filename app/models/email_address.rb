class EmailAddress
  include Mongoid::Document

  field :email, type: String
  field :type, type: String

  embedded_in :emailable, polymorphic: true
end
