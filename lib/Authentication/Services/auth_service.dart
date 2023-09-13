import 'package:amazon/constants/error_handeling.dart';
import 'package:amazon/constants/gobal_variables.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser({
    required context,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      UserModel userModel = UserModel(
        id: "",
        name: name,
        email: email,
        password: password,
        address: "",
        type: "user",
        token: "token",
      );

      http.Response response = await http.post(
        Uri.parse("$uri/user/signup"),
        body: userModel.toJson(),
        headers: <String, String>{
          "contect-Type": "application/json: charset=UTF-8"
        },
      );

      httpErrorHandel(
        response: response,
        context: context,
        onsucess: () {
          showSnackBar(
            "Account created sucessfully, Login with same credential",
            context,
          );
        },
      );
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }
}
