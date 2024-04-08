class ApiPath {
  static const String posts = "posts";

  // Auth
  static const String login = "auth/employee/login";
  static const String register = "register";
  static const String requestOtp = "refresh-otp/";
  static const String resetPassword = "reset-password";
  static const String verifyOtp = "verify-otp/";
  static const String forgotPassword = "forgot-password";

  // Ticket
  static const String getRegularTicket = "ticket/employee/get-regular";
  static const String getCatalogingTicket = "ticket/employee/get-recording";
  static const String getDetailTicket = "ticket/employee/detail/6";

  // Profile
  static const String profile = "profile/employee";
}
