class FrasePnlsController < ApplicationController
  before_action :set_frase_pnl, only: [:show, :update, :destroy]

  # GET /tipo_usuarios/:tipo_usuario_id/frase_pnls
  def index

    if params[:tipo_usuario_id].to_i == 0
      @frase_pnls = FrasePnl.all
    else
      @frase_pnls = FrasePnl.by_tipo_usuario(params[:tipo_usuario_id])
    end
    render json: @frase_pnls

  end

  # GET /frase_pnls/:id
  def show
    render json: @frase_pnl
  end

  # POST /tipo_usuarios/:tipo_usuario_id/frase_pnls
  def create
    @frase_pnl = FrasePnl.new(frase_pnl_params)
    @frase_pnl.tipo_usuario_id = params[:tipo_usuario_id]

    if @frase_pnl.save
      render json: @frase_pnl, status: :created, location: @frase_pnl
    else
      render json: @frase_pnl.errors, status: :unprocessable_entity
    end
  end

  # DELETE /frase_pnls/:id
  def destroy
    @frase_pnl.destroy
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frase_pnl
      @frase_pnl = FrasePnl.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def frase_pnl_params
      params.require(:frase_pnl).permit(:frase)
    end
end
