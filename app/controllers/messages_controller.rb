require 'openpay'
class MessagesController < ApplicationController

  def charges
    # p "*" * 50
    # p "charges"
    # Objeto de open open pay con llaves publica y privada
    @openpay=OpenpayApi.new("mzdtln0bmtms6o3kck8f","sk_e568c42a6c384b7ab02cd47d2e407cab")
    #crear el recurso "cargos" con la fabrica de meotodos de open pay
    @charges=@openpay.create(:charges)
    # se agregan su datos de llamada
    request_hash={
         "method" => "store",
         "amount" => params[:charges][:amount],
         "description" => "Cargo con tienda"
       }
    # se obtiene la respuesta en un hash (también se puede hacer con objetos JSON)
    response_hash=@charges.create(request_hash.to_hash)
    # agregar a una variable global para poder verlos en la modal
    @resp = response_hash
    # p "*" * 50
  end

  def openpay
    # p "_" * 50
    # p "openpay"
    # #merchant and private key
    # merchant_id='mywvupjjs9xdnryxtplq'
    # private_key='sk_92b25d3baec149e6b428d81abfe37006'
    # #An openpay resource factory instance is created out of the OpenpayApi
    # openpay=OpenpayApi.new(merchant_id,private_key)
    # # The openpay factory instance is in charge to generate the required resources through a factory method (create)
    # p charges=openpay.create(:charges)
    # p "_" * 50
  end

  def index
    # p "-" * 50
    # p "index de mensajes"
    # p session[:user_id]
    @messages = Message.all
  end

  def create
    # p "create messages"
    # "message"=>{"title"=>"", "text"=>"", "tag"=>""},
    title = params[:message][:title]
    text = params[:message][:text]
    input_in_the_form = params[:message][:tag]
    autor = User.find(session[:user_id].to_i).name
    m = Message.create(title: title, text: text, autor: autor)
    if input_in_the_form != ""
      input_in_the_form.downcase!
			# separate the input throw a regex with comas, ignoring black spaces and put in a Ary
			ary_whit_input = input_in_the_form.split (/\s*,\s*/)
      ary_whit_input.uniq!
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
				end
			end
    end
    @messages= Message.all
    render 'messages/index'
  end

  def search
    # p "_" * 50
    # p "messages_search"
    # asignar el parametro del formulario
    @word = params[:search][:word]
    # a menos que el parametro venga en blanco, convertir el string en minuscula
    @word.downcase! unless @word == ""
    # buscaar aquellos donde el títulos es igual a la palabra buscada
    @mtitle = Message.where(title: @word)
    # invertir orden de mensajes, no, estaba buscando todos originalemente, sólo los del seed, asi que usamos está solución,
    mensajes = Message.all.reverse
    # hacer un ary vacio
    @mtext = []
    # mapear los mensajes
    mensajes.map do|m|
      # separar por palabra el text, en una array
      text =  m.text.scan(/\w+/)
      # iterar en cada texto
      text.each do |t|
        #  si alguna palabra es igual a uno de los elementos del text, empujar id a la variable de instance
         @mtext << Message.where(id: m.id) if t == @word
      end
    end
    # unifocar todos los arys en un solo nivel
     @mtext.flatten!

    # buscaar aquellos donde el autor es igual a la palabra buscada
    @mautor = Message.where(autor: @word)
    # buscaar aquellos donde el nombre es igual a la palabra buscada
    @tname = Tag.where(name: @word)

    p "_" * 50
  end

end
