  class FrontendController < ApplicationController

    def index
      if current_user
        @status = current_user.statuses.new
        @status.user_id = current_user.id
      end
    end

    def diaries_index
    end

    def diary_show
    end

    def albums_index
    end

    def album_show
    end

    def global_index
    end

  end
