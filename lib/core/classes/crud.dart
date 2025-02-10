import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/funtions/checkinternet.dart';

import 'package:http/http.dart' as http;

class CRUD {
  Future<Either<StatueRequest, Map>> getdata(
      String url, Map<String, dynamic> params,
      {String? token}) async {
    try {
      if (await checkinternet()) {
        // Construct the URI with query parameters
        var uri = Uri.parse(url).replace(queryParameters: params);

        // Perform the HTTP GET request
        var response = await http.get(
          uri,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        );

        // Log the response status and body
        print("Status Code: ${response.statusCode}");
        print("Response Body: ${response.body}");

        // Handle successful response
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print("Parsed Response: $responsebody");
          return Right(responsebody);
        } else if (response.statusCode == 401) {
          return const Left(StatueRequest.unauthenticated);
        } else {
          print("Server Failure");
          return const Left(StatueRequest.ServerFaliure);
        }
      } else {
        print("No Internet Connection");
        return const Left(StatueRequest.offline);
      }
    } catch (e) {
      print("Exception in getdata function: $e");
      return const Left(StatueRequest.ServerFaliure);
    }
  }

  Future<Either<StatueRequest, dynamic>> deleteData(
      String url, Map<String, dynamic> params,
      {String? token}) async {
    try {
      if (await checkinternet()) {
        print("object");
        params.removeWhere((key, value) => value == null);
        var queryParams =
            params.map((key, value) => MapEntry(key, value.toString()));
        var uri = Uri.parse(url).replace(queryParameters: queryParams);
        print("Constructed URI: $uri");
        // Perform the HTTP DELETE request
        var response = await http.delete(
          uri,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        );

        print("Response Status Code: ${response.statusCode}");
        print("Response Body: ${response.body}");

        if (response.body.isEmpty) {
          // No content response, successful delete
          print("Delete operation successful.");
          return const Left(StatueRequest.deletedsuccess);
        } else if (response.statusCode == 401) {
          return const Left(StatueRequest.unauthenticated);
        } else {
          print("Server Failure");
          return const Left(StatueRequest.ServerFaliure);
        }
      } else {
        print("No Internet Connection");
        return const Left(StatueRequest.offline);
      }
    } catch (e) {
      print("Exception in deleteData function: $e");
      return const Left(StatueRequest.ServerFaliure);
    }
  }

  Future<Either<StatueRequest, Map>> postdata(String url, Map data,
      {String? token}) async {
    try {
      if (await checkinternet()) {
        var uri = Uri.parse(url);
        var response = await http.post(
          uri,
          body: jsonEncode(data),
          headers: {
            'Accept': AppConstans.accepct,
            'Content-Type': AppConstans.contenttype,
            if (token != null) 'Authorization': 'Bearer $token'
          },
        );
        print(response.statusCode);
        print(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else if (response.statusCode == 401) {
          print("unauthenticated");
          return const Left(StatueRequest.unauthenticated);
        } else {
          print("failServerr");
          return const Left(StatueRequest.ServerFaliure);
        }
      } else {
        print("No internet connection. Please check your internet.");
        return const Left(StatueRequest.offline);
      }
    } catch (e) {
      print("Error in postdata function: $e");
      return const Left(StatueRequest.ServerFaliure);
    }
  }

  Future<Either<StatueRequest, Map>> postdataAuth(String url, Map data,
      {String? token}) async {
    try {
      if (await checkinternet()) {
        var uri = Uri.parse(url);
        var response = await http.post(
          uri,
          body: jsonEncode(data),
          headers: {
            'Accept': AppConstans.accepct,
            'Content-Type': AppConstans.contenttype,
            if (token != null) 'Authorization': 'Bearer $token'
          },
        );
        print(response.statusCode);
        print(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else if (response.statusCode == 422) {
          return const Left(StatueRequest.Validationerror);
        } else if (response.statusCode == 403) {
          return const Left(StatueRequest.Authorizationerror);
        } else if (response.statusCode == 401) {
          return const Left(StatueRequest.Unauthorizederror);
        } else {
          return const Left(StatueRequest.ServerFaliure);
        }
      } else {
        print("No internet connection. Please check your internet.");
        return const Left(StatueRequest.offline);
      }
    } catch (e) {
      print("Error in postdata function: $e");
      return const Left(StatueRequest.ServerFaliure);
    }
  }

  Future<Either<StatueRequest, Map>> postdataAuthhandelingresponse(
      String url, Map data,
      {String? token}) async {
    try {
      if (await checkinternet()) {
        var uri = Uri.parse(url);
        var response = await http.post(
          uri,
          body: jsonEncode(data),
          headers: {
            'Accept': AppConstans.accepct,
            'Content-Type': AppConstans.contenttype,
            if (token != null) 'Authorization': 'Bearer $token'
          },
        );
        print(response.statusCode);
        print(response.body);

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 422 ||
            response.statusCode == 403 ||
            response.statusCode == 401) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else if (response.statusCode == 404) {
          return const Left(StatueRequest.notfounduser);
        } else {
          return const Left(StatueRequest.ServerFaliure);
        }
      } else {
        print("No internet connection. Please check your internet.");
        return const Left(StatueRequest.offline);
      }
    } catch (e) {
      print("Error in postdata function: $e");
      return const Left(StatueRequest.ServerFaliure);
    }
  }

  Future<Either<StatueRequest, Map>> patchDataAuthHandlingResponse(
      String url, Map data,
      {String? token}) async {
    try {
      if (await checkinternet()) {
        var uri = Uri.parse(url);
        var response = await http.patch(
          uri,
          body: jsonEncode(data),
          headers: {
            'Accept': AppConstans.accepct,
            'Content-Type': AppConstans.contenttype,
            if (token != null) 'Authorization': 'Bearer $token'
          },
        );
        print(response.statusCode);
        print(response.body);

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 422 ||
            response.statusCode == 403 ||
            response.statusCode == 401) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else if (response.statusCode == 404) {
          return const Left(StatueRequest.notfounduser);
        } else {
          return const Left(StatueRequest.ServerFaliure);
        }
      } else {
        print("No internet connection. Please check your internet.");
        return const Left(StatueRequest.offline);
      }
    } catch (e) {
      print("Error in patchData function: $e");
      return const Left(StatueRequest.ServerFaliure);
    }
  }

  Future<Either<StatueRequest, Map>> testPatchfunc(String url, Map body,
      {String? token}) async {
    if (await checkinternet()) {
      var uri = Uri.parse(url);
      var response = await http.patch(
        uri,
        body: jsonEncode(body),
        headers: {
          'Accept': AppConstans.accepct,
          'Content-Type': AppConstans.contenttype,
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody);
      } else {
        return Left(StatueRequest.ServerFaliure);
      }
    } else {
      return Left(StatueRequest.offline);
    }
  }

  Future<Either<StatueRequest, Map>> uploadImageRequest(
    String url,
    File image, {
    String? token,
  }) async {
    try {
      if (await checkinternet()) {
        // Prepare headers
        Map<String, String> headers = {
          'Accept': AppConstans.accepct,
        };
        if (token != null) {
          headers['Authorization'] = 'Bearer $token';
        }

        // Create a multipart request
        var request = http.MultipartRequest('POST', Uri.parse(url))
          ..headers.addAll(headers)
          ..fields['_method'] = 'PATCH'
          ..files.add(
            await http.MultipartFile.fromPath('photo', image.path),
          );

        // Send the request
        var response = await request.send();

        // Read and debug response body
        var responseBody = await response.stream.bytesToString();
        print("Raw response body: $responseBody");

        // Handle response status and parsing
        if (response.statusCode == 200) {
          try {
            Map<String, dynamic> decodedResponse = jsonDecode(responseBody);
            print("Response body (JSON): $decodedResponse");
            return Right(decodedResponse);
          } catch (e) {
            print("Response is not JSON: $responseBody");
            return const Left(StatueRequest.ServerFaliure);
          }
        } else {
          print("Image upload failed: ${response.statusCode}");
          return const Left(StatueRequest.ServerFaliure);
        }
      } else {
        print("No internet connection. Please check your internet.");
        return const Left(StatueRequest.offline);
      }
    } catch (e) {
      print("Error in uploadImageRequest function: $e");
      return const Left(StatueRequest.ServerFaliure);
    }
  }
}
