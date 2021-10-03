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

      #index4から戻す時間を柔軟に
      def day_rank_nyago(y=5)
        url = "https://api.syosetu.com/rank/rankget"
        day5 = Time.now.prev_year(y).strftime(format= '%Y%m%d')
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
        query = { out: "json", ncode: ncode ,gzip: 0, of: "t-w-s-nt-gl-ga-e-l-g-k"} # 例) 1ページ目、1ページごとのデータ取得数を20件にするquery       
        client = HTTPClient.new
        response = client.get(url, query)
        JSON.parse(response.body)
      end
      
      def make_novel_url(ncode)
        url = "https://ncode.syosetu.com/" + ncode
        return url
      end

      def make_novel_info(ncode)
        url = "https://ncode.syosetu.com/novelview/infotop/ncode/" + ncode + "/"
        return url
      end

      def judge_sl(sl,e)
        sl = sl.to_i
        e = e.to_i
        if sl == 2
          return "短編"
        elsif sl == 1
          if e == 0
            return "完結済み"
          elsif e == 1
            return "連載中" 
          end
        end
      end



      def judge_genre(int)
        int = int.to_i
        if int == 101
          return "異世界〔恋愛〕"
        elsif int == 102
          return "現実世界〔恋愛〕"
        elsif int == 201
          return "ハイファンタジー〔ファンタジー〕"
        elsif int == 202
          return "ローファンタジー〔ファンタジー〕"
        elsif int == 301
          "純文学〔文芸〕"
        elsif int ==           302
          "ヒューマンドラマ〔文芸〕"
        elsif int ==           303
          "歴史〔文芸〕"
        elsif int ==           304
          "推理〔文芸〕"
        elsif int ==           305
          "ホラー〔文芸〕"
        elsif int ==           306
          "アクション〔文芸〕"
        elsif int ==           307
          "コメディー〔文芸〕"
        elsif int ==           401
          "VRゲーム〔SF〕"
        elsif int ==           402
          "宇宙〔SF〕"
        elsif int ==           403
          "空想科学〔SF〕"
        elsif int ==           404
          "パニック〔SF〕"
        elsif int ==           9901
          "童話〔その他〕"
        elsif int ==           9902
          "詩〔その他〕"
        elsif int ==           9903
          "エッセイ〔その他〕"
        elsif int ==           9904
          "リプレイ〔その他〕"
        elsif int == 9999
          "その他〔その他〕"
        elsif int == 9801
          "ノンジャンル〔ノンジャンル〕"
        end
      end
        


end
