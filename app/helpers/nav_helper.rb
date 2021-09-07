
module NavHelper

  def user_home_path
    current_user.admin? ? admin_tests_path : root_path
  end

end

