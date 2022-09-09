class ReportsController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    def destroy
        @report = Report.find(params[:id])
        authorize! :destroy, @report, :message => "BEWARE: you are not
        authorized to access this page"
        @report.destroy

        respond_to do |format|
            format.html { redirect_to admin_url, success: "Report was successfully removed." }
            format.json { head :no_content }
        end
    end

end
