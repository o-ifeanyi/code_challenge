import 'package:graphql_flutter/graphql_flutter.dart';

class NetworkService {
  final GraphQLClient _client;

  NetworkService({required GraphQLClient client}) : _client = client;

  Future<QueryResult> query(String q) async {
    return await _client.query(
      QueryOptions(document: gql(q)),
    );
  }
}
