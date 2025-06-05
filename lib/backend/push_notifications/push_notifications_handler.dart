import 'dart:async';

import 'serialization_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/Animation_-_Teste_1.gif',
              width: MediaQuery.sizeOf(context).width * 0.6,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'taskOverview': ParameterData.none(),
  'taskStepss': ParameterData.none(),
  'currentTasks': ParameterData.none(),
  'getStarted': ParameterData.none(),
  'continueAs': ParameterData.none(),
  'createProfile': ParameterData.none(),
  'verifyYourAccount': ParameterData.none(),
  'Progress': ParameterData.none(),
  'Chat': (data) async => ParameterData(
        allParams: {
          'chat': getParameter<DocumentReference>(data, 'chat'),
        },
      ),
  'CreateTask': ParameterData.none(),
  'SelectTask': ParameterData.none(),
  'ADDPhotoCreateTask': (data) async => ParameterData(
        allParams: {
          'pretasks': getParameter<DocumentReference>(data, 'pretasks'),
        },
      ),
  'RequestCreateTask': (data) async => ParameterData(
        allParams: {
          'pretasks': getParameter<DocumentReference>(data, 'pretasks'),
        },
      ),
  'RequestEvaluation': ParameterData.none(),
  'LookingTasker': ParameterData.none(),
  'FinalRequestTask': ParameterData.none(),
  'TaskeeRanking': ParameterData.none(),
  'ProfilePage': ParameterData.none(),
  'createProfileTasker': ParameterData.none(),
  'verifyYourAccountTasker': ParameterData.none(),
  'taskOverviewTasker': (data) async => ParameterData(
        allParams: {
          'task': getParameter<DocumentReference>(data, 'task'),
        },
      ),
  'ChatTasker': (data) async => ParameterData(
        allParams: {
          'chat': getParameter<DocumentReference>(data, 'chat'),
        },
      ),
  'TaskeeRankingTasker': ParameterData.none(),
  'ProfilePageTasker': ParameterData.none(),
  'swipeTasker': ParameterData.none(),
  'ConfiguracaoTaskee': ParameterData.none(),
  'ratingsTaskee': ParameterData.none(),
  'Login': ParameterData.none(),
  'RatingsTaskees': ParameterData.none(),
  'RatingsTaskeesCopy': ParameterData.none(),
  'ConfiguracaoTasker': ParameterData.none(),
  'PhoneNumberTasker': ParameterData.none(),
  'ConfiguracaoCopyCopyCopy': ParameterData.none(),
  'emailTasker': ParameterData.none(),
  'PhoneNumberCopy2': ParameterData.none(),
  'PasswordTasker': ParameterData.none(),
  'emailNotificacaoTasker': ParameterData.none(),
  'QuickyTeamNotificacoesTasker': ParameterData.none(),
  'PhoneNumberTaskee': ParameterData.none(),
  'emailTaskee': ParameterData.none(),
  'PasswordTaskee': ParameterData.none(),
  'emailNotificacaoTaskee': ParameterData.none(),
  'QuickyTeamNotificacoesTaskee': ParameterData.none(),
  'PhoneNumberCopy2Copy': ParameterData.none(),
  'fazendoTask': (data) async => ParameterData(
        allParams: {
          'task': getParameter<DocumentReference>(data, 'task'),
        },
      ),
  'RatingsTasker': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
