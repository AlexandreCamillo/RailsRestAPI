class PlatformsController < ApplicationController
  def show
    platform = Platform.find(params[:id])
    render json: { message: 'Plataforma carregada com sucesso', data: platform }, status: :ok
  end

  def list
    platforms = Platform.order('created_at DESC')

    render json: { message:'Plataformas carregadas com sucesso', data: platforms }, status: :ok
  end

  def create
    platform = Platform.new(platform_params)

    if platform.save
      render json: { message: 'Plataforma criada com sucesso', data: platform }, status: :ok

    else
      render json: { message: 'Erro ao criar plataforma', data: { errors: platform.errors } }, status: :unprocessable_entity
    end
  end

  def update
    platform = Platform.find(params[:id])

    if platform.update(platform_params)
      render json: { message: 'Plataforma editada com sucesso', data: platform }, status: :ok
    else
      render json: { message: 'Erro ao editar plataforma', data: { errors: platform.errors } }, status: :unprocessable_entity
    end
  end

  def delete
    Platform.find(params[:id]).destroy
    render json: { message: 'Plataforma deletada com sucesso' }, status: :ok
  end

  private

  def platform_params
    params.require(:platform).permit(:name, :email)
  end
end
