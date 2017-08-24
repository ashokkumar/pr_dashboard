Rails.application.routes.draw do
  post '/', to: "pr#create"
  get '/', to: "pr#index"
  get 'pr/prs', to: "pr#prs_with_reviews"
  get 'pr/user_info', to: "pr#user_info"
end
