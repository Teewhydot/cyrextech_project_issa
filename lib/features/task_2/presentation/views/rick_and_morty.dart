import 'package:cyrextech_project_issa/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../components/texts.dart';
import '../../domain/models/character.dart';

const String getAllCharactersQuery = """
  query GetAllCharacters(\$page: Int) {
    characters(page: \$page) {
      results {
        id
        name
        status
        species
        image
      }
    }
  }
""";

class RickAndMortyApiTask extends StatelessWidget {
  const RickAndMortyApiTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCharcoal,
      appBar: AppBar(
        title: CustomText(
          text: 'Rick and Morty Characters',
          color: kWhite,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: kCharcoal,
      ),
      body: Query(
        options: QueryOptions(
          document: gql(getAllCharactersQuery),
          variables: {'page': 1},
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          final characters =
              (result.data?['characters']['results'] as List)
                  .map((char) => Character.fromJson(char))
                  .toList();

          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return ListTile(
                leading: Image.network(character.image),
                title: CustomText(
                  text: character.name,
                  color: kWhite,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                subtitle: CustomText(
                  text: '${character.species} - ${character.status}',
                  color: kWhite,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
