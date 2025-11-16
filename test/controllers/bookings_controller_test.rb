require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
  end

  test "should get index" do
    get bookings_url, as: :json
    assert_response :success
  end

  test "should create booking" do
    assert_difference("Booking.count") do
      post bookings_url, params: { booking: { booking_source: @booking.booking_source, end_time: @booking.end_time, invite_email: @booking.invite_email, invite_name: @booking.invite_name, invite_phone: @booking.invite_phone, start_time: @booking.start_time, status: @booking.status } }, as: :json
    end

    assert_response :created
  end

  test "should show booking" do
    get booking_url(@booking), as: :json
    assert_response :success
  end

  test "should update booking" do
    patch booking_url(@booking), params: { booking: { booking_source: @booking.booking_source, end_time: @booking.end_time, invite_email: @booking.invite_email, invite_name: @booking.invite_name, invite_phone: @booking.invite_phone, start_time: @booking.start_time, status: @booking.status } }, as: :json
    assert_response :success
  end

  test "should destroy booking" do
    assert_difference("Booking.count", -1) do
      delete booking_url(@booking), as: :json
    end

    assert_response :no_content
  end
end
