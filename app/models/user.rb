class User < ActiveRecord::Base
  has_many :adverts

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

  def seeker_rating_image
    case self.rating
      when 0..4 || self.rating.blank?
        return '/assets/seeker_greenhorn.png'
      when 5..9
        return '/assets/seeker_onthegrind.png'
      when 10..14
        return '/assets/seeker_ladder.png'
      when 15..19
        return '/assets/seeker_hustler.png'
      when 20..24
        return '/assets/seeker_big_leagues.png'
      when 25
        return '/assets/seeker_legacy.png'
      else
        return '/assets/seeker_greenhorn.png'
    end
  end

  def seeker_update_rating
    self.rating = self.adverts.count
    self.save
  end
end
