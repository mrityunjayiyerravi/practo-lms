class Author < ActiveRecord::Base
  has_many :author_books
  has_many :books, :through => :author_books

  def self.find_or_create_author(params)
    return nil unless params.is_a?(Hash)

    author_params = Hash[[:first_name, :last_name, :country_of_origin, :mini_bio, :wiki_link].map{ |attr| [attr, params[(:author_.to_s + attr.to_s).to_sym]] }]
    return nil if [:first_name, :last_name].map { |attr| author_params[attr] }.compact.empty?

    Author.find_or_create_by(author_params)
  end

end
