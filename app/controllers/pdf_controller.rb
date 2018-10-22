class PdfController < ApplicationController

  def generate
    UserReporter.new.basic_report(params[:usuario_id])
    render html: "OK!"
  end
end
