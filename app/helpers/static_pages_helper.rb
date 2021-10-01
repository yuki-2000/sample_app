module StaticPagesHelper

    def index()
        url = "https://qiita.com/api/v2/items"  # URLを設定
        client = HTTPClient.new                 # インスタンスを生成
        response = client.get(url)              # Getリクエスト
        a = JSON.parse(response.body)  # 結果をjsonにパースして表示
        return a
      end


end
