class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published, :created_at, :updated_at

  belongs_to :user
  has_many :comments
end
