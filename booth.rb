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

    # ブース一覧から分類と未決定ブース数
    def getBoothGroups(booth)
      grouplist = []
      decided_booth = []
      booth.each do |b|
        if b[3] == '0' then
          grouplist << b[2]
        else
          decided_booth << b[2]
        end
      end

        grouplist = grouplist.group_by(&:itself).map{ |k, val| [k, val.count] }.to_h
        decided_booth = decided_booth.group_by(&:itself).map{ |k, val| [k, val.count] }.to_h

      decided_booth.keys.each do |b|
        if !grouplist.keys.include?(b) then
          grouplist.store(b, 0)
        end
      end

      return grouplist
    end

    # 決定した企画のブースの第3要素を1にセット
    def setDecideBooth(booth, num)
      num.each do |n|
        booth[n][3] = 1
      end
    end

    # # ブース分類取得の決定未決定区別しないバージョン
    # def getAllBoothGroups(booth)
    #   grouplist = []
    #   booth.each do |b|
    #     grouplist << b[2]
    #   end
    #   return grouplist.group_by(&:itself).map{ |k, val| [k, val.count] }.to_h
    # end

  end # end self
end # end class 