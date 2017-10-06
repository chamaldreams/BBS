class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  validates :first_name,presence: true   
  validates :last_name,presence: true 
  validates :company_name,presence: true    
  validates :telephone,presence: true 
  validates :billing_address,presence: true
  validates :shipping,presence: true                

 after_create :send_admin_mail
 
 def send_admin_mail

  UserMailer.send_welcome_email(self).deliver_later
 end 


def super_admin
 user.has_role?(:super_admin)
end

def user
 user.has_role?(:user)
end

  
end
