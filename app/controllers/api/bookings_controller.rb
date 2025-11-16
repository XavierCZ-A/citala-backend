class Api::BookingsController < Api::BaseController
  before_action :set_booking, only: %i[ show update destroy ]

  # GET /bookings
  def index
    @bookings = Booking.all

    render json: @bookings
  end

  # GET /bookings/1
  def show
    render json: @booking
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_content
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.expect(booking: [ :invite_name, :invite_email, :invite_phone, :start_time, :end_time, :booking_source, :status ])
    end
end
