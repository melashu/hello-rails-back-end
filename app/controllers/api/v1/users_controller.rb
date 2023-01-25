class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(params_checker)
    render json: { success: 'Successfuly created' }, status: :ok if user.save
    render json: { error: 'Something went wrong!' }, status: 401 unless user.save
  end

  private

  def params_checker
    params.permit(:name, :email, :password)
  end
end
