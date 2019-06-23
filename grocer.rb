require 'pry'

def consolidate_cart(cart)
  tally = {}
  cart.each do |line_item|
    line_item.each do |item, attribute|
      tally[item] = {} 
      tally[item][:count] = 0
      attribute.each do |detail, spec| tally[item][detail] = spec
      end
    end
  end
  cart.each do |line_item|
    line_item.each do |item, attribute|
      tally[item][:count] += 1
    end
  end  
    tally
end


###############################################



def apply_coupons(cart, coupons)
  sum_cart = cart
  discounted_items = []
  coupons.each do |coupon|
    discounted_items << coupon[:item]
  end
  discounted_items.each do |thing_on_sale|
    sum_cart[thing_on_sale] = {}
  end
  cart.each do |line_item|
    line_item.each do |item, attribute|
      coupons.each do | coupon |
        binding.pry
        if coupon[:item] == item
          sum_cart[item][:count] = sum_cart[item][:count] - coupon[:num]

          binding.pry
        end
      end
    end
  end
  binding.pry
  sum_cart
end





def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  consolidate_cart(cart)
end


cart =[
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"KALE"    => {:price => 3.00, :clearance => false}}
]


coupons = [{:item => "AVOCADO", :num => 2, :cost => 5.00}]
#checkout(cart, coupons)