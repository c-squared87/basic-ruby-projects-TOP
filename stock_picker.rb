# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#
#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12
# Quick Tips:
#
# You need to buy before you can sell
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

def stock_picker(arrayOfStocks)
  # so what we need to do here is evaluate each pairing
  #
  buyIndx = 0;
  sellIndx = 0;
  profit = 0;

  



end

def get_profit(_in, _out)
   _out - _in
end


# TESTING
puts get_profit(5, 10)

ara = [1,2,3,4,5]



stock_picker(ara)
stock_picker([17,3,6,9,15,8,6,1,10])
