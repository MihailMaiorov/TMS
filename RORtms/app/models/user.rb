# 1. email уникальный
# 2. password должен содержать (8 символов, минимум 1 букву маленькую и одну большую + 1 символ (!№;%))
# 3. first_name обязан быть заполнен
# 4. last_name обязан быть заполнен
# 5. email и password должны приходить с подтверждениями
# 6. написать скоупы чтобы фильтровать всех пользователей, которые зарегистрировались между 2 датами
# 7. фильтровать всех пользователей, которые confirmed: true

class User < ApplicationRecord
  validates :first_name, :last_name, presence: true

  validates :email, confirmation: true, uniqueness: true
  validates :email_confirmation, presence: true

  validates :password, confirmation: true,
                       length: { is: 8 },
                       format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[!#%;№])[a-zA-Z!№;%]{8}\z/,
                                 message: 'Incorrect password' }
  validates :password_confirmation, presence: true
  # validates_confirmation_of :password
  # scope :confirmed, where(confirmed: true)

  scope :created_between, ->(from, to) { where('created_at >= ? AND created_at <= ?', from, to) }
end
