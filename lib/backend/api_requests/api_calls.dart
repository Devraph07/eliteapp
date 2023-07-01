import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TrackingCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    List<String>? statusList,
    List<String>? trackidList,
    List<String>? infoList,
    List<String>? dateList,
  }) {
    final status = _serializeList(statusList);
    final trackid = _serializeList(trackidList);
    final info = _serializeList(infoList);
    final date = _serializeList(dateList);

    return ApiManager.instance.makeApiCall(
      callName: 'Tracking',
      apiUrl: 'https://eifcltd.com/api/details.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic info(dynamic response) => getJsonField(
        response,
        r'''$.data[:].information''',
        true,
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      );
  static dynamic trackid(dynamic response) => getJsonField(
        response,
        r'''$.data[:].track_id''',
        true,
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].packagestatus''',
        true,
      );
}

class RequestCollectionCall {
  static Future<ApiCallResponse> call({
    String? sendername = '',
    String? senderemail = '',
    String? senderaddress = '',
    String? senderphone = '',
    String? sendercountry = '',
    String? sendercity = '',
    String? recieveremail = '',
    String? recieveraddress = '',
    String? recieverphone = '',
    String? recievercountry = '',
    String? recievercity = '',
    String? recieverzip = '',
    String? packagedescription = '',
    String? recievername = '',
    String? senderzip = '',
  }) {
    final body = '''
{
  "sendername": "${sendername}",
  "senderemail": "${senderemail}",
  "senderaddress": "${senderaddress}",
  "senderphone": "${senderphone}",
  "sendercountry": "${sendercountry}",
  "sendercity": "${sendercity}",
  "senderzip": "${senderzip}",
  "recievername": "${recievername}",
  "recieveremail": "${recieveremail}",
  "recieveraddress": "${recieveraddress}",
  "recieverphone": "${recieverphone}",
  "recievercountry": "${recievercountry}",
  "recievercity": "${recievercity}",
  "recieverzip": "${recieverzip}",
  "packagedescription": "${packagedescription}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RequestCollection',
      apiUrl: 'https://eifcltd.com/api/create.php',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic sendername(dynamic response) => getJsonField(
        response,
        r'''$.sendername''',
      );
  static dynamic senderemail(dynamic response) => getJsonField(
        response,
        r'''$.senderemail''',
      );
  static dynamic senderphone(dynamic response) => getJsonField(
        response,
        r'''$.senderphone''',
      );
  static dynamic senderaddress(dynamic response) => getJsonField(
        response,
        r'''$.senderaddress''',
      );
  static dynamic sendercountry(dynamic response) => getJsonField(
        response,
        r'''$.sendercountry''',
      );
  static dynamic sendercity(dynamic response) => getJsonField(
        response,
        r'''$.sendercity''',
      );
  static dynamic senderzip(dynamic response) => getJsonField(
        response,
        r'''$.senderzip''',
      );
  static dynamic recievername(dynamic response) => getJsonField(
        response,
        r'''$.recievername''',
      );
  static dynamic recieveremail(dynamic response) => getJsonField(
        response,
        r'''$.recieveremail''',
      );
  static dynamic recieverphone(dynamic response) => getJsonField(
        response,
        r'''$.recieverphone''',
      );
  static dynamic recieveraddress(dynamic response) => getJsonField(
        response,
        r'''$.recieveraddress''',
      );
  static dynamic recievercountry(dynamic response) => getJsonField(
        response,
        r'''$.recievercountry''',
      );
  static dynamic recievercity(dynamic response) => getJsonField(
        response,
        r'''$.recievercity''',
      );
  static dynamic recieverzip(dynamic response) => getJsonField(
        response,
        r'''$.recieverzip''',
      );
  static dynamic packagedescription(dynamic response) => getJsonField(
        response,
        r'''$.packagedescription''',
      );
}

class QuoteCall {
  static Future<ApiCallResponse> call({
    String? weight = '',
    String? foption = '',
    String? cweight = '',
    String? state = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Quote',
      apiUrl: 'https://eifcltd.com/api/quote.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'weight': weight,
        'foption': foption,
        'state': state,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic weight(dynamic response) => getJsonField(
        response,
        r'''$.weightFigure''',
      );
  static dynamic cweight(dynamic response) => getJsonField(
        response,
        r'''$.chargeableWeight''',
      );
  static dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.unitPrice''',
      );
  static dynamic hcharge(dynamic response) => getJsonField(
        response,
        r'''$.handlingCharge''',
      );
  static dynamic foption(dynamic response) => getJsonField(
        response,
        r'''$.freightOption''',
      );
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.output''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
