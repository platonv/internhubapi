Rails.application.routes.draw do
  apipie
   
  mount_devise_token_auth_for 'Admin', at: 'admin_auth'

  mount_devise_token_auth_for 'Company', at: 'company_auth'

  mount_devise_token_auth_for 'Student', at: 'student_auth'

  mount_devise_token_auth_for 'University', at: 'university_auth'

  as :university do
    # Define routes for University within this block.
  end
  as :student do
    # Define routes for Student within this block.
  end
  as :company do
    # Define routes for Company within this block.
  end
  as :admin do
    # Define routes for Admin within this block.
  end

  resources :jobs
end
