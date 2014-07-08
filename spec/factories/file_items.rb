# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :file_item do
    file { File.open(File.join(Rails.root, '/spec/fixtures/files/demo.docx')) }
    factory :file_item_with_folder do
      file { File.open(File.join(Rails.root, '/spec/fixtures/files/sample.pdf')) }
      folder
    end
    factory :file_item_invalid do
      file { nil }
    end
  end
end
