module UsersHelper

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to users_path
    end
  end

  def user_check(user)
    current_user.id == user.id
  end
end
