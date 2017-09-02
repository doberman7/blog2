class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    p "_" * 50
    p "create messages"
    # render "tags/index"
  end


end
