book_template = [:name, :isbn13, :isbn10, :cover_type, :language, :publisher, :genre, :category]

1.upto(20) do |itr|
  params = book_template.inject({}){|acc,x| acc[x] = x.to_s + itr.to_s; acc}
  params[:id] = itr
  params[:published_year] = (Time.now - itr.year).to_s
  Book.create(params)
end

author_template = [:first_name, :last_name, :country_of_origin, :mini_bio, :wiki_link]

1.upto(20) do |itr|
  params = author_template.inject({}){|acc,x| acc[x] = x.to_s + itr.to_s; acc}
  params[:id] = itr
  Author.create(params)
end

library_template = [:name, :address, :city, :state, :country]

1.upto(5) do |itr|
  params = library_template.inject({}){|acc,x| acc[x] = x.to_s + itr.to_s; acc}
  params[:id] = itr
  params[:total_capacity] = 10*itr
  Library.create(params)
end

Book.all.each{ |book|
  book.authors << Author.find(book.id)
}

Library.all.each {|lib|
  num_of_racks = (lib.total_capacity/10)
  1.upto(num_of_racks) do |x|
    rowrack = Rowrack.create({ library_id: lib.id, category: "mixed", genre: "mixed"})
    1.upto(5) do |y|
      row = Row.create({ rowrack_id: rowrack.id, library_id: lib.id, row_number: y})
    end
  end
}

borrower_template = [:first_name, :last_name, :city, :state, :country]

1.upto(10) do |itr|
  params = borrower_template.inject({}){|acc,x| acc[x] = x.to_s + itr.to_s; acc}
  params[:id] = itr
  params[:mobile_number] = "1234567890"
  Borrower.create(params)
end
