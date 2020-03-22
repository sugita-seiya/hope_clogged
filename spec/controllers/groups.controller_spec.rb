require 'rails_helper'

describe GroupsController do
  describe 'GET #new' do
    it "newページに遷移するか" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "インスタンス変数の値が期待したものになるか" do
      report = create(:group)
      get :edit,params:{id:group}
      expect(assigns(:group)).to eq group
    end

    it "editアクションをリクエストした後、edit.html.erbに遷移するか" do
      report = create(:group)
      get :edit, params: { id: group }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "インスタンス変数の値が期待したものになるか" do
      reports = create_list(:group, 3)
      get :index
      expect(assigns(:groups)).to match(:groups.sort{ |a, b| b.created_at <=> a.created_at } )
    end
    it "正しいページに遷移するか" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "正しいページに遷移するか" do
      get :show
      expect(response).to render_template :show
    end
  end
end