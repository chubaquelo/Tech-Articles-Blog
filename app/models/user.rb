class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, foreign_key: 'author_id', dependent: :destroy
  has_many :votes, dependent: :destroy

  devise :omniauthable, omniauth_providers: [:facebook]

  validates_presence_of :username, :name, :email, :password, :password_confirmation

  def self.new_with_session(params, session)
    super.tap do |user|
      # Include default devise modules. Others available are:
      # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
      # rubocop:disable Lint/AssignmentInCondition, Layout/LineLength
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info'] && user.email.blank?
        user.email = data['email']
      end
      # rubocop:enable Lint/AssignmentInCondition, Layout/LineLength
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
    end
  end
end
