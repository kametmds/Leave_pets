module UsersHelper

  #ログインユーザーと編集しようとしているユーザーのidが一致しない場合にアクセスを拒否
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to users_path
    end
  end

  # ログインユーザーと編集しようとしている投稿のユーザーidが一致しない場合にアクセスを拒否
  # def forbid_wrong_user
  #   if current_user.id != @space.user.id
  #     flash[:notice] = "編集権限がありません"
  #     redirect_to @space
  #   end
  # end

  # ログインユーザーと編集しようとしている投稿のユーザーidが一致しない場合にアクセスを拒否(引数指定共通版)
  def forbid_wrong_user(arg)
    if current_user.id != arg.user.id
      flash[:notice] = "権限がありません"
      redirect_to arg
    end
  end

  def user_check(arg)
    current_user.id == arg.id
  end

  def connect_room
    # if params[:format]
    #   @user = User.find(params[:format])
    # elsif params[:id]
    #   @user = User.find(params[:id])
    # end
    #現在ログインしているユーザがRoomに参加している情報
    @currentUserJoin = Join.where(user_id: current_user.id)
    #指定したユーザがRoomに参加している情報
    @userJoin = Join.where(user_id: @user.id)
    #自分相手にDMできないようにする為
    unless @user.id == current_user.id
      #現在ログインしているユーザがRoomに参加している情報から更に、
      @currentUserJoin.each do |cu|
        #指定したユーザがそのRoomに参加している情報をeachで一つずつ取り出し、
        @userJoin.each do |u|
          #既にお互いのRoomがあったら(Roomに参加していたら)条件文⬇︎
          if cu.room_id == u.room_id
            #Roomがない時(参加していない時)の処理用
            @isRoom = true
            # それぞれJoinsテーブル内にあるroom_idが共通しているユーザ同士に対して@roomId = cu.room_idという変数を指定します。
            @roomId = cu.room_id
          end
        end
      end
    end
    #@isRoomがfalse（ルームが作成されていない）ならRoomインスタンスとJoinインスタンスを作成する。
    unless @isRoom
      @room = Room.new
      @join = Join.new
    end
  end
end
