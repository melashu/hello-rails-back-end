class BaseController < ApplicationController
  # before_action :authentication_required!
  def authentication_required!
    header = request.headers['Authorization']
    if header.present?
      token = header.split.last
      decode_token = decode_token(token)
      @current_user = User.find_by(email: decode_token[:email])
      render json: { error: 'Authentication Required' }, status: 401 unless @current_user.present?
    else
      render json: { error: 'Authentication Required' }, status: 401
    end
  end

  private

  # encode_token is used to create
  # token using email
  def encode_token(payload, exp = 2.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
  # decode the token using key
  # and exteract the email address

  def decode_token(token)
    data = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    HashWithIndifferentAccess.new data
  end
end
