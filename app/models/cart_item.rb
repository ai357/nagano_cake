class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  def subtotal
      self.item.with_tax_price * self.amount
  end




end