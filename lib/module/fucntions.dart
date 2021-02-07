import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> postToServer({String api, dynamic body, Map<String,String> header}) async{
  if (header == null)
    header = {'Content-Type': 'application/json'};
  var res = await http.post("https://codewitharman.herokuapp.com/$api", headers: header, body: jsonEncode(body));

  if(res.statusCode == 200)
    return {"msg": "Success", "body": json.decode(utf8.decode(res.bodyBytes))};
  else if (res.statusCode == 404)
    return {"msg": "عدم دسترسی به توابع سرور"};
  else
    return {"msg": json.decode(utf8.decode(res.bodyBytes))['message']};
}
