module Api
  module V1
    module Admin
      class BooksController < API::V1::ADMIN::AdminBaseController

        def get_all_books
          show_response(status: true, books: Book.all )
        end

        def add_book
          required(params, :name, :isbn13, :cover_type, :language, :publisher, :published_year, :genre, :category, :author_first_name, :author_last_name)
          show_response(Book.new_entry(params))
        end

        def find_books
          show_response(Book.find_books(params))
        end

        def get_authors
          show_response(Book.get_authors(params))
        end

      end
    end
  end
end
