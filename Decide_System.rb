class Decide_System
  require 'csv'
  require './flow.rb'

  if (ARGV[0].nil? || ARGV[1].nil?)
    puts "\nエラー：第1引数にサークルのcsvファイルを入力してください"
    puts "　　　　第2引数にブースのcsvファイルを入力してください"
    puts '例：ruby Decide_System.rb CIRCLE.csv BOOTH.csv'
    exit # 処理の中断
  end
  # 希望状況の取得
  circle = CSV.read(ARGV[0], encoding: "UTF-8")

  # ブース情報取得
  booth = CSV.read(ARGV[1], encoding: "UTF-8")

  #  ヘッダー削除
  circle.slice!(0)
  booth.slice!(0)

  # システムの実行
  File.open("result.csv", "w") do |f|
    f.puts("id,団体名,決定場所\n")
  end

  File.open("result.booth.csv", "w") do |f|
    f.puts("id,ブース名,Dummy,分類,決定団体\n")
  end
  
  File.open("undecidedCircle.csv", "w") do |f|
    f.puts("id,団体名,第1希望,第2希望,第3希望,第4希望,第5希望,決定状況\n")
  end
  
  i = 1
  while !(circle.nil? || circle.empty?) do
    # puts "#{i}回目"
    circle, booth = Flow.runSystem(circle, booth, i)
    # puts "circle.nil?:#{circle.nil?} OR circle.empty?:#{circle.empty?}"
    
    i += 1
  end
end # end class