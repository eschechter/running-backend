class AuthController < ApplicationController
  def create
    user = User.find_by(email: user_login_params[:email])
    if user && user.authenticate(user_login_params[:password])
      token = JWT.encode({ user_id: user.id }, "secret")
      render json: { user: user, jwt: token }
    else
      render json: { message: "Invalid email or password" }
    end
  end

  def retrieve
    token = request.headers["Authorization"]
    user_id = JWT.decode(token, "secret")[0]["user_id"]
    user = User.find(user_id)
    render json: user
  end

  private

  def user_login_params
    params.require(:user).permit(:email, :password)
  end
end
