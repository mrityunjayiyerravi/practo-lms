Rails.application.routes.draw do
  api_version(:module => "API::V1", :path => {:value => "v1"}, :default => true) do
    namespace :admin do
      resources :books do
        collection do
          get 'get_books'
          get 'find_books'
          get 'get_all_books'
          post 'add_book'
        end
      end

      resources :authors do
        collection do
          get 'get_all_authors'
          post 'add_author'
        end
      end

      resources :library do
        collection do
          get 'get_all_libraries'
          post 'add_library'
        end
      end

    end
  end
end
