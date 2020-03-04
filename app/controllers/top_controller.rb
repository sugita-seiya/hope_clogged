class TopController < ApplicationController
  before_action :set_group
  
  def index
  end

  private
  def set_group
    @group = Group.find_by(params[:group_id])
  end
end
