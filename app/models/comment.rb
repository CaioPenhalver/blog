class Comment < ApplicationRecord
  has_many :children_comments, class_name: 'Comment', foreign_key: 'comment_id'
  belongs_to :parente_comment, class_name: 'Comment'  
  belongs_to :article
  belongs_to :user
end
