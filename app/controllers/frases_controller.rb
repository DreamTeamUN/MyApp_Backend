class FrasesController < ApplicationController
  before_action :set_frase, only: [:show, :update, :destroy]

  # GET /frases
  def index
    @frases = Frase.all

    render json: @frases
  end

  # GET /frases/1
  def show
    render json: @frase
  end

  # POST /frases
  def create
    @frase = Frase.new(frase_params)

    if @frase.save
      render json: @frase, status: :created, location: @frase
    else
      render json: @frase.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /frases/1
  def update
    if @frase.update(frase_params)
      render json: @frase
    else
      render json: @frase.errors, status: :unprocessable_entity
    end
  end

  # DELETE /frases/1
  def destroy
    @frase.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frase
      @frase = Frase.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def frase_params
      params.require(:frase).permit(:frase, :leccion_id)
    end
end
