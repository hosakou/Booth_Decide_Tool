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

  File.open("result.booth.csv", "w") do |f|
    f.puts("id,ブース名,Dummy,決定団体\n")
  end
  
  File.open("undecidedCircle.csv", "w") do |f|
    f.puts("id,団体名,第1希望,第2希望,第3希望,第4希望,第5希望,決定状況\n")
  end
  
  i = 1
  while !(circle_out.nil? || circle_out.empty?) do
    # puts "#{i}回目"
    circle_out, booth_out = Flow.runSystem(circle_out, booth_out, i)
    # puts "circle_out.nil?:#{circle_out.nil?} OR circle_out.empty?:#{circle_out.empty?}"
    
    i += 1
  end
end # end class