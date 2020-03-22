require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe 'GET #index' do
    it "正しいページに遷移するか" do
      get :index
      expect(response).to render_template :index
    end
  end
end
