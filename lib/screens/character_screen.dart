import 'package:flutter/material.dart';
import '../supabase_config.dart';

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<Map<String, dynamic>> characters = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCharacters();
  }

    Future<void> fetchCharacters() async {
    try {
      print('Fetching characters...');
      final response = await SupabaseConfig.supabase
          .from('characters')
          .select();
      
      print('Response received: $response');

      if (mounted && response != null) {  // Updated null check
        setState(() {
          characters = (response as List<dynamic>)
              .map((item) => item as Map<String, dynamic>)
              .toList();
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching characters: $e');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : characters.isEmpty
              ? Center(child: Text('No characters found'))
              : ListView.builder(
                  itemCount: characters.length,
                  itemBuilder: (context, index) {
                    final character = characters[index];
                    return ListTile(
                      title: Text(character['name'] ?? 'No name'),
                      // Add more fields as needed
                    );
                  },
                ),
    );
  }
}
