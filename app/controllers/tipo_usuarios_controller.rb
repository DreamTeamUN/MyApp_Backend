class TipoUsuariosController < ApplicationController
  before_action :set_tipo_usuario, only: [:show, :update, :destroy]

  # GET /tipo_usuarios
  def index
    @tipo_usuarios = TipoUsuario.all

    render json: @tipo_usuarios
  end

  # GET /tipo_usuarios/1
  def show
    render json: @tipo_usuario
  end

  # POST /tipo_usuarios
  def create
    @tipo_usuario = TipoUsuario.new(tipo_usuario_params)

    if @tipo_usuario.save
      render json: @tipo_usuario, status: :created, location: @tipo_usuario
    else
      render json: @tipo_usuario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipo_usuarios/1
  def update
    if @tipo_usuario.update(tipo_usuario_params)
      render json: @tipo_usuario
    else
      render json: @tipo_usuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipo_usuarios/1
  def destroy
    @tipo_usuario.destroy
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
