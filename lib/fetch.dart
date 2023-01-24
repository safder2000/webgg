import 'dart:developer';
import 'model.dart';
import 'package:dio/dio.dart';

fetch() async {
  String url = 'https://ajcjewel.com:5000/api/global-gallery/list';
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTY2NjQzMzUxMSwiZXhwIjoxNjk3OTY5NTExfQ.99AkZAY7MJ6nR82r_Sm4FRPZwMpf_zrIUbxtQne0oyw";
  var payload = {
    "statusArray": [1],
    "screenType": [],
    "responseFormat": [],
    "globalGalleryIds": [],
    "categoryIds": [],
    "docTypes": [],
    "types": [],
    "limit": 10,
    "skip": 0,
    "searchingText": ""
  };

  Dio dio = Dio();
  dio.options.headers['content-Type'] = 'application/json';
  dio.options.headers["authorization"] = token;
  var response = await dio.post(url, data: payload);
  // log(response.data.toString());
  final downloadsList = (response.data['data']['list'] as List).map((e) {
    return mList.fromJson(e);
  }).toList();
  // log(downloadsList.toString());
  return downloadsList;
}
