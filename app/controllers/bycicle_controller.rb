class BycicleController < ApplicationController
    skip_before_action :verify_authenticity_token
    def robada
        par = robada_params()
        @bycicles = Bycicle.rob(par[:serial])
        #@bycicles = Bycicle.where("serial =  ? and state = ? ",params[:serial], true)
        respond_to do |format|
            format.html {redirect_to "/bicicletas/bici_robada"}
            format.json {render json: @bycicles[0]}
            format.js
        end
    end
    
    def index
        @bycicle = Bycicle.mis_bicicletas(current_user.id)
    end
    
    def new
        @bycicle = Bycicle.new
    end
    
    def create
        if user_signed_in? 
            @bycicle = Bycicle.new(bycicle_params)
            @bycicle.user_id = current_user.id
            @bycicle.state=true
             if @bycicle.save!
                redirect_to bicicletas_mis_bicicletas_path  
             end
        end
    end
    
    def edit
        @bycicle = Bycicle.bicicleta(params[:id])
    end
    
    def del
        bycicle = Bycicle.bicicleta(params[:id])
        bycicle.update(del: true)
        redirect_to "/bicicletas/mis_bicicletas"
    end
    
    def update
        par = params.require(:bycicle)
        b = Bycicle.bicicleta(params[:bycicle][:id])
        b.update(serial: par[:serial], color: par[:color], description: par[:description], type_bycicle_id: par[:type_bycicle_id], brand_id: par[:brand_id], state: params[:bycicle][:state], user_id: current_user.id)
        redirect_to "/bicicletas/mis_bicicletas"
    end
    
    private
    
    def bycicle_params
        params.require(:bycicle).permit(:serial, :color, :description, :type_bycicle_id, :brand_id) 
    end
    
    def robada_params
        params.permit(:serial, :utf8, :commit, :format) 
    end
    
end
