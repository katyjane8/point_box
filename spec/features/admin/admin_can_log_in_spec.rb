require "rails_helper"

describe "admin sees login button on root page" do
  it "can see button" do
    visit "/"

    expect(page).to have_content("Log In")
  end

  it "can click the button and go to login page" do
    visit "/"

    click_link "Log In"

    expect(current_path).to eq("/login")
  end

  it "should see the form to login" do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit "/login"

    fill_in "username", with: admin.username
    fill_in "password", with: admin.password

    click_on "Log In"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Logout")
    expect(page).to have_content("Admin Dashboard")
  end
end
