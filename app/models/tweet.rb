class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  belongs_to :tweet, class_name: 'Tweet', optional: true
  has_many :tweets, foreign_key: :tweet_id, class_name: 'Tweet', dependent: :destroy
  validates :content, presence: true

  def liked?(user)
    !!self.likes.find{|like| like.user_id == user.id}
  end

  def likes_count
    self.likes.count
  end

  def rt_count
    self.tweets.count
  end

  def self.search(search)
    if search
      where('content LIKE ?', "%#{search}%" || "%#{search}" || "#{search}%" )
    else
      all
    end
  end

  def self.hashtag_search(search)
    if search
      where('content LIKE ?', "%##{search}%" )
    else
      all
    end
  end

  
 scope :tweets_for_me, ->(followings) { where user_id: followings }
end
