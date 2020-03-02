class TopController < ApplicationController

  def index
    @group = Group.new
  end

end
