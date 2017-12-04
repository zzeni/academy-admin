Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/', as: 'rails_admin'
  root to: "rails_admin/main#dashboard"
end
