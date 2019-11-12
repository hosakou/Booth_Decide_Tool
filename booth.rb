class Booth
  class << self

    # ブースの決定状況を取得
    def getBoothStatus(booth)
      available_booth = []
      i = 0
      booth.each do |b|
        if b[3] == '0'
          available_booth << i
        end
        i += 1
      end
      return available_booth
    end

    # ブース一覧から分類とブース数
    def getBoothGroups(booth)
      grouplist = []
      booth.each do |b|
        grouplist << b[2]
      end

      return grouplist.group_by(&:itself).map{ |k, val| [k, val.count] }.to_h
    end

    # 決定した企画のブースの第3要素を1にセット
    def setDecideBooth(booth, num)
      num.each do |n|
        booth[n][3] = 1
      end
    end

  end # end self
end # end class 