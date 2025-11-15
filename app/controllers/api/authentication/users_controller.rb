class Api::Authentication::UsersController < Api::BaseController
  skip_before_action :authenticate_user!

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_content
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.expect(user: [ :email, :password, :first_name, :last_name ])
    end
end
