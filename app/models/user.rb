class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :user_information, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :chats, through: :tickets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_create :add_user_information

  private

  def add_user_information
    @user_info = UserInformation.new
    self.user_information = @user_info
  end
end
