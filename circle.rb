class Circle
  # 乱数宣言
  @rnd = Random.new

  class << self

    # 決定状況保存用の要素を追加
    def genRand(circle)
      if circle[0].size < 9 then
         circle.each do |c|
           c << @rnd.rand
         end
        else
          circle.each do |c|
            c[8] = @rnd.rand
          end
      end
      return circle
    end


    # 決定した企画の第7要素を1にセット
    def setDecideCircle(circle, decide_num)
      decide_num.each do |num|
        circle[num][7] = 1
      end
      return circle
    end


    # 未決定企画の一覧を取得
    def getUnDecideCircle(circle)
      num = 0
      undecide = []
      circle.each do |c|
        if c[7] == 0
          undecide << num
        end
        num += 1
      end
      return undecide
    end


    # 初期状況呼び出し
    def getCircleData(arg)
      case arg
        when 'in' then
          return @circle_in
        when 'out' then
          return @circle_out
        else
          return false
      end
    end


    # 第n希望の団体を分類分けして取得
    def getCircleByGroup(circle, groups, num)
      circle_list = {}
      groups.keys.each do |g|
        circle_list[g] =  checkGroup(circle, g, num + 1)
      end
      return circle_list
    end


    # getCircleByGroups用のメソッド
    def checkGroup(circle, group, num)
      list = []
      circle.each do |c|
        if c[7] == '0' then
          if c[num] == group then
            list << c 
          end
        else
          # 何もしない
        end
      end
      return list
    end

    def saveCircleResult(raw_circle, circle)
      decide = []
      circle.each do |b, c|
        c.each do |cc|
          data = raw_circle.select {|raw| raw[0] == cc[0]}.flatten(1)
          raw_circle.delete_if{|raw| raw[0] ==  cc[0]}
          data[7] = b
          decide << data
        end
      end
      datas = decide.sort_by(&:first)
      datas.each do |d|
        File.open("result.csv", "a") do |f|
          f.puts("#{d[0]},#{d[1]},#{d[7]}\n")
        end
      end

      return raw_circle
      
      # decide.each do |num|
      #   raw_circle[num][7] = 
      # end
    end


    def exportUnDecide(circle)
      circle.each do |c|
        File.open("undecidedCircle.csv", "a") do |f|
          f.puts("#{c[0]},#{c[1]},#{c[2]},#{c[3]},#{c[4]},#{c[5]},#{c[6]},#{c[7]}\n")
        end
        circle.reject!{|arr| arr = c}
      end
    end

  end # end self
end # end class