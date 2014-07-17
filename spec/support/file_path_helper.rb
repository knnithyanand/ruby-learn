class FilePathHelper

	## Section for profile pictures
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
	
	## Section for attachment files
	def self.any_file
		FilePathHelper.new.file_any
	end
	
	def self.audio_file
		FilePathHelper.new.file_audio
	end
	
	def self.image_file
		FilePathHelper.new.file_image
	end
	
	def self.word_file
		FilePathHelper.new.file_word
	end
	
	def self.pdf_file
		FilePathHelper.new.file_pdf
	end
	
	def self.ppt_file
		FilePathHelper.new.file_ppt
	end
	
	def self.video_file
		FilePathHelper.new.file_video
	end
	
	def self.zip_file
		FilePathHelper.new.file_zip
	end
	
	def self.excel_file
		FilePathHelper.new.file_excel
	end
	
	def file_any
		File.join(Rails.root, "/spec/fixtures/files/#{any_file_name}")
	end

	def file_audio
		File.join(Rails.root, "/spec/fixtures/files/#{audio_file_name}")
	end

	def file_image
		File.join(Rails.root, "/spec/fixtures/files/#{image_file_name}")
	end

	def file_word
		File.join(Rails.root, "/spec/fixtures/files/#{word_file_name}")
	end

	def file_pdf
		File.join(Rails.root, "/spec/fixtures/files/#{pdf_file_name}")
	end

	def file_ppt
		File.join(Rails.root, "/spec/fixtures/files/#{ppt_file_name}")
	end

	def file_video
		File.join(Rails.root, "/spec/fixtures/files/#{video_file_name}")
	end

	def file_zip
		File.join(Rails.root, "/spec/fixtures/files/#{zip_file_name}")
	end

	def file_excel
		File.join(Rails.root, "/spec/fixtures/files/#{excel_file_name}")
	end

	def any_file_name
		[ "275.mp3",
			"280.mp3",
			"course-logo.png",
			"demo.bad",
			"demo.docx",
			"example1.pdf",
			"imf-logo-goed.gif",
			"MSWord_Thesis_091.ppt",
			"Optimal-Product-Management-and-Product-Marketing-Training-Course-Logo-Large.jpg",
			"pdf-sample.pdf",
			"practicepowerpoint.ppt",
			"respondus-docx-sample-file_0.docx",
			"sample.pdf",
			"Sample.ppt",
			"small.mp4",
			"small.ogv",
			"test.docx",
			"test.zip",
			"text formula examples.xlsx",
			"worksheet functions.xlsx" ].sample
	end
	
	def audio_file_name
		[ "275.mp3",
			"280.mp3" ].sample
	end
	
	def image_file_name
		[ "course-logo.png",
			"imf-logo-goed.gif",
			"Optimal-Product-Management-and-Product-Marketing-Training-Course-Logo-Large.jpg" ].sample
	end
	
	def word_file_name
		[ "demo.docx",
			"respondus-docx-sample-file_0.docx" ].sample
	end
	
	def pdf_file_name
		[ "example1.pdf",
			"sample.pdf" ].sample
	end
	
	def ppt_file_name
		[ "MSWord_Thesis_091.ppt",
			"Sample.ppt" ].sample
	end
	
	def video_file_name
		[ "small.mp4",
			"small.ogv" ].sample
	end
	
	def zip_file_name
		"test.zip"
	end
	
	def excel_file_name
		[ "text formula examples.xlsx",
			"worksheet functions.xlsx" ].sample
	end
end
