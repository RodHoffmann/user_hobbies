class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :dashboard, dependent: :destroy
  has_many :user_hobbies, dependent: :destroy
  has_many :hobbies, through: :user_hobbies

  after_create :create_dashboard!

  validates :name, presence: true
  validates :wohnort, presence: true

  private

  def create_dashboard!
    Dashboard.create(user: self)
    self.dashboard = Dashboard.last
  end
end
