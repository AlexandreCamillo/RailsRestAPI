class ApplicationController < ActionController::API

	rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
	rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing

	def index
		redirect_to 'https://documenter.getpostman.com/view/4045681/SW7T8BaP'
	end

	# Mudando retorno padrão para erro de model não encontrada
	# para retornar erro no padrão
	def handle_record_not_found
		render json: { message: 'Recurso não encontrado', data: { } }, status: :not_found
	end

	# Mudando retorno padrão para erro body vazia
	# para retornar erro no padrão
	def handle_parameter_missing
		render json: { message: 'É necessário enviar dados para esse endpoint, veja: https://documenter.getpostman.com/view/4045681/SW7T8BaP', data: { } }, status: :bad_request
	end

end
