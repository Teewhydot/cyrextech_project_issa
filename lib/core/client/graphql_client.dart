import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink('https://rickandmortyapi.com/graphql');

  static ValueNotifier<GraphQLClient> initializeClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: InMemoryStore()),
        defaultPolicies: DefaultPolicies(
          query: Policies(
            fetch: FetchPolicy.cacheAndNetwork,
            cacheReread: CacheRereadPolicy.mergeOptimistic,
          ),
          watchQuery: Policies(
            fetch: FetchPolicy.cacheAndNetwork,
            cacheReread: CacheRereadPolicy.mergeOptimistic,
          ),
          mutate: Policies(
            fetch: FetchPolicy.networkOnly,
            cacheReread: CacheRereadPolicy.mergeOptimistic,
          ),
        ),
      ),
    );

    return client;
  }
}
