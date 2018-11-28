require 'httparty'
require 'json'

class SocialsController < ApplicationController
  include HTTParty
  def create
    url = "https://www.googleapis.com/oauth2/v3/tokeninfo?"
    response= HTTParty.get url, :headers=>{"Authorization"=>"Bearer \"#{params["token"]}\""}
    response = response.parsed_response
    if response["email_verified"] == "true"
  # puts params
      @user = Usuario.find_by(email: params["email"] )

      if @user == nil
        p = Faker::Internet.password(8)
        @user = Usuario.create(user: params["name"],email: params["email"],
          password: p, password_confirmation: p, nombre: params["name"], tipo_usuario_id: 1 )
          if @user.save
            knock_token = Knock::AuthToken.new payload: { sub: @user.id }
            render json:  knock_token
          else

          end
      else
        knock_token = Knock::AuthToken.new payload: { sub: @user.id }
        render json:  knock_token
      end
    else
      render json: {}, status: 401

    end

 end
end
