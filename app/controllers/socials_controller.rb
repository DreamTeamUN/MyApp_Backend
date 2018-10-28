class SocialsController < ApplicationController
  def create
  # puts params
    @user = User.search(params["email"])[0]

   if @user == nil
       p = Faker::Internet.password(8)
       @user = Usuario.create(user: params["name"],email: params["email"],
        password: p, password_confirmation: p)
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
