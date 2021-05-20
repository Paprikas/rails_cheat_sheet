# == Schema Information
#
# Table name: tweets
#
#  id          :bigint           not null, primary key
#  body        :text
#  likes_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Tweet < ApplicationRecord
  after_create_commit { broadcast_prepend_to "tweets" }
  after_update_commit { broadcast_replace_to "tweets" }
  after_destroy_commit { broadcast_remove_to "tweets" }

  validates :body, presence: true, length: {maximum: 100}
end
