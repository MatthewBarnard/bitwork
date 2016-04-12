class Advert < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  def self.total_due(user)
    return (Advert.where("user_id = #{user} AND (is_paid IS NULL OR is_paid = false) AND  is_claimed = true").sum(:user_claimed_amount)).to_d
  end
  def self.total_saved(user)
    prepared_to_pay = (Advert.where("user_id = #{user} AND  is_claimed = true").sum(:payment)).to_d
    return prepared_to_pay - self.total_due(user)
  end

  def self.get_active
    return Advert.where('date_expiry >= current_date AND (is_active = true OR is_active IS NULL) AND (is_claimed = false OR is_claimed IS NULL)')
  end
end
