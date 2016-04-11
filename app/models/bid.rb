class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :advert

  def set_lead
    amount = Bid.where(advert_id: self.advert_id).order('amount ASC').first.amount rescue true
    if amount == true
      true
    else
      if self.amount < amount
        active_bids = Bid.where(advert_id: self.advert_id)
        active_bids.each do |cbid|
          cbid.is_lead = false
          cbid.save
        end
        true
      else
        false
      end
    end
  end
end
