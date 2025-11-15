class Api::AvailabilitiesController < Api::BaseController
  before_action :set_availability, only: %i[ update destroy ]

  # GET /availabilities
  def index
    @availabilities = Availability.all

    render json: @availabilities
  end

  # POST /availabilities
  def create
    @availability = Availability.new(availability_params)

    if @availability.save
      render json: @availability, status: :created
    else
      render json: @availability.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /availabilities/1
  def update
    if @availability.update(availability_params)
      render json: @availability
    else
      render json: @availability.errors, status: :unprocessable_content
    end
  end

  # DELETE /availabilities/1
  def destroy
    @availability.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability
      @availability = Availability.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def availability_params
      params.expect(availability: [ :day_of_week, :start_time, :end_time, :user_id ])
    end
end
