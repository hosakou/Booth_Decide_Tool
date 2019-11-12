class Decide_System
  require 'csv'
  require './circle.rb'
  require './booth.rb'
  require './election.rb'


  # 希望状況の取得
  circle_out = CSV.read('circle_req_out.csv', encoding: "UTF-8")
  circle_in = CSV.read('circle_req_in.csv', encoding: "UTF-8")

  # ブース情報取得
   booth_out = CSV.read('booth_out.csv', encoding: "UTF-8")
   booth_in = CSV.read('booth_in.csv', encoding: "UTF-8")

  #  ヘッダー削除
  circle_out.slice!(0)
  circle_in.slice!(0)
  booth_out.slice!(0)
  booth_in.slice!(0)

  # ステータスと乱数の生成
  Circle.genRand(circle_out)
  Circle.genRand(circle_in)

  # 企画数取得
  len_out = circle_out.size
  len_in = circle_in.size

  # ブースステータス取得
  status_out = Booth.getBoothStatus(booth_out)
  status_in = Booth.getBoothStatus(booth_in)

  # ブースグループ取得 形式：Hash {ブース名 => ブース数,}
  group_out = Booth.getBoothGroups(booth_out)
  group_in = Booth.getBoothGroups(booth_in)





  # デバッグ用
  p circle_out, booth_out, group_out, group_in

  circle_out = Circle.genRand(circle_out)
  circle_group_out = Circle.getCircleByGroup(circle_out, group_out, 1) # グループ分けされてかつ降順

  circle_rank_out = Election.getRank(circle_group_out)

  p Election.getDecideCircle(circle_rank_out, group_out)

end # end class