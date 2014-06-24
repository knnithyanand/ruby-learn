class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessible :first_name, :middle_name, :last_name, :nickname, :gender, :date_of_birth, :postal_addresses, :email_addresses, :phone_numbers, :photo
  
  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String
  field :nickname, type: String
  field :gender, type: String
  field :date_of_birth, type: Date

  validates_presence_of :first_name, :nickname, :gender, :date_of_birth

  embeds_many :postal_addresses, as: :addressable
  embeds_many :email_addresses, as: :emailable
  embeds_many :phone_numbers, as: :phoneable

  mount_uploader :photo, PhotoUploader
    
  belongs_to :profileable, polymorphic: true

  ## Roles
  has_and_belongs_to_many :user_roles
  scope :in_role, ->(role){ where(role: role) }
  scope :not_in_role, ->(role){ where(role: { '$ne' => role }) }
  
  def created
    Humanize.format_date('created ', created_at)
  end

  def updated
    Humanize.format_date('last updated ', updated_at)
  end
end
