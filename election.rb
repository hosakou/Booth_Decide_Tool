class Election
    
    @rnd = Random.new

    class << self

        # 乱数から第n希望の大きい順に並び替えて出力
        def getRank(circle_groups)
            list = {}
            circle_groups.each do |group, circle|
                list.store(group, circle.sort_by(&:last).reverse)
            end
            return list
        end

        def getDecideCircle(circle_groups, booth_groups)
            booth_groups.each do |group, count|
                while(circle_groups[group].count > count) do
                    circle_groups[group].slice!(0)
                end
            end
            return circle_groups
        end

    end # end self
end # end class