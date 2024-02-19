abstract class ApiProvider {
  static const _baseUrl = 'https://6449-193-146-150-220.ngrok-free.app';

  static const register =
      '$_baseUrl/home/create/';
  static const login = '$_baseUrl/home/login/';

  static const getDetailUser = '$_baseUrl/home/api/employees/name/'; // {username}
  static const updateUser = '$_baseUrl/home/api/employees/'; // {userId}

  static const getSchedule = 
      '$_baseUrl/api/bookings'; // ?venue={venueId}&date={date}
  static const getReservationById = '$_baseUrl/api/bookings/'; // /{userId}
  static const base = _baseUrl; // /{userId}
  static const cancelReservation = '$_baseUrl/api/bookings/'; // /{reservationId}
  static const createReservation = '$_baseUrl/api/bookings';
  static const updateReservation = '$_baseUrl/api/bookings';
  static const getScheduleExcludeTxId =
      '$_baseUrl/api/bookings/schedule'; // ??venue={venueId}&date={date}&txId={txId}

  static const getAllVenue = '$_baseUrl/venue/venues/';
  static const getDetailVenue = '$_baseUrl/venue/venues/'; // {venueId}
}
