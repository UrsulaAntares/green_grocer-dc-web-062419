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
  sum_cart = {}
  discounted_items = []
  coupons.each do |coupon|
    discounted_items << coupon[:item]
  end

  cart.each do |item, attribute|
    if discounted_items.include?(item) == true
    
      coupons.each do |coupon|
        sum_cart[item] = {}
        
          if coupon[:item] == item
            coupons.each do |coupon|
              sum_cart["#{coupon[:item]} W/COUPON"] = {}   
            end
            coupons.each do |coupon|
              sum_cart["#{coupon[:item]} W/COUPON"][:count] = coupon[:num]
              sum_cart["#{coupon[:item]} W/COUPON"][:price] = (coupon[:cost] / coupon[:num])
            end
            sum_cart[item][:count] = cart[item][:count] - coupon[:num]
            sum_cart[item][:price] = cart[item][:price]
            sum_cart[item][:clearance] = cart[item][:clearance]
            coupons.each do |coupon|
              sum_cart["#{coupon[:item]} W/COUPON"][:clearance] = cart[item][:clearance]
            end
        
          end  #this is the end of the if courpon item line 40
        
         
        end  this is the end of sum_cart line 37
       

      end #this is the end of coupons.each do coupon line 36

    end
  
  end #this seems to be end of if discounted_items
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