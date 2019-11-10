class Decide_System
  require 'csv'
  require './circle.rb'
  require './booth.rb'


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
  Circle.genSaveRow(circle_out)
  Circle.genSaveRow(circle_in)

  # 企画数取得
  len_out = circle_out.size
  len_in = circle_in.size

  # ブースステータス取得
  status_out = Booth.getBoothStatus(booth_out)
  status_in = Booth.getBoothStatus(booth_in)

  

  # デバッグ用
  p circle_out
  p circle_in
  p booth_out
  p booth_in

end