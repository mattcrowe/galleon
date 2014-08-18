class ClientsController < ApplicationController

    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

    def index
      @clients = Client.all
    end

    def new
        @client = Client.new
    end

    def show
      @client = Client.find(params[:id])
    end

    def create
        #render plain: params[:client].inspect
        @client = Client.new(client_params)
         
        if @client.save
            redirect_to @client
        else
            render 'new'
        end
    end
    
    def edit
      @client = Client.find(params[:id])
    end
    
    def update
      @client = Client.find(params[:id])
     
      if @client.update(client_params)
        redirect_to @client
      else
        render 'edit'
      end
    end
    
    private
      def client_params
        params.require(:client).permit(:name, :contact, :email, :rate)
      end
      
    def destroy
        @client = Client.find(params[:id])
        @client.destroy
        
        redirect_to clients_path
    end

end