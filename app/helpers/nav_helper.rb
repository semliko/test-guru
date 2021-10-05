
module NavHelper

  def user_home_path
    path = root_path
    if user_signed_in?
      path = current_user.admin? ? admin_tests_path : root_path
    end
    path
  end

end

