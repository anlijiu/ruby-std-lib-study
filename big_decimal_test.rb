sum = 0
10_000.times do
    sum = sum + 0.0001
end
p sum #=> 0.9999999999999062





require 'bigdecimal'

sum = BigDecimal.new("0")
10_000.times do
    sum = sum + BigDecimal.new("0.0001")
end
p sum  #<BigDecimal:2179c90,'0.1E1',9(18)>
p sum.to_s #=> "0.1E1"
p sum.to_f #=> 1.0


#取整， 小的那个
p BigDecimal('3.14159').floor #=> 3
p BigDecimal('-9.1').floor #=> -10

#round 取整
p BigDecimal('3.14159').round #=> 3
p BigDecimal('8.7').round #=> 9

#ceil 精确到小数点后几位
p BigDecimal('3.14159').ceil(3) #=> 3.142
p BigDecimal('13345.234').ceil(-2) #=> 13400.0
