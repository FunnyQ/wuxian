class StatusesController < ApplicationController

  def create
    @status = Status.new(status_params)
    @status.user_id = current_user.id
        respond_to do |format|
          if @status.save
            format.html { redirect_to root_path, notice: 'status was successfully created.' }
          else
            format.html { redirect_to root_path }
          end
        end
  end

  private

  def status_params
    params.require(:status).permit(:content)
  end

end
