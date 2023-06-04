/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:disney_api_client/src/protocol/attraction_class.dart' as _i3;
import 'dart:io' as _i4;
import 'protocol.dart' as _i5;

class _EndpointAttraction extends _i1.EndpointRef {
  _EndpointAttraction(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'attraction';

  _i2.Future<bool> updateAttractionData() => caller.callServerEndpoint<bool>(
        'attraction',
        'updateAttractionData',
        {},
      );

  _i2.Future<List<_i3.Attraction>> getAttractions({String? keyword}) =>
      caller.callServerEndpoint<List<_i3.Attraction>>(
        'attraction',
        'getAttractions',
        {'keyword': keyword},
      );

  _i2.Future<bool> addAttraction(_i3.Attraction attraction) =>
      caller.callServerEndpoint<bool>(
        'attraction',
        'addAttraction',
        {'attraction': attraction},
      );

  _i2.Future<bool> updateAttraction(_i3.Attraction attraction) =>
      caller.callServerEndpoint<bool>(
        'attraction',
        'updateAttraction',
        {'attraction': attraction},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i4.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i5.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    attraction = _EndpointAttraction(this);
    example = _EndpointExample(this);
  }

  late final _EndpointAttraction attraction;

  late final _EndpointExample example;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'attraction': attraction,
        'example': example,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
