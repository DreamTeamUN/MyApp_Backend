=begin require 'fileutils'

class Reporter
  def self.pdf_temp_path folder
    path = "public/PDFs/#{folder}/"
    FileUtils::mkdir_p path
    path
  end

  def self.reportPlayerProfileCollection(collect, collect_name)
  file_name = pdf_temp_path + 'report_user_collect_' + collect_name + '_' +
              Time.now.strftime("%Y%m%d%H%M%S") + '.pdf'
  i = 0
  Prawn::Document.generate(file_name) do
    image "#{Rails.root}/assets/pdf_back.jpg", at: [-50, 900], fit: [700, 1000]
    collect.each do |playerProfile|
      text playerProfile.pp_username + " report", align: :center, size: 20
      text "Player's email: " + playerProfile.email, size: 16
      text 'Spairing elo: ' + playerProfile.pp_spairing_elo.to_s, size: 16
      if(i==10)
        break
      end
      i = i + 1
    end
  end

  file_name[7..-1]
end
end
=end
