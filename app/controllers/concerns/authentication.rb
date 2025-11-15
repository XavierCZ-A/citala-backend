module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { error: "No se encontró el recurso" }, status: :not_found
    end

    rescue_from JWT::DecodeError do |e|
      render json: { error: "Token inválido" }, status: :unauthorized
    end

    rescue_from JWT::ExpiredSignature do |e|
      render json: { error: "Token expirado" }, status: :unauthorized
    end
  end

  private

  def authenticate_user!
    @current_user = start_new_session
    unless @current_user
      render json: { error: "Autenticación requerida" }, status: :unauthorized
    end
  end

  def start_new_session
    header = request.headers["Authorization"]
    return nil unless header.present?
    token = header.split(" ").last

    decode_token = JsonWebToken.decode(token)
    User.find_by(id: decode_token[:user_id])
  end

  def current_user
    @current_user
  end
end
