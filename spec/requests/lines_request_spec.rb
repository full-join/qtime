require 'rails_helper'

RSpec.describe "Lines", type: :request do
  describe "creating a line" do
    let :place {Place.create(google_id: "XYZ")}
    let :user {User.create(email: "test@example.com", password: "abcd")}
    it "creates a line" do
      params = {line:{place_id:}}
      expect{post lines_path, params: params}.to change{Line.count}.by(1)
    end
  end

end
