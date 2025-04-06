import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Stripe Group Code

class StripeGroup {
  static String getBaseUrl() => 'https://api.stripe.com/v1';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  static AdicionarSaldoParaOUsuarioCall adicionarSaldoParaOUsuarioCall =
      AdicionarSaldoParaOUsuarioCall();
  static RecuperarSaldoDoUsuarioCall recuperarSaldoDoUsuarioCall =
      RecuperarSaldoDoUsuarioCall();
  static CriarContaCall criarContaCall = CriarContaCall();
  static AccountLinksCall accountLinksCall = AccountLinksCall();
  static GetAccountCall getAccountCall = GetAccountCall();
  static SessionCall sessionCall = SessionCall();
}

class AdicionarSaldoParaOUsuarioCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    int? amount,
  }) async {
    final baseUrl = StripeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Adicionar Saldo para o Usuario',
      apiUrl: '${baseUrl}/billing/credit_grants',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'amount[monetary][value]': amount,
        'amount[monetary][currency]': "usd",
        'applicability_config[scope][price_type]': "metered",
        'customer': customer,
        'amount[type]': "monetary",
        'name': "Saldo Quicky",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RecuperarSaldoDoUsuarioCall {
  Future<ApiCallResponse> call({
    String? customer = '',
  }) async {
    final baseUrl = StripeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Recuperar Saldo do Usuario',
      apiUrl: '${baseUrl}/billing/credit_balance_summary',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'customer': customer,
        'filter': "credit_grant",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CriarContaCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? country = '',
    String? type = '',
    String? businessType = '',
  }) async {
    final baseUrl = StripeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Criar Conta',
      apiUrl: '${baseUrl}/accounts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'business_type': businessType,
        'type': type,
        'country': country,
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class AccountLinksCall {
  Future<ApiCallResponse> call({
    String? returnUrl = '',
    String? refreshUrl = '',
    String? type = '',
    String? account = '',
  }) async {
    final baseUrl = StripeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Account Links',
      apiUrl: '${baseUrl}/account_links',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'account': account,
        'type': type,
        'refresh_url': refreshUrl,
        'return_url': returnUrl,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class GetAccountCall {
  Future<ApiCallResponse> call({
    String? clientSecret = '',
  }) async {
    final baseUrl = StripeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Account',
      apiUrl: '${baseUrl}/payment_intents/${clientSecret}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'client_secret': clientSecret,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? accountOnboardFinish(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.charges_enabled''',
      ));
}

class SessionCall {
  Future<ApiCallResponse> call({
    int? quantity,
    String? name = '',
    String? currency = '',
    String? cancelUrl = '',
    String? successUrl = '',
    int? unitAmount,
    String? connectedAcct = '',
  }) async {
    final baseUrl = StripeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Session',
      apiUrl: '${baseUrl}/checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Stripe-Account': '${connectedAcct}',
      },
      params: {
        'cancel_url': cancelUrl,
        'success_url': successUrl,
        'line_items[0][price_data][currency]': currency,
        'line_items[0][price_data][product_data][name]': name,
        'line_items[0][quantity]': quantity,
        'mode': "payment",
        'line_items[0][price_data][unit_amount]': unitAmount,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  String? idSession(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

/// End Stripe Group Code

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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
