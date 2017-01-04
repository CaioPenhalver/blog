class Comment < ApplicationRecord
  has_many :children_comments, class_name: 'Comment', foreign_key: 'comment_id'
  belongs_to :parente_comment, class_name: 'Comment', optional: true
  belongs_to :article, optional: false
  belongs_to :user, optional: false
  validates :body, presence: true
end
