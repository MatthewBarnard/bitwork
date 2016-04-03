class User < ActiveRecord::Base
  def self.login(email, password)
    current_user = self.find_by_email(email) rescue nil
    if current_user.blank?
      return false
    else
      if current_user.password == password
        return current_user.id
      else
        return false
      end
    end
  end
end
