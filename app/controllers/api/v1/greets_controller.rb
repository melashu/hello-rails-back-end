module Api
  module V1
    class GreetsController < ApplicationController
      def index
        result = Greeting.all
        render json: result.to_json({ only: %i[message id] })
      end
    end
  end
end
