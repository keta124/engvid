class ProOne
  def pro_one
    @pro_one =1
  end
end
class ProTwo < ProOne 
  def pro_one
    @pro_one =2
  end
end
puts ProOne.new.pro_one