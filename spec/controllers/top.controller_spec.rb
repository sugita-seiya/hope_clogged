require 'rails_helper'

describe TopController do
  describe 'GET #index' do
    it "正しいページに遷移するか" do
      get :index
      expect(response).to render_template :index
    end
  end
end