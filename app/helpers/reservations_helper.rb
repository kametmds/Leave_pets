module ReservationsHelper
   # 予約のホストユーザーと編集しようとしているユーザーidが一致しない場合にアクセスを拒否
   def forbid_wrong_user(arg)
    if current_user.id != arg.user.id
      flash[:notice] = "権限がありません"
      redirect_to arg
    end
  end
end
