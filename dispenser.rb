def dispenser(amount, denominations)
  data = denominations.inject({}) do |hash, denomination| # for each denomination inject into hash
    hash[denomination] = amount.divmod(denomination) # denominations are keys, and the results of divmod are values (arrays)
    amount -= amount.divmod(denomination).first * denomination # amount - (number of denom * the denom)
    hash end
  #puts "Hash before map => #{data}" # shows hash values before using map method
  data.map do |key, value|
    data[key] = value.first end # for each key in data hash, keep only the first index of value array
  data end

puts "Resulting hash values(cash): #{dispenser(489, [100,50,20,10,5,1])}" # example shows dispensing $489.68
puts "Resulting hash values(coin): #{dispenser(68, [25,10,5,1])}"
