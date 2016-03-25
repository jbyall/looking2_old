class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:show, :edit, :update, :destroy]

  # GET /physicians
  # GET /physicians.json
  def index
    @physicians = Physician.all
  end

  def search
    @name = physician_search_params[:nameSearch]
    @location = physician_search_params[:locationSearch]
    @category = physician_search_params[:categorySearchDisplay]
    #build search query
    # query = String.new
    # if !@name.blank?
    #   query += "nameSearch = #{@name}, "
    # end
    # if !@location.blank?
    #   query += "locationSearch = #{@location}, "
    # end
    # if !@category.blank?
    #   query += "categorySearchDisplay = #{@category}"
    # else
    #   query = query.chop.chop
    # end
    query = {}
    query[:nameSearch] = @name unless @name.blank?
    query[:locationSearch] = @location unless @location.blank?
    query[:categorySearchDisplay] = @category unless @category.blank?
    @physicians = Physician.all(query)

    # if query != nil
    #   @physicians = Physician.for_js(query)
    # else
    #   @physicians = Physician.all
    # end
    # @physicians = Physician.where(nameSearch: @name)
    render "index"
  end

  # GET /physicians/1
  # GET /physicians/1.json
  def show
  end

  # GET /physicians/new
  def new
    @physician = Physician.new
  end

  # GET /physicians/1/edit
  def edit
  end

  # POST /physicians
  # POST /physicians.json
  def create
    attributes = physician_params.clone
    if attributes.has_key?(:nameSearch)
      attributes[:nameSearch] = physician_params[:nameSearch].split(',')
      attributes[:nameSearch].each do |ns|
        ns.strip!
      end
    end

    if attributes.has_key?(:locationSearch)
      attributes[:locationSearch] = physician_params[:locationSearch].split(',')
      attributes[:locationSearch].each do |ls|
        ls.strip!
      end
    end

    if attributes.has_key?(:categorySearchDisplay)
      attributes[:categorySearchDisplay] = physician_params[:categorySearchDisplay].split(',')
      attributes[:categorySearchDisplay].each do |csd|
        csd.strip!
      end
    end

    if attributes.has_key?(:treatmentsDisplay)
      attributes[:treatmentsDisplay] = physician_params[:treatmentsDisplay].split(',')
      attributes[:treatmentsDisplay].each do |td|
        td.strip!
      end
    end

    if attributes.has_key?(:physiciansDisplay)
      attributes[:physiciansDisplay] = physician_params[:physiciansDisplay].split(',')
      attributes[:physiciansDisplay].each do |pd|
        pd.strip!
      end
    end
    #debug()
    @physician = Physician.new(attributes)
    @physician.update_attribute(:status, "new")

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

  # PATCH/PUT /physicians/1
  # PATCH/PUT /physicians/1.json
  def update
    respond_to do |format|
      if @physician.update(physician_params)
        format.html { redirect_to @physician, notice: 'Physician was successfully updated.' }
        format.json { render :show, status: :ok, location: @physician }
      else
        format.html { render :edit }
        format.json { render json: @physician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physicians/1
  # DELETE /physicians/1.json
  def destroy
    @physician.destroy
    respond_to do |format|
      format.html { redirect_to physicians_url, notice: 'Physician was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physician
      @physician = Physician.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def physician_params
      
        params.require(:physician).permit(
          :type, 
          :nameSearch, 
          :locationSearch,
          :categoryDisplay,
          :categorySearchDisplay,
          :treatmentsDisplay,
          :physiciansDisplay,
          :summary,
          contact: params[:physician][:contact].try(:keys))
    end

    def physician_search_params
      params.permit(:nameSearch, :locationSearch, :categorySearchDisplay)
    end
end
