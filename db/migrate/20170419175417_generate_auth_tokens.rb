class GenerateAuthTokens < ActiveRecord::Migration[5.0]
  def up
    user_class = Class.new(ApplicationRecord) do
      self.table_name = 'users'
      validates :auth_token, presence: true, uniqueness: true
      before_validation :generate_auth_token

      private

      def generate_auth_token
        if self.auth_token.blank?
          loop do
            auth_token = Devise.friendly_token
            unless User.exists?(auth_token: auth_token)
              self.auth_token = auth_token
              break
            end
          end
        end
      end
    end

    user_class.find_in_batches do |groups|
      groups.each do |user|
        user.valid?
        user.save
      end
    end
  end

  def down
    User.find_in_batches do |users|
      users.each do |user|
        user.update_column(:auth_token, nil)
      end
    end
  end
end
