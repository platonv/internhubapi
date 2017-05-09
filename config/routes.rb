Rails.application.routes.draw do
  apipie

  mount_devise_token_auth_for 'Admin', at: 'admin_auth'

  mount_devise_token_auth_for 'Company', at: 'company_auth', controllers: {
    registrations: 'companies/registrations'
  }

  mount_devise_token_auth_for 'Student', at: 'student_auth', controllers: {
    registrations: 'students/registrations'
  }

  mount_devise_token_auth_for 'University', at: 'university_auth', controllers: {
    registrations: 'universities/registrations'
  }

  as :university do
    # Define routes for University within this block.
  end

  as :student do
    namespace :students do
      get 'applications', :to => 'students#applications'
    end
  end

  as :company do
    namespace :jobs do
      get 'applications', :to => 'jobs#applications'
    end
  end

  as :admin do
    # Define routes for Admin within this block.
  end

  resources :jobs
  resources :applications
end
