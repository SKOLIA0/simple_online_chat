class MessagesController < ApplicationController

  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)

    if @message.save
      respond_to do |format|
        format.turbo_stream do
          streams = []
          streams << turbo_stream.append("messages_list", partial: "messages/message", locals: { message: @message })
          streams << turbo_stream.append("notifications", partial: "messages/notification", locals: { chatTitle: @chat.title, messageContent: @message.content })
          render turbo_stream: streams.join
        end
        format.html { redirect_to @chat }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
