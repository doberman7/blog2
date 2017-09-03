class MessagesController < ApplicationController
  def index
    p "-" * 50
    p "index de mensajes"
    # p session[:user_id]
    @messages = Message.all
  end

  def create
    p "_" * 50
    p "create messages"
    # "message"=>{"title"=>"", "text"=>"", "tag"=>""},
    title = params[:message][:title]
    text = params[:message][:text]
    input_in_the_form = params[:message][:tag]
    autor = User.find(session[:user_id].to_i).name
    m = Message.create(title: title, text: text, autor: autor)
    if input_in_the_form != ""
			# separate the input throw a regex with comas, ignoring black spaces and put in a Ary
			ary_whit_input = input_in_the_form.split (/\s*,\s*/)
			# itarate throw the ary
			ary_whit_input.each do |tag_name|
				# find if the tag already exists
				tag = Tag.find_by(name: tag_name)
				# if not already exists
				if tag.blank?
					# create a new tag
					tag = Tag.create(name: tag_name)
          MessageTag.create(message_id: m.id, tag_id: tag.id)
        else
          MessageTag.create(message_id: m.id, tag_id: tag.id)
          # p "_" * 50
				end
			end


    end

    # p "_" * 50
    @messages= Message.all
    render 'messages/index'

  end


end
