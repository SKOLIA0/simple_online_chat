module Api
  module V1
    class MessagesController < ApplicationController
      skip_before_action :verify_authenticity_token  #отключил проверку CSRF токена для create действия, так как это публичный API.

      def create
        @message = Message.new(message_params)
        if @message.save
          render json: { status: 'success', message: 'Message created successfully' }, status: :created
        else
          render json: { status: 'error', errors: @message.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def message_params
        params.require(:message).permit(:content, :chat_id)
      end
    end
  end
end
