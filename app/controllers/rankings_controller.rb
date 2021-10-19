class RankingsController < ApplicationController

    def index 
        @r = Ranking.all
    end

end
