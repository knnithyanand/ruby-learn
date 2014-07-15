class FilePathHelper

	def self.profile_pic
		FilePathHelper.new.profile_pic_default
	end

	def self.male_profile_pic
		FilePathHelper.new.profile_pic_male
	end

	def self.female_profile_pic
		FilePathHelper.new.profile_pic_female
	end

	def profile_pic_default
		File.join(Rails.root, "/spec/fixtures/profile_photos/#{any}/photo_#{(1..5).to_a.sample}.jpg")
	end

	def profile_pic_male
		File.join(Rails.root, "/spec/fixtures/profile_photos/#{male}/photo_#{(1..5).to_a.sample}.jpg")
	end

	def profile_pic_female
		File.join(Rails.root, "/spec/fixtures/profile_photos/#{female}/photo_#{(1..5).to_a.sample}.jpg")
	end

	def male; "male"; end;
	def female; "female"; end;
	def any; [ "male", "female" ].sample; end;
end
