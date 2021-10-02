module StaticPagesHelper

    def index()
        url = "https://qiita.com/api/v2/items"  # URLを設定
        client = HTTPClient.new                 # インスタンスを生成
        response = client.get(url)              # Getリクエスト
        a = JSON.parse(response.body)  # 結果をjsonにパースして表示
        return a
      end

      def index2()
        url = "https://qiita.com/api/v2/items"
        header = { Authorization: "Bearer xxxxx" } # 例) ヘッダーに"Bearer xxxxx"を付与
        query = { page: 1, per_page: 20 }          # 例) 1ページ目、1ページごとのデータ取得数を20件にするquery       
        client = HTTPClient.new
        response = client.get(url, header: header, query: query) #headerとqueryを指定
        JSON.parse(response.body)
      end

      def index3()
        url = "https://api.syosetu.com/rank/rankget/?out=json&rtype=20210901-d&lim=20"
        #header = { Authorization: "Bearer xxxxx" } # 例) ヘッダーに"Bearer xxxxx"を付与
        #query = { out: json, rtype: 20211001-d , lim: 20 }          # 例) 1ページ目、1ページごとのデータ取得数を20件にするquery       
        client = HTTPClient.new
        response = client.get(url)
        JSON.parse(response.body)
      end

      def index4()
        url = "https://api.syosetu.com/rank/rankget"
        day5 = Time.now.prev_year(5).strftime(format= '%Y%m%d')
        query = { out: "json", rtype: day5 + "-d" ,gzip: 0 } # 例) 1ページ目、1ページごとのデータ取得数を20件にするquery       
        client = HTTPClient.new
        response = client.get(url, query)
        JSON.parse(response.body)
      end
      
      def make_ranking(data)
        data[0..5].each do |novel|
          ncode = novel["ncode"]          
          pt = novel["pt"]
          rank = novel["rank"]

          url = "https://api.syosetu.com/novelapi/api/"
          query = { out: "json", ncode: ncode ,gzip: 0, of: "t-w-s"} # 例) 1ページ目、1ページごとのデータ取得数を20件にするquery       
          client = HTTPClient.new
          response = client.get(url, query)
          JSON.parse(response.body)
        end
      end


      def get_novel_data(novel)
        ncode = novel["ncode"]          
        pt = novel["pt"]
        rank = novel["rank"]

        url = "https://api.syosetu.com/novelapi/api/"
        query = { out: "json", ncode: ncode ,gzip: 0, of: "t-w-s"} # 例) 1ページ目、1ページごとのデータ取得数を20件にするquery       
        client = HTTPClient.new
        response = client.get(url, query)
        JSON.parse(response.body)
      end 


end
