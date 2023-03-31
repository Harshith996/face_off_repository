// ignore_for_file: constant_identifier_names

class ApiUrls {
  static const root_url = "http://54.219.99.248/face_off_backend_apis/api/";
  static const url_login = "${root_url}user_operations/userLogin.php";
  static const url_signup = "${root_url}user_operations/userSignup.php";
  static const url_update_anon_icon =
      "${root_url}user_operations/updateAnonyIcon.php";
  static const url_request_otp = "${root_url}user_operations/requestOTP.php";
  static const url_verify_otp = "${root_url}user_operations/verifyOTP.php";
  static const url_answer_question = "${root_url}questions/recordAnswer.php";
}
