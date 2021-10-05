
module NavHelper

  def user_home_path
    user_signed_in? && current_user.admin? ? admin_tests_path : root_path
  end

end

