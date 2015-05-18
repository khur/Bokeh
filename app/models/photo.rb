class Photo < ActiveRecord::Base
  # require 'carrierwave/orm/activerecord'

  belongs_to :user
  belongs_to :contest

  mount_uploader :image, ImageUploader

  def upvote opponent_score
    self.vote_counter += 1
    self.win_total += 1
    self.opponent_score_sum += opponent_score
    self.score = (self.score + self.opponent_score_sum + 400 * (self.win_total - self.loss_total))/self.vote_counter
    self.save
  end

  def downvote opponent_score
    self.vote_counter += 1
    self.loss_total += 1
    self.opponent_score_sum += opponent_score
    self.score = (self.score + self.opponent_score_sum + 400 * (self.win_total - self.loss_total))/self.vote_counter
    self.save
  end
end
