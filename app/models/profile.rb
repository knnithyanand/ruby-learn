class Profile
  include Mongoid::Document
  include Mongoid::Timestamps

	## Mass assignment protection
  attr_accessible :first_name,
  								:middle_name,
  								:last_name,
  								:nickname,
  								:gender,
  								:date_of_birth,
  								:postal_addresses,
  								:email_addresses,
  								:phone_numbers,
  								:photo,
  								:roles

	## Demographic Fields
  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String
  field :nickname, type: String
  field :gender, type: String
  field :date_of_birth, type: Date

	## Validation for demographic fields
  validates_presence_of :first_name,
  											:nickname,
  											:gender,
  											:date_of_birth

	## Postal Address (List)
  embeds_many :postal_addresses, as: :addressable

	## Email Address (List)
  embeds_many :email_addresses, as: :emailable

	## Phone Number (List)
  embeds_many :phone_numbers, as: :phoneable

	## Enrollment List
  has_many :enrollments

	## Profile Picture
  mount_uploader :photo, PhotoUploader

	## Belongs to any profilable object
  belongs_to :profileable, polymorphic: true

	## Full Name (fname mname lname)
  def full_name
    (self.first_name if self.first_name) +
    (self.middle_name + ' ' if self.middle_name) +
    (self.last_name + ' ' if self.last_name)
  end

  ## Roles
  ROLES = %i[ guest student teacher administrator ]
  field :roles_mask, type: Integer

	def add_role(role)
		self.roles += [ role ]
	end

	def remove_role(role)
		self.roles -= [ role ]
	end

	def add_roles(roles)
		self.roles += roles
	end

	def remove_roles(roles)
		self.roles -= roles
	end

	def roles=(roles)
		roles = [*roles].map { |r| r.to_sym }
		self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
	end

	def roles
		ROLES.reject do |r|
		  ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
		end
	end

	def has_role?(role)
		roles.include?(role)
	end

	## Frendly messages for changes
  def created
    Humanize.format_date('created ', created_at)
  end

  def updated
    Humanize.format_date('last updated ', updated_at)
  end
end
