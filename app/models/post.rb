class Post < ActiveRecord::Base
  has_many :votes
  validates :body, presence: true, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" } 

$our_epoch = Time.local(2005, 12, 8, 7, 46, 43).to_time


def epoch_seconds(t)
  (t.to_i - $our_epoch.to_i).to_f
end


# date is a ruby Time
  def hot
      s = self.votes.count.to_i
      displacement = Math.log( [s.abs, 1].max,  10 )

      sign = if s > 0
        1
      elsif s < 0
        -1
      else
        0
      end

      new_rank = (displacement * sign.to_f) + ( epoch_seconds(self.created_at.to_i) / 45000 )
      update_attribute(:rank, new_rank)
  end 
end
