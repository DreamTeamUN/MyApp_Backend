namespace :user_check do
  desc "Verifica la ultima conexion de los usuarios"
  task check_login: :environment do

    Usuario.find_each(start: 1) do |user|
      meses = ((Date.today - user.last_login)/30).to_i

      if(meses == 1 || (meses%4 == 0 && meses > 0))
        CheckLoginJob.perform_now(user)
      end
    end

    puts "Daily check Complete!"

  end

end
