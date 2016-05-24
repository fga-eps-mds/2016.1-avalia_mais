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

   def list
   end

   def show
   end

   def edit
   end

   def update
   end

   def delete
   end

end
