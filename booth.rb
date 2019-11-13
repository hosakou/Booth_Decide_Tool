class Booth
  class << self

    # ブースの決定状況を取得
    def getBoothStatus(booth)
      available_booth = []
      i = 0
      booth.each do |b|
        if b[4] == '0'
          available_booth << i
        end
        i += 1
      end
      return available_booth
    end

    # ブース一覧から分類と未決定ブース数:Hash{name=>count}
    def getBoothGroups(booth)
      grouplist = []
      decided_booth = []
      booth.each do |b|
        if b[4] == '0' then
          grouplist << b[3]
        else
          decided_booth << b[3]
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
        booth[n][4] = 1
      end
    end


    def saveBoothResult(raw_booth, booth)
      # booth = booth.group_by(&:itself).map{ |k, val| [k, val.count] }.to_h
      booth.each do |name, b|
        counter = 0
        # puts "#{name},#{b}"
        # p b.count
        raw_booth.each do |raw|
          # puts "#{counter} < #{b.count - 1}:#{counter < b.count - 1}"
          # puts "#{raw[3]} == #{name}:#{raw[3] == name}"
          # puts "#{raw[4]} == '0':#{raw[4] == '0'}"
          if (counter < b.count - 0 && raw[3] == name && raw[4] == '0') then
            raw[4] = b[counter][1]
            # p b[counter][1]
            File.open("result.booth.csv", "a") do |f|
              f.puts("#{raw[0]},#{raw[1]},#{raw[2]},#{raw[3]},#{raw[4]}\n")
            end
            counter += 1
          end
        end
      end
      # p booth
      return raw_booth
    end

  end # end self
end # end class 