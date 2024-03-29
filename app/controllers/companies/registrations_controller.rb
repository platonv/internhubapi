module Companies
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    api! "Register new company"
    def create
      super
    end

    api! "Update company"
    def update
      super
    end

    api! "Delete company"
    def destroy
      super
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    end
  end
end
