class ProgramasController < ApplicationController
  before_action :set_programa, only: [:show, :update, :destroy]

  # GET /programas
  def index
    @programas = Programa.all

    render json: @programas
  end

  # GET /programas/:id
  def show
    render json: @programa
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programa
      @programa = Programa.find(params[:id])
    end
end
