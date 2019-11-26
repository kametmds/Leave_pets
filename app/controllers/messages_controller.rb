class MessagesController < ApplicationController
  def create
    #rooms/showのform_forで送られたbodyを含む全てのメッセージ情報の:messageと:room_idのキーがちゃんと入っているかということを条件で確認
    if Join.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :body, :room_id).merge(user_id: current_user.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to room_path(@message.room_id)
  end
end
