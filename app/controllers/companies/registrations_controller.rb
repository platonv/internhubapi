module Companies
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    resource_description do
      short "Companies"
    end
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
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
    end
  end
end
