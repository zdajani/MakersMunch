class Restaurant
  include DataMapper::Resource

  property :id , Serial
  property :name , String
  property :place_id , String, unique: true , message: 'Restaurant already exists'

  has n, :tags, through: Resource

  validates_presence_of :name
end
