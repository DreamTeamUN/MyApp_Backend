class DocentesController < ApplicationController
  before_action :set_docente, only: [:show, :update, :destroy]

  # GET /docentes
  def index
    @docentes = Docente.all

    render json: @docentes
  end

  # GET /docentes/1
  def show
    render json: @docente
  end

  # POST /docentes
  def create
    @docente = Docente.new(docente_params)

    if @docente.save
      render json: @docente, status: :created, location: @docente
    else
      render json: @docente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /docentes/1
  def update
    if @docente.update(docente_params)
      render json: @docente
    else
      render json: @docente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /docentes/1
  def destroy
    @docente.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_docente
      @docente = Docente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def docente_params
      params.fetch(:docente, {})
    end
end
