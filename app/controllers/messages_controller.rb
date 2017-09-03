class MessagesController < ApplicationController
  def index

    @messages = Message.all
  end

  def create
    p "_" * 50
    p "create messages"
    # "message"=>{"title"=>"", "text"=>"", "tag"=>""},
    title = params[:message][:title]
    text = params[:message][:text]
    tag_name = params[:message][:tag]
    autor = User.find(session[:user_id].to_i).name
    m = Message.create(title: title, text: text, autor: autor)
    if tag_name != ""
      t = Tag.create(name: tag_name)
      MessageTag.create(message_id: m.id, tag_id: t.id)
    end
    #  Tag.new()
    p "_" * 50
    @messages= Message.all
    render 'messages/index'

  end


end
