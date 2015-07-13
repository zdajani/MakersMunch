class Tag
  include DataMapper::Resource

  property :id , Serial
  property :name , String

  has n, :restaurants , through: Resource
end
