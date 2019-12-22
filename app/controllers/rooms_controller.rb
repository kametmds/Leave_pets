class RoomsController < ApplicationController

  def index
    @currentJoins = current_user.joins
    myRoomIds = []
    @currentJoins.each do |join|
      myRoomIds << join.room.id
    end
    @anotherJoins = Join.where(room_id: myRoomIds).where.not(user_id: current_user)
  end

  def create
    # users/showのform_forの@roomで送られてきたパラメータを、ここで受け取りcreate
    @room = Room.create
    # 同時に子モデルのjoinもcreateする必要がある⬇︎
    @join1 = Join.create(room_id: @room.id, user_id: current_user.id)
    # users/showmのfields_forの@entryで保存したパラメータ(:user_id, :room_id)を許可し、@roomにひもづくidを保存。
    @join2 = Join.create(params.require(:join).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    #ログインユーザーのidとそれにひもづいたRoomのidがJoinテーブルにあったら条件文⬇︎
    if Join.where(user_id: current_user.id, room_id: @room.id).present?
      #MessageテーブルにRoomのidと紐づいたメッセージを表示させる為、アソシエーションを利用した記述。
      @messages = @room.messages.order(created_at: :desc)
      #新しくメッセージを作成する。
      @message = Message.new
      #rooms/showでユーザー情報を表示させる。
      @joins = @room.joins
    else
      #なかったら条件文⬇︎前のページに戻る。
      redirect_back(fallback_location: root_path)
    end
  end
end