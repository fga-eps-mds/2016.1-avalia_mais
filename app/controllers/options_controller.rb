class OptionController < ApplicationController

   def new
        @option = Option.new
   end

   def create
        @option = Option.new(option_params)

        if @option.save
            flash[:notice] = 'Opção criada com sucesso!'
            redirect_to home_path
        else
            render :new
        end
   end


end
