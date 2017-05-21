Rails.application.routes.draw do
  apipie

  resources :jobs, module: 'jobs' do
    member do
      get :applications
    end
  end
  resources :applications, module: 'applications', only: [:index, :create, :delete]

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

end
