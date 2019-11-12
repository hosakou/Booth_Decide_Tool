class Circle
  # 乱数宣言
  @rnd = Random.new

  class << self

    # 決定状況保存用の要素を追加
    def genRand(circle)
      if circle[0].size == 7 then
         circle.each do |c|
           c << @rnd.rand
         end
        else
          circle.each do |c|
            c[7] = @rnd.rand
          end
      end
      return circle
    end


    # 決定した企画の第6要素を1にセット
    def setDecideCircle(circle, decide_num)
      decide_num.each do |num|
        circle[num][6] = 1
      end
      return circle
    end


    # 未決定企画の一覧を取得
    def getUnDecideCircle(circle)
      num = 0
      undecide = []
      circle.each do |c|
        if c[6] == 0
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
        circle_list[g] =  checkGroup(circle, g, num)
      end
      return circle_list
    end


    # getCircleByGroups用のメソッド
    def checkGroup(circle, group, num)
      list = []
      circle.each do |c|
        if c[6] == '0' then
          if c[num] == group then
            list << c 
          end
        else
          # 何もしない
        end
      end
      return list
    end

  end # end self
end # end class