Rails.application.routes.draw do
  resources :projects
  resources :personas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
post 'personas/:persona_id/projects', to: 'personas_projects#create', as: 'personas_projects'
post 'projects/:project_id/personas', to: 'projects_personas#create', as: 'projects_personas'
delete 'projects/:project_id/personas/:persona_id', to: 'projects_personas#destroy', as: 'delete_project_persona'
delete 'personas/:persona_id/projects/:project_id', to: 'personas_projects#destroy', as: 'delete_persona_project'
 root 'projects#index'
end
