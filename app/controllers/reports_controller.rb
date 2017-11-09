Time.zone = "Bogota"
class ReportsController < ApplicationController
    before_action :authenticate_user!

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
            @report = Report.includes(:site, :mode, :type_report, :bycicle).joins(:site, :mode, :type_report, :bycicle).where(query).paginate(:page => params[:page], :per_page => 6)
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
    
    def heatmap
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
            @report = Report.order(id: :desc).joins(:site)
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
        @report.build_site
        @report.photos.build
        #@report.image_attachments =[]
        #@site = Site.new
    end
    
    def create
        @report = Report.new(report_params)
        @site = Site.new
        #@image= ImageAttachment.create( data: File.new("public/images/thumb/missing.png"))
        #@image.save
        par = report_params
        #@image = ImageAttachment.new(report_params[:image_attachment])
        
        
        @report.date = Date.new par["date(1i)"].to_i, par["date(2i)"].to_i, par["date(3i)"].to_i
        @report.hour = par["hour(4i)"] + ":" + par["hour(5i)"] + ":00"
        @report.state = true
        @report.user_id = current_user.id
        #@report.images=par[:image_attachment][:images]
        p "ASDFASFASDF" 
        p par
        if @report.save
            if params[:images]
                    #===== The magic is here ;)
                params[:images].each { |image|
                    @report.photos.create(image: image)
                  #@report.image_attachments.create
                   #@imageable.image_attachments.create(:data=>image)
                }
            else
                p "----------------------------------------------------------------------------"
            end  
            
        
           # @image.save
            
            # site.name = par[:site][:name]
            # @site.lat = par[:site][:lat]
            # @site.lng = par[:site][:long]
            # @site.report_id = @report.id
            # @site.save
            redirect_to "/reports"
        else
            flash[:alert] = @report.errors.full_messages.to_sentence
            redirect_to "/reports/new"
        end
    end
    

    def show
        @report = Report.find(params[:id])
        @comments= Comment.where(report_id: @report).order('created_at DESC')
        @images= Photo.where(attachable_type: 'Report').where(attachable_id: @report)
        
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
        params.require(:report).permit(:description,:mode_id,:bycicle_id,:type_report_id, :date,:hour,:photos,:images,:images=>[],
        site_attributes: [:id,:name,:lat,:lng]
        )
    end
    
    
end
