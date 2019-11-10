class Booth
  class << self

#    ブースの決定状況を取得
    def getBoothStatus(booth)
      available_booth = []
      i = 0
      booth.each do |b|
        if b[2] == '0'
          available_booth << i
        end
        i += 1
      end
      return available_booth
    end

  end
end