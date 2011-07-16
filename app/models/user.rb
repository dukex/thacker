class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_live_stream

  private

  def create_live_stream
    UserLiveStream.create! :user_id => id
  end
end
