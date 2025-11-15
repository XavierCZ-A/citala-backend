class Api::Authentication::SessionsController < Api::BaseController
  skip_before_action :authenticate_user!

  def create
    if user = User.authenticate_by(email: params[:email], password: params[:password])

      payload = {
        user_id: user.id,
        email: user.email,
        full_name: user.full_name
      }

      token = JsonWebToken.encode(payload)

      render json: { token: token }, status: :ok
    else
      render json: { errors: [ "Invalid email address or password" ] }, status: :unauthorized
    end
  end
end
