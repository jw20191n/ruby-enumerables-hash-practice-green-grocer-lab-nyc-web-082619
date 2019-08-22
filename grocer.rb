def consolidate_cart(cart)
  new_cart = { }
  
  cart.each do |items| 
    items.each do |item, info|
      new_cart[item] = info 
      # info is inner hash of the item:{:price => 3.00, :clearance => true }
      if new_cart[item][:count]
        new_cart[item][:count] += 1
      else
        new_cart[item][:count] = 1
      end
    end
  end
  
  return new_cart
end


def apply_coupons(cart, coupons)
  
  coupons.each do |coupon|
    coupon.each do |item, info|
      food_name = coupon[:item]
      
      if cart[food_name] && cart[food_name][:count] >= coupon[:num]
        
        if cart["#{food_name} W/COUPON"]
          cart["#{food_name} W/COUPON"][:count] += coupon[:num]
        else
          cart["#{food_name} W/COUPON"] = {
            :price => coupon[:cost]/coupon[:num], 
            :clearance => cart[food_name][:clearance], 
            :count => coupon[:num]}
        end
        
        cart[food_name][:count] -= coupon[:num]
      end
      
    end
  end
  
  cart
end


def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
