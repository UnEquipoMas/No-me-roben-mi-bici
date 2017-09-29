class ReportsController < ApplicationController
    def index
        @report = Report.order(id: :desc).joins(:site).paginate(:page => params[:page], :per_page => 9)
        
        @hash = Gmaps4rails.build_markers(@report) do |user, marker|
          marker.lat user.site.lat
          marker.lng user.site.lng
          marker.infowindow user.site.name
          marker.json({title: user.site.name})
        end
    end
    
    def new
        @report = Report.new
        @site = Site.new
    end
    
    def create
        report = Report.new
        site = Site.new
        par = params.require(:report)
        puts par
        report.date = Date.new par["date(1i)"].to_i, par["date(2i)"].to_i, par["date(3i)"].to_i
        report.hour = par["hour(4i)"] + ":" + par["hour(5i)"] + ":00"
        report.description = par[:description]
        report.state = true
        report.type_report_id = par[:type_report_id]
        report.user_id = 1
        report.mode_id = par[:mode_id]
        report.bycicle_id = par[:bycicle_id]
        report.save 
        site.name = par[:site][:name]
        site.lat = par[:site][:lat]
        site.lng = par[:site][:long]
        site.report_id = report.id
        site.save
        redirect_to "/reports"
    end
    
    def edit
    
    end
    
    private 
    
    def report_params
        params.require(:report).permit(:description)
    end
end
