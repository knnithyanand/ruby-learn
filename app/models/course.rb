class Course
  include Mongoid::Document
  field :code, type: String
  field :name, type: String
  field :description, type: String
  field :type, type: String
end
