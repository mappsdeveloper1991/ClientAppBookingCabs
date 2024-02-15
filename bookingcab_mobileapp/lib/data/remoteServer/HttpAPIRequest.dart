import 'dart:async';
import 'dart:convert';
import 'package:bookingcab_mobileapp/domain/model/Album.dart';
import 'package:http/http.dart' as http;







Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  print('data 01 ${response.reasonPhrase}');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response then parse the JSON.
    print('data 02 ${jsonDecode(response.body)}');
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    print('data 03 ');
    throw Exception('Failed to load album');
  }
}
/*


Future<ShopDetailsData> getShopDetailsData(String pageNameOrNo) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
    };

    var headers2 = {
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
    };

    var urlx = '$baseURL_ADMIN/pages/$pageNameOrNo.json';
    print("httpRequest getShopDetailsData Request URL $urlx");

    var request = http.Request(
        'GET', Uri.parse('$baseURL_ADMIN//pages/$pageNameOrNo.json'));
    request.headers.addAll(headers2);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print('httpRequest getShopDetailsData Response sucess: ${value}');

      var data = ShopDetailsData.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data;
    } else {
      print(
          'httpRequest getShopDetailsData Response: => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getShopDetailsData Response: => Error is comming: ${e}');
    throw Exception('Error');
  }
}



Future<List<ProductsListData>?> getTrendingProductList(String noOfItems) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
      'Cookie':
          '_secure_admin_session_id=21f7d0f18528aa29a62cf01e7068ac0e; _secure_admin_session_id_csrf=21f7d0f18528aa29a62cf01e7068ac0e'
    };

    Map<String, String> queryParams = {
      'sort_by': 'price-ascending',//'best-selling', price-ascending
      'status': 'active',
      'product_type': 'DISPOSABLE PODS', //'Disposable Pod Kit', //'DISPOSABLE PODS',
      'limit': '${noOfItems}',
      'vendor': '',
      'tag': 'Disposable Pod Kit'
    };

    Uri uri = Uri.parse('$baseURL_ADMIN/products.json?');
    final finalUri = uri.replace(queryParameters: queryParams); //USE THIS
    print("httpRequest getTrendingProductList Request URL $uri");
    var request = http.Request('GET', finalUri);


    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print('httpRequest getTrendingProductList => Success is comming: ${value}');

      var data = ProductsListResponse.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data.products;
    } else {
      print('httpRequest getTrendingProductList => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getTrendingProductList => Error is comming: ${e}');
    throw Exception('Error');
  }
}



class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

*/