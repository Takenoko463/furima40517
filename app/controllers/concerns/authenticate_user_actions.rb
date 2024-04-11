module AuthenticateUserActions
  extend ActiveSupport::Concern
  def authenticate_user!
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def your_item?
    @item.user.id == current_user.id
  end

  def sold_out!
    return unless @item.order

    redirect_to root_path
  end
end
