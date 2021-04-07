ActiveAdmin.register User do

  permit_params :username, :email, :followers, :followings

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :photo]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :username

  index do 
    column :username
    column :email
    column :tweets do |user|
      user.tweets.count
    end
    column :followers do |user|
      user.followers.count
    end

    column :followings do |user|
      user.followings.count
    end

    column :likes do |user|
      user.tweets.sum(&:likes_count)
    end

    column :retweet do |user|
      user.tweets.sum(&:rt_count)
    end
    actions 
  end

  
end
