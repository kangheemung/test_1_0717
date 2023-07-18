class User < ApplicationRecord
    has_secure_password
      has_many :microposts
    validates :name, presence: true    # （コードを書き込む）の中身を書き換えてください
   validates :email, presence: true
end
