class UsuariosController < ApplicationController
  before_action :authenticate_usuario, only: [:index,:show, :update, :destroy]
  before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /usuarios/:id
  def show
    render json: @usuario
  end

  # POST /tipo_usuarios/:tipo_usuario_id/usuarios
  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.last_login = Date.today

    if params[:tipo_usuario_id] != 0
      @usuario.tipo_usuario_id = params[:tipo_usuario_id]
    end

    if @usuario.save

      case @usuario.tipo_usuario_id

      when 1 #Tutor

        @trigger = Tutor.new(usuario_id: @usuario.id)
        text = "tutor"

      when 2 #Docente

        @trigger = Docente.new(usuario_id: @usuario.id)
        text = "docente"

      end

      if @trigger.save
        WelcomeMailer.with(usuario: @usuario).welcome_email.deliver
        render json: {"usuario": @usuario,"#{text}": @trigger}, status: :created, location: @usuario
      else
        @usuario.destroy
        render json: @trigger.errors, status: :unprocessable_entity
      end

    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /usuarios/:id
  def update
    if @usuario.update(usuario_patch)
      render json: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usuarios/:id
  def destroy
    @usuario.destroy
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def usuario_params
      params.require(:usuario).permit(:user, :password, :nombre, :email, :fecha_nacimiento)
    end

    def usuario_patch
      params.require(:usuario).permit(:password, :nombre, :email, :fecha_nacimiento)
    end
end
