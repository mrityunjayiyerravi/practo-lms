module Api
  module V1
    module Admin
      class LibraryController < API::V1::ADMIN::AdminBaseController

        def add_library
          required(params, :name, :address, :city, :state, :country)
        end

        def get_all_libraries
          show_response(status: true, msg: "All libraries found", payload: Library.all)
        end

      end
    end
  end
end
