class TipoUsuariosController < ApplicationController
  before_action :set_tipo_usuario, only: [:show, :update, :destroy]

  # GET /tipo_usuarios
  def index
    @tipo_usuarios = TipoUsuario.all

    render json: @tipo_usuarios
  end

  # GET /tipo_usuarios/:id
  def show
    render json: @tipo_usuario
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_usuario
      @tipo_usuario = TipoUsuario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipo_usuario_params
      params.require(:tipo_usuario).permit(:nombre)
    end
end
