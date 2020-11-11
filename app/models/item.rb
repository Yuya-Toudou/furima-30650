class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_pay
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :posting_date

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :postage_pay_id
    validates :prefectures_id
    validates :posting_date_id
  end

  validate :image_presence

  def image_presence
    errors.add(:image, 'must be attached') unless image.attached?
  end
end
