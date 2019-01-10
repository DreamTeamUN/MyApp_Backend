class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :update, :destroy]

  # GET /tutors
  def index
    @tutors = Tutor.total(params[:page])

    render json: @tutors
  end

  # GET /tutor/:id
  def show
    render json: @tutor
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor
      @tutor = Tutor.find(params[:id])
    end
end
