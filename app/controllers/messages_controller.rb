class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    #rooms/showのform_forで送られたbodyを含む全てのメッセージ情報の:messageと:room_idのキーがちゃんと入っているかということを条件で確認
    if Join.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :body, :room_id).merge(user_id: current_user.id))
      if @message.valid?
        flash[:notice] = "メッセージ送信しました。"
      else
        flash[:notice] = "メッセージ送信できませんでした。"
      end
    end
    redirect_to room_path(@message.room_id)
  end

  def destroy
    @message = Message.find(params[:id])
    @room = @message.room
    if user_check(@message.user)
      @message.destroy
      flash[:notice] = "メッセージ削除しました"
    else
      flash[:notice] = "メッセージ削除できません"
    end
    redirect_to @room
  end
end
