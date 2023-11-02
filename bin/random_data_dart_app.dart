
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  try {
    var url = Uri.https("random-data-api.com", '/api/users/random_user', {'size': '12'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response.body);
      final List<dynamic> users = json.decode(response.body);

      for (var user in users) {
        final uid = user['uid'];
        final firstName = user['first_name'];
        final lastName = user['last_name'];

        final userString = 'UID: $uid, first_name: $firstName, last_name: $lastName';
        print(userString);
      }
    } else {
      print('Failed to fetch user data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
