class Restaurant
  include DataMapper::Resource

  property :id , Serial
  property :name , String
  property :post_code , String, unique: true , message: 'Post code already exists'

  validates_presence_of :post_code, :name
end
