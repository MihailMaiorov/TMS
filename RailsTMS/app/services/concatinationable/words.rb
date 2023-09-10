module Concatinationable
  class Words
    def self.call(arg1, arg2)
      "#{arg1} #{arg2}".capitalize.strip
    end
  end
end
