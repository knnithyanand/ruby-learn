require 'rails_helper'

RSpec.describe "Folders", :type => :request do

  describe "GET /folders" do

    it "works! (now write some real specs)" do
      get folders_path
      expect(response.status).to be(200)
    end

  end

  describe "as a teacher" do
		before :each do
		  @user = create(:teacher)

		  visit new_user_session_path
		  fill_in "Email", with:	@user.email
		  fill_in "Password", with: @user.password
		  click_button "Sign In"
		  expect(current_path).to eq(root_path)
		end

	  it "can create new folder" do
	    folder = build(:folder)
	    visit folders_path
	    click_on "New"
	    expect(current_path).to eq(new_folder_path)

	    fill_in "Name", with: folder.name
	    fill_in "Description", with: folder.description
	    click_on "Create Folder"

		  expect(current_path).to eq(folders_path)
		  expect(page).to have_content("Folder was successfully created.")
	  end
	  
	  it "can open folder" do
	    folder = build(:folder)
	    visit folders_path
	    click_on "New"
	    expect(current_path).to eq(new_folder_path)

	    fill_in "Name", with: folder.name
	    fill_in "Description", with: folder.description
	    click_on "Create Folder"

		  expect(current_path).to eq(folders_path)
		  click_on folder.name
		  expect(current_path).to eq(folder_file_items_path(Folder.last))
	  end
	  
		describe "on folder" do
			before :each do
			  @folder = create(:folder)
			  visit folder_file_items_path(@folder)
			end

#			it "can add files", js: true do
#				file_list = [ FilePathHelper.any_file, FilePathHelper.any_file ]
#				page.execute_script("$('#new_file_item').fileupload('add', { files: #{file_list} });")
#				sleep 5
#				visit folder_file_items_path(@folder)
#				expect(page).to have_content(Pathname.new(file_list[0]).basename)
#			end
		end
  end

end
