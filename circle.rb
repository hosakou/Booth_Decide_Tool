class Circle
  require 'csv'

  # 乱数呼び出し
  @rand = Random.new(1)


  # 希望状況の取得
  # 0番目はヘッダーのため呼び出すときは１番から
  @circle_out = CSV.read('circle_req_out.csv')
  @circle_in = CSV.read('circle_req_in.csv')

  @circle_out.slice!(0)
  @circle_in.slice!(0)

  # 企画数取得
  @len_out = @circle_out.size
  @len_in = @circle_in.size

  # 決定状況保存用の要素を追加
  @circle_out.each do |circle|
    circle << 0
    circle << @rand.rand
  end

  @circle_in.each do |circle|
    circle << 0
    circle << @rand.rand
  end


  class << self

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
    def getCircleN(circle, booth, num)
      len = booth.size - 1

      circle.each do |c|

      end
    end

  end
end