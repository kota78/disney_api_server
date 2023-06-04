/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/attraction_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import 'package:disney_api_server/src/generated/attraction_class.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'attraction': _i2.AttractionEndpoint()
        ..initialize(
          server,
          'attraction',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
    };
    connectors['attraction'] = _i1.EndpointConnector(
      name: 'attraction',
      endpoint: endpoints['attraction']!,
      methodConnectors: {
        'updateAttractionData': _i1.MethodConnector(
          name: 'updateAttractionData',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['attraction'] as _i2.AttractionEndpoint)
                  .updateAttractionData(session),
        ),
        'getAttractions': _i1.MethodConnector(
          name: 'getAttractions',
          params: {
            'keyword': _i1.ParameterDescription(
              name: 'keyword',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['attraction'] as _i2.AttractionEndpoint)
                  .getAttractions(
            session,
            keyword: params['keyword'],
          ),
        ),
        'addAttraction': _i1.MethodConnector(
          name: 'addAttraction',
          params: {
            'attraction': _i1.ParameterDescription(
              name: 'attraction',
              type: _i1.getType<_i4.Attraction>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['attraction'] as _i2.AttractionEndpoint).addAttraction(
            session,
            params['attraction'],
          ),
        ),
        'updateAttraction': _i1.MethodConnector(
          name: 'updateAttraction',
          params: {
            'attraction': _i1.ParameterDescription(
              name: 'attraction',
              type: _i1.getType<_i4.Attraction>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['attraction'] as _i2.AttractionEndpoint)
                  .updateAttraction(
            session,
            params['attraction'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
  }
}
