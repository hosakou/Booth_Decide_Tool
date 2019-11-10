class Circle
  # 乱数宣言
  @rnd = Random.new

  class << self

    # 決定状況保存用の要素を追加
    def genSaveRow(circle)
      if circle[0].size == 6 then
         circle.each do |c|
           c << @rnd.rand
         end
       end
       return circle
    end


    # 決定した企画の第６要素を1にセット
    def setDecideCircle(circle, decide_num)
      decide_num.each do |num|
        circle[num][6] = 1
      end
      return circle
    end


    # 未決定企画の一覧を取得
    def getUnDecideNum(circle)
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


    # 乱数再生成
    def genRand(circle)
      circle.each do |c|
        c[7] = @rand.rand
      end
    end


    # 希望場所ごとに整理
    def getCircleReqBooth(circle, booth, num)
      len = booth.size - 1

      circle.each do |c|

      end
    end

  end
end