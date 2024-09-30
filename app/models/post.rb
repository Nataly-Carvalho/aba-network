class Post < ApplicationRecord
    has_many :comments, as: :commentable
    has_many :post_users, dependent: :destroy
    has_many :users, through: :post_users
    has_many :attachments, dependent: :destroy

    validates :content, presence: true
    validates :published, inclusion: { in: [true, false] }
end
