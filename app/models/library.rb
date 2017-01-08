class Library < ActiveRecord::Base
  has_many :books, :through => :collections
  has_and_belongs_to_many :books, join_table: :collections

  def self.is_library?(obj)
    obj.class.name == "Library"
  end

  def self.add_racks_and_rows(num_racks, rows_per_rack)
    return { status: nil, msg: "Insufficient params given" }
  end

  def self.new_entry(params)
    attr_list = [:name, :address, :city, :state, :country, :total_capacity]
    if params.to_a.empty? or (attr_list.map {|attr| params[attr] }.compact.count <  attr_list.count)
      return { status: nil, msg: "All parameters need to be given" }
    else
      Library.create(attr_list.reduce({}){|acc,x| acc[x] = params[x];acc})
      return { status: true, msg: "Library #{params[:name]} created!" }
    end
  end



end
