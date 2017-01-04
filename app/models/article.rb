class Article < ApplicationRecord
    validates :title, :presence => true
    has_many :comments
    belongs_to :user
    mount_uploader :image, ImageUploader
end
