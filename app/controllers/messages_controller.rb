class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    render "tags/index"
  end


end
