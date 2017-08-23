Rails.application.routes.draw do
  post '/', to: "pr#create"
  get '/', to: "pr#index"
end
