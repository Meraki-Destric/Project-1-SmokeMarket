class Registrations_Controller < Devise::Registrations_Controller
  protected

  def after_sign_up_path_for(resource)
    # Set a path here and the user will be redirect there after they sign up
    # Returns them to home
    "/"
  end
end
