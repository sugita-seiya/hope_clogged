class TopController < ApplicationController
  before_action :set_group
  
  def index
    # @group = User.find(current_user.id).groups
    # puts @group.length
    # @group.each do |g|
    #   puts "group-name:" + g.name
    # end
  end

  private
  def set_group
    @group = Group.find_by(params[:group_id])
  end
end
