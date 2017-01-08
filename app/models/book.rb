class Book < ActiveRecord::Base
  has_many :author_books
  has_many :authors, :through => :author_books
  has_and_belongs_to_many :libraries, join_table: :collections

  def self.is_book?(obj)
    obj.class.name == "Book"
  end

  def self.add_author(params, book_obj = nil)
    attr_list = [:book_name, :author_first_name, :author_last_name]
    if (params.to_a.empty? or (attr_list.map {|attr| params[attr] }.compact.count <  attr_list.count)) and not book_obj
      return { status: nil, msg: "All parameters need to be given" }
    else
      if Book.is_book?(book_obj)
        author = Author.find_or_create_author(params)
        book_obj.authors << author unless book_obj.authors.include?(author)
        return { status: true, msg: "Author #{params[:author_first_name]} has been added to book #{book_obj.try(&:name)}" }
      else
        book = Book.find_by_name(params[:book_name])
        if book
          author = Author.find_or_create_author(params)
          book.authors << author unless book.authors.include?(author)
          return { status: true, msg: "Author #{params[:author_first_name]} has been added to book #{params[:book_name]}!" }
        else
          return { status: nil, msg: "Couldn't find book with the name #{params[:book_name]}" }
        end
      end
    end
  end

  def self.new_entry(params)
    attr_list = [:name, :isbn13, :cover_type, :language, :publisher, :published_year, :genre, :category]
    if params.to_a.empty? or (attr_list.map {|attr| params[attr] }.compact.count <  attr_list.count)
      return { status: nil, msg: "All parameters need to be given" }
    else
      book = Book.create(attr_list.reduce({}){|acc,x| acc[x] = params[x];acc})
      Book.add_author(params, book)
      return { status: true, msg: "Book #{params[:name]} created!" }
    end
  end

  def self.find_books(params)
    return { status: nil, msg: "No search parameters provided!" } unless params.is_a?(Hash)

    attr_list = [:id, :name, :isbn13, :isbn10, :cover_type, :language, :publisher, :published_year, :genre, :category]
    attr_map = attr_list.inject({}) { |acc,attr| acc[attr] = params[attr] if params[attr]; acc }

    return { status: nil, msg: "Invalid search parameters given!" } if attr_map.empty?

    payload = Book.where(attr_map)
    return { status: nil,  msg: "No book found!" } if payload.empty?
    return { status: true, msg: "#{payload.to_a.count} Book(s) found!", payload: payload }
  end

  def self.get_authors(params, book_obj = nil)
    if Book.is_book?(book_obj)
      return { status: true, msg: "Author(s) of the book #{book_obj.try(&:name)}:", payload: book_obj.authors.to_a.map(&:attributes) }
    else
      resp = Book.find_books(params)
      return { status: nil,  msg: "No book found! Hence no authors!" } unless resp[:status]
      return { status: true, msg: "Authors for the books found:", payload: resp[:payload].reduce({}) { |acc, b| acc[b.try(&:name)] = b.try(&:authors).to_a.map(&:attributes); acc } }
    end
  end

end
