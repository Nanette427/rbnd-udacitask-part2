module UdaciListErrors
  
  class  InvalidPriorityValue < StandardError
  end
  
  class  InvalidItemType      < StandardError
  end

  class  IndexExceedsListSize < StandardError
  end

end
