Time.zone = "Bogota"
class ReportsController < ApplicationController
    
    def mis_reportes
        @MiRep = Report.mi_reporte(current_user.id)
    end
    
    def index
        query = ""
        if params[:search].present?
            query += "(sites.name like '%" + params[:search] + "%' or reports.description like '%" + params[:search] + "%')"
        end
        
        if params[:type_report].present?
            if query != ""
                query += " and "
            end
            query += "(reports.type_report_id =" + params[:type_report] + ")"
        end
        
        if params[:mode].present?
            if query != ""
                query += " and "
            end
            query += "(reports.mode_id =" + params[:mode] + ")"
        end
        
        if params[:type_bycicles].present?
            if query != ""
                query += " and "
            end
            query += "(bycicles.type_bycicle_id =" + params[:type_bycicles] + ")"
        end
        
        if params[:brands].present?
            if query != ""
                query += " and "
            end
            query += "(bycicles.brand_id =" + params[:brands] + ")"
        end
        
        if params[:date1].present? and params[:date2].present?
            if query != ""
                query += " and "
            end
            query += "(date >= '" + params[:date1] + "' and date <= '" + params[:date2] + "')"
        end
        puts "_____________________________________________"
        puts query
        
        if !params[:search].present? and !params[:type_report].present? and !params[:mode].present? and !params[:type_bycicles].present? and !params[:brands].present? and !params[:date1].present? and !params[:date2].present?
            @report = Report.order(id: :desc).joins(:site).paginate(:page => params[:page], :per_page => 6)
        else
            @report = Report.includes(:site, :mode, :type_report, :bycicle).joins(:site, :mode, :type_report, :bycicle,).where(query).paginate(:page => params[:page], :per_page => 6)
        end
        
        puts "<<<<<<<<<<<<<>>>>>>>>>>>>>"
        @var = @report.any?
        puts "<<<<<<<<<<<<<>>>>>>>>>>>>>"
        puts @var
        @hash = Gmaps4rails.build_markers(@report) do |user, marker|
          marker.lat user.site.lat
          marker.lng user.site.lng
          marker.infowindow user.site.name
          marker.json({title: user.site.name})
        end
    end
    
    def new
        @report = Report.new
    end
    
    def create
        report = Report.new
        site = Site.new
        par = params.require(:report)
        report.date = Date.new par["date(1i)"].to_i, par["date(2i)"].to_i, par["date(3i)"].to_i
        report.hour = par["hour(4i)"] + ":" + par["hour(5i)"] + ":00"
        report.description = par[:description]
        report.state = true
        report.type_report_id = par[:type_report_id]
        report.user_id = current_user.id
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
    
    def show
        @report = Report.find(params[:id])
        @hash = Gmaps4rails.build_markers(@report) do |user, marker|
          marker.lat user.site.lat
          marker.lng user.site.lng
          marker.infowindow user.site.name
          marker.json({title: user.site.name})
        end
    end
    
    def busqueda
        puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
        type_report = params[:type_report]
        mode = params[:mode]
        type_bycicles = params[:type_bycicles]
        brands = params[:brands]
        date1 = params[:date1].values
        date2 = params[:date2].values
        hour1 = params[:hour1]
        hour2 = params[:hour2]
        if date1[1].length == 1
            date1[1] = "0" + date1[1]
        end
        if date2[1].length == 1
            date2[1] = "0" + date2[1]
        end
        date1 = date1[0] + "-" + date1[1] + "-" + date1[2]
        date2 = date2[0] + "-" + date2[1] + "-" + date2[2]
        
        redirect_to controller: 'reports', action: 'index', search: params[:search], type_report: type_report[:type_report_id], mode: mode[:mode_id], type_bycicles: type_bycicles[:type_bycicle_id], brands: brands[:brand_id], date1: date1, date2: date2
    end
    
    private 
    
    def report_params
        params.require(:report).permit(:description)
    end
end
