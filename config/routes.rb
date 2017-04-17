Rails.application.routes.draw do
  scope "(:locale)", locale:/en|vn/ do
   root "static_pages#home"
   get "static_pages/home"
   get "static_pages/help"
   get "static_pages/about"
  end
end
