
class Micropost < ApplicationRecord
  belongs_to :user
  scope :order_desc, -> {order created_at: :DESC}
  scope :feeds, -> id{where "use_id IN (SELECT followed_id FROM relationships
    WHERE followed_id = #{id}) OR user_id =#{id}"}

  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Setting.validates.content.length}
  validates :picture_size

  private
  def picture_size
    if picture_size > 5.megabytes
      errors.add :picture, t("micropost.picture")
    end
  end
end
