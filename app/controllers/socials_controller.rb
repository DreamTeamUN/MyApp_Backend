class SocialsController < ApplicationController
  def create
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


 end
end
