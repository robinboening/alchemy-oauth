::Doorkeeper.configure do
  orm :active_record

  # This block will be called to check whether the resource owner is authenticated or not.
  resource_owner_authenticator do
    current_user || begin
      session[:redirect_path] = request.fullpath
      redirect_to(alchemy.login_path)
    end
  end

  skip_authorization do
    true
  end

  # If you want to restrict access to the web interface for adding oauth authorized applications, you need to declare the block below.
  admin_authenticator do
    next if current_user && current_user.admin?
    redirect_to(alchemy.login_path)
  end
end