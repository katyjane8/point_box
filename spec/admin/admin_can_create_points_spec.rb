describe "admin can create points" do
  context "when a user is an admin" do
    before(:each) do
      @admin = create(:user, role:1)
    end

    xit "allows admin to add points" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_points_path

      click_link "Create New Point"

      fill_in "point[title]", :with => "coffee points"
      fill_in "point[description]", :with => "java"
      click_on ("Create Point")

      expect(current_path).to eq(admin_points_path)
      expect(Point.count).to eq(1)
    end
  end
end
