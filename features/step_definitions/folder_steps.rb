Given(/^I have folders? called (.+)$/) do |folders|
  folders.split(", ").each do |folder|
    Folder.create!(:name => folder, :description => 'Description for team folder - ' + folder)
  end
end
