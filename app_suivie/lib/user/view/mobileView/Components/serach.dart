/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _errorMessage = '';

  Future<List<String>> _searchWeb(String query) async {
    final searchUrl =
        'https://www.googleapis.com/customsearch/v1?q=$query&cx=6719fd4e048c0490d&key=AIzaSyAMHX_BKFOJ9juzBC9OwLba8Fhh2ABIj7k';
    final response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final searchResults = <String>[];
      final searchResultsWithoutFilter = <String>[];

      for (final item in jsonResponse['items']) {
        final title = item['title'];
        final link = item['link'];
        final filteredLink = await _filterSearchResult(link);
        if (filteredLink == null) {
          // Afficher un message d'erreur si le résultat est filtré
          setState(() {
            _errorMessage =
                'Le contenu de certains résultats de recherche a été filtré.';
          });
          return [];
        } else {
          searchResults.add('$title\n$filteredLink');
        }
      }
      return searchResults;
    } else {
      throw Exception('Failed to search web.');
    }
  }

  Future<String?> _filterSearchResult(String link) async {
    final safeSearchUrl =
        'https://safebrowsing.googleapis.com/v4/threatMatches:find?key=AIzaSyAMHX_BKFOJ9juzBC9OwLba8Fhh2ABIj7k';
    final body = jsonEncode({
      'client': {'clientId': 'flutter', 'clientVersion': '1.0.0'},
      'threatInfo': {
        'threatTypes': [
          'MALWARE',
          'SOCIAL_ENGINEERING',
          'UNWANTED_SOFTWARE',
          'POTENTIALLY_HARMFUL_APPLICATION',

        ],
        'platformTypes': ['ANY_PLATFORM'],
        'threatEntryTypes': ['URL'],
        'threatEntries': [
          {'url': link}
        ],
      },
    });
    final response = await http.post(
      Uri.parse(safeSearchUrl),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse.containsKey('matches') &&
          jsonResponse['matches'].isNotEmpty) {
        // Le résultat est filtré, renvoyer null pour indiquer que le résultat doit être ignoré
        return null;
      } else {
        // Le résultat n'est pas filtré, renvoyer le lien d'origine
        return link;
      }
    } else {
      throw Exception('Failed to filter search result.');
    }
  }
List<String> _searchResults = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recherche sur le Web'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher...',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final query = _searchController.text;
              final results = await _searchWeb(query);
              setState(() {
                _errorMessage = '';
                 _searchResults = results;
              });
              if (_searchResults.isNotEmpty) {
                print(results);
                Expanded(
                    child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_searchResults[index]),
                    );
                  },
                ));
              }
            },
            child: Text('Rechercher'),
          ),
          if (_errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}*/
