class DocentesController < ApplicationController
  before_action :set_docente, only: [:show, :update, :destroy]

  # GET docentes/:page
  def index
    @docentes = Docente.total(params[:page])

    render json: @docentes
  end

  # GET /docente/:id
  def show
    render json: @docente
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_docente
      @docente = Docente.find(params[:id])
    end
end
