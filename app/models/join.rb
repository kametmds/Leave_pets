class Join < ApplicationRecord
  after_destroy :destroy_empty_talk

  belongs_to :talk
  belongs_to :user
  validates :user_id, uniqueness: { scope: :talk_id }

  private

  def destroy_empty_talk
    talk.destroy if talk.reload.joins.empty?
  end
end
