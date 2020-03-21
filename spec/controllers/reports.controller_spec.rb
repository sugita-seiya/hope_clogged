require 'rails_helper'

describe ReportsController do
  describe 'GET #new' do
    it "newページに遷移するか" do
      get :new
      expect(response).to render_template :new
    end
  end
end