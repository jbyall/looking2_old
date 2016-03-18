class PhysiciansController < ApplicationController
	def index
		@physicians = Physician.all
	end

  def new
    @physician = Physician.new(physician_params)

    respond_to do |format|
      respond_to do |format|
      if @physician.save
        format.html { redirect_to @physician, notice: 'Physician was successfully created.' }
        format.json { render :show, status: :created, location: @physician }
      else
        format.html { render :new }
        format.json { render json: @physician.errors, status: :unprocessable_entity }
      end
    end
    end

  end
	# DELETE /restaurants/1
 	# DELETE /restaurants/1.json
	def destroy
  	@physician.delete
  	respond_to do |format|
    		format.html { redirect_to physicians_url, notice: 'Practice was successfully destroyed.' }
    		format.json { head :no_content }
  	end
	end
end
