class AuthenticatesController < BaseController
  skip_before_action :authentication_required!

  def user_login
    # render json: { message: 'good'}
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      token = encode_token({ email: params[:email] })
      render json: { token:, user: }
    else
      render json: { error: 'Invalid email or password' }
    end
  end
end
