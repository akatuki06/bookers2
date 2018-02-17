class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookers

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  # validates :name, presence: true, length: { maximum: 20 }

  validates :introduction, length: { maximum: 50 }

   attachment :image

end
