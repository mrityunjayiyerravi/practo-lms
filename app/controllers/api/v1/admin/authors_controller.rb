module Api
  module V1
    module Admin
      class AuthorsController < API::V1::ADMIN::AdminBaseController

        def get_all_authors
          show_response(status: true, msg: "All books found", payload: Author.all)
        end

        def add_author
          required(params, :first_name, :last_name)
          show_response
        end

      end
    end
  end
end
