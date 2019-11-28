class MessagesController < ApplicationController
  def create
    #rooms/showのform_forで送られたbodyを含む全てのメッセージ情報の:messageと:room_idのキーがちゃんと入っているかということを条件で確認
    if Join.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :body, :room_id).merge(user_id: current_user.id))
      flash[:notice] = "メッセージ送信しました。"
    end
    redirect_to room_path(@message.room_id)
  end

  def destroy
    @message = Message.find(params[:id])
    @room = @message.room
    @message.destroy
    redirect_to @room, notice: 'メッセージ削除しました'
  end
end
