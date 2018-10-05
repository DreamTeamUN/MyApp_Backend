class FrasePnlsController < ApplicationController
  before_action :set_frase_pnl, only: [:show, :update, :destroy]

  # GET /frase_pnls
  def index
    @frase_pnls = FrasePnl.all

    render json: @frase_pnls
  end

  # GET /frase_pnls/1
  def show
    render json: @frase_pnl
  end

  # POST /frase_pnls
  def create
    @frase_pnl = FrasePnl.new(frase_pnl_params)

    if @frase_pnl.save
      render json: @frase_pnl, status: :created, location: @frase_pnl
    else
      render json: @frase_pnl.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /frase_pnls/1
  def update
    if @frase_pnl.update(frase_pnl_params)
      render json: @frase_pnl
    else
      render json: @frase_pnl.errors, status: :unprocessable_entity
    end
  end

  # DELETE /frase_pnls/1
  def destroy
    @frase_pnl.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frase_pnl
      @frase_pnl = FrasePnl.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def frase_pnl_params
      params.require(:frase_pnl).permit(:frase, :tipo_usuario_id)
    end
end
