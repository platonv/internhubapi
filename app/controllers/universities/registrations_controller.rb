module Universities
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    api! "Register new university"
    def create
      super
    end

    api! "Update university"
    def update
      super
    end

    api! "Delete university"
    def destroy
      super
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
    end
  end
end