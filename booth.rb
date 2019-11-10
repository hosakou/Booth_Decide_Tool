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

    # ブース一覧から分類の取得
    def getBoothGroups(booth)
      grouplist = []
      booth.each do |b|
        grouplist << b[2]
      end
      return grouplist.uniq!
    end

  end # end self
end # end class 