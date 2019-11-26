class Join < ApplicationRecord
  after_destroy :destroy_empty_talk

  belongs_to :room
  belongs_to :user

  validates :user_id, uniqueness: { scope: :room_id }

  private
  # def destroy_empty_room
  #   room.destroy if room.reload.joins.empty?
  # end
end
