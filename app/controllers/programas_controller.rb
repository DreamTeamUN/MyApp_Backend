class ProgramasController < ApplicationController
  before_action :set_programa, only: [:show, :update, :destroy]

  # GET /programas
  def index
    @programas = Programa.all

    render json: @programas
  end

  # GET /programas/1
  def show
    render json: @programa
  end

  # POST /programas
  def create
    @programa = Programa.new(programa_params)

    if @programa.save
      render json: @programa, status: :created, location: @programa
    else
      render json: @programa.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /programas/1
  def update
    if @programa.update(programa_params)
      render json: @programa
    else
      render json: @programa.errors, status: :unprocessable_entity
    end
  end

  # DELETE /programas/1
  def destroy
    @programa.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programa
      @programa = Programa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def programa_params
      params.fetch(:programa, {})
    end
end
