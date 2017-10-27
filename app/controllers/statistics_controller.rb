class StatisticsController < ApplicationController
    def index
        @sitios = Site.group(:name).count
        @brands = Bycicle.select('brands.description').joins(:brand).group('brands.description').count
        @tipoBici = Bycicle.select('type_bycicles.description').joins(:type_bycicle).group('type_bycicles.description').count
        @reportes = Report.group_by_month(:date).count 
        
        respond_to do |format|
           format.html
           format.pdf{render template: 'statistics/informe.pdf', javascript_delay: 3000, pdf: 'Informe'}
        end
    end
    
end
