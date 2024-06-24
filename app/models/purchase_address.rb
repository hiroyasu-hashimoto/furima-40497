class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_origin_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
  end
  validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchaseRecord = PurchaseRecord.create(user_id:, item_id:)
    ShippingAddress.create(postal_code:, shipping_origin_id:, city:,
                           street_address:, building_name:, phone_number:, purchase_record_id: purchaseRecord.id)
  end
end
