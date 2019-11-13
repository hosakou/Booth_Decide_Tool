class Decide_System
  require 'csv'
  require './flow.rb'

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

  # システムの実行
  File.open("result.csv", "w") do |f|
    f.puts("id,団体名,決定場所\n")
  end
  circle_out,booth_out = Flow.runSystemDEBUG(circle_out, booth_out, 1)
  circle_out,booth_out = Flow.runSystemDEBUG(circle_out, booth_out, 2)
  p circle_out
  circle_out,booth_out = Flow.runSystemDEBUG(circle_out, booth_out, 3)
  circle_out,booth_out = Flow.runSystemDEBUG(circle_out, booth_out, 4)
  circle_out,booth_out = Flow.runSystemDEBUG(circle_out, booth_out, 5)
end # end class