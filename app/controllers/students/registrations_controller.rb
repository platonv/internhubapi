module Students
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    api! "Register new student"
    def create
      super
    end

    api! "Update student"
    def update
      super
    end

    api! "Delete student"
    def destroy
      super
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name])
    end
  end
end
