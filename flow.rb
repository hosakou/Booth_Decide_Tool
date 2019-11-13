class Flow
    require './circle.rb'
    require './booth.rb'
    require './election.rb'

    class << self
        # 全体をメソッドにまとめる
        # circle:csvから得たサークル一覧
        # booth:csvから得たブース一覧
        # n:第n希望
        def runSystem(circle, booth, n)

            # 乱数生成
            Circle.genRand(circle)

            # ブースステータス取得
            status = Booth.getBoothStatus(booth)

            # ブース分類取得：Hash {ブース名 => ブース数}
            groups = Booth.getBoothGroups(booth)

            # 企画の希望で分類
            circleByGroups = Circle.getCircleByGroup(circle, groups, n)

            # 上のやつを乱数で降順にソート
            rank = Election.getRank(circleByGroups)

            # ブース数まで団体数を削除し、決定を書き出す
            circleOfDecided = Election.getDecideCircle(rank, groups)
        end

        def runSystemDEBUG(circle, booth, n)

            if n > 5 then
                Circle.exportUnDecide(circle)
            end

            if circle.nil? || circle.empty? then
                # puts("決定しました")
                return circle, booth
            end

            # 乱数生成
            Circle.genRand(circle)
            # p circle

            # ブースステータス取得
            status = Booth.getBoothStatus(booth)
            # p status

            # ブース分類取得：Hash {ブース名 => ブース数}
            groups = Booth.getBoothGroups(booth)
            # p groups

            # 企画の希望で分類
            circleByGroups = Circle.getCircleByGroup(circle, groups, n)
            # p circleByGroups

            # 上のやつを乱数で降順にソート
            rank = Election.getRank(circleByGroups)
            # p rank

            # ブース数まで団体数を削除し、決定を書き出す
            circleOfDecided = Election.getDecideCircle(rank, groups)

            
            # p circleOfDecided
            
            circle = Circle.saveCircleResult(circle, circleOfDecided)
            booth = Booth.saveBoothResult(booth, circleOfDecided)
            # puts "CIRCLE:#{circle}\nBOOTH:#{booth}"
            return circle, booth
        end
    end # end self

end # end class