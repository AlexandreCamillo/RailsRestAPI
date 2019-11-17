class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :update, :destroy]

  def index
    platforms = Platform.all
    render json: { message:'Plataformas carregadas com sucesso', data: platforms }, status: :ok
  end
  
  def show
    render json: { message: 'Plataforma carregada com sucesso', data: @platform }, status: :ok
  end

  def create
    @platform = Platform.new(platform_params)

    if @platform.save
      render json: { message: 'Plataforma criada com sucesso', data: @platform }, status: :created

    else
      render json: { message: 'Erro ao criar plataforma', data: { errors: @platform.errors } }, status: :unprocessable_entity
    end
  end

  def update
    if @platform.update(platform_params)
      render json: { message: 'Plataforma editada com sucesso', data: @platform }, status: :ok
    else
      render json: { message: 'Erro ao editar plataforma', data: { errors: @platform.errors } }, status: :unprocessable_entity
    end
  end

  def destroy
    @platform.destroy
    render json: { message: 'Plataforma deletada com sucesso' }, status: :ok
  end

  private

  def platform_params
    params.require(:platform).permit(:name, :email)
  end

  def set_platform
    @platform = Platform.find(params[:id])
  end
end
