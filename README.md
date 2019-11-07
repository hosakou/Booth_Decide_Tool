# Booth Decide Tool
- 学園祭のブース決定の抽選ツール
- とりあえず自分の中でどんな感じにするといいか考えたかったので作成
- Decide_Sys.rbがメインなのでそれを実行する

# 目標
- 希望とブースの一覧があれば一度実行するだけで決定
- 遅れた団体のみの抽選もできるように
  - ブースのデータにも埋まってるかどうかを保存する

# 準備
- 希望一覧は屋内外に分けてCSVで保存しておく
  - 屋内：`circle_req_out.csv`
  - 屋外：`circle_req_in.csv`
  - 形式：`団体名,第一希望,第二希望,第三希望,第四希望,第五希望`
    - 5列のデータ
- ブースの一覧も屋内外分けてCSVで保存しておく
  - 屋内：`booth_out.csv`
  - 屋外：`booth_in.csv`
  - 形式：`ブース名`
    - 1列のみのデータ
