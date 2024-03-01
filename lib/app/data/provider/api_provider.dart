abstract class ApiProvider {
  static const _baseUrl = 'http://192.168.245.215:8000';
  // static const _baseUrl = 'https://1d26-193-146-150-220.ngrok-free.app';

  static const register ='$_baseUrl/home/create/';
  static const login = '$_baseUrl/home/login/';

  static const getUsers = '$_baseUrl/home/api/employees/'; // {username}
  static const getDetailUser = '$_baseUrl/home/api/employees/name/'; // {username}
  static const getDetailUserById = '$_baseUrl/home/api/employees/'; // {username}
  static const getCsrf = '$_baseUrl/home/get_csrf_token/'; // {username}
  static const updateUser = '$_baseUrl/home/api/employees/update/'; // {userId}
 
  static const getSchedule = 
      '$_baseUrl/api/bookings/'; // ?venue={venueId}&date={date}
  static const getReservationById = '$_baseUrl/api/bookings/'; // /{userId}
  static const getReservationByVenueId = '$_baseUrl/api/bookings/venue/'; // /{userId}
  static const base = _baseUrl; // /{userId}
  static const cancelReservation = '$_baseUrl/api/bookings/'; // /{reservationId}
  static const createReservation = '$_baseUrl/api/bookings/';
  static const updateReservation = '$_baseUrl/api/bookings/';
  static const updateBookingStatus = '$_baseUrl/api/booking/update_status/'; // {venueId}
  static const deleteBookingStatus = '$_baseUrl/api/booking/delete/'; // {venueId}
  static const searchBooking = '$_baseUrl/api/booking/search/'; // {venueId}

  static const getScheduleExcludeTxId =
      '$_baseUrl/api/bookings/schedule'; // ??venue={venueId}&date={date}&txId={txId}

  static const searchVenue = '$_baseUrl/venue/venues/search/'; // {venueId}
  static const getAllVenue = '$_baseUrl/venue/venues/';
  static const getDetailVenue = '$_baseUrl/venue/venues/'; // {venueId}
  static const registerVenue ='$_baseUrl/venue/venues/create/';
  static const registerVenue2 ='$_baseUrl/venue/venues/create/';

}
