class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: [false, nil]) }

  after_initialize :set_default_published

  # Ensure comments can only be added to published blogs
  validate :comments_only_for_published_blog, on: :update

  private

  def set_default_published
    self.published ||= false if new_record?
  end

  def comments_only_for_published_blog
    if !published? && comments.any?
      errors.add(:base, "Comments can only be added to published blogs")
    end
  end
end
