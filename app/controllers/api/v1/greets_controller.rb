module Api
  module V1
    class GreetsController < BaseController
      # skip_before_action :authentication_required!
      def index
        result = Greeting.all
        render json: result.to_json({ only: %i[message id] })
      end

      def create
        greet = Greeting.new(params_checker)
        greet.user_id = @current_user.id
        render json: { message: 'Successfully created' } if greet.save
        render json: { error: 'Greeting not created' } unless greet.save
      end

      private

      def params_checker
        params.permit(:message)
      end
    end
  end
end
