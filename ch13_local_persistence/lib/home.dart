import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

// Import DatabaseFileRoutines here
import 'classes/database.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DatabaseFileRoutines databaseFileRoutines = DatabaseFileRoutines();
  List<Journal> journals = []; // Add a list to hold the loaded journals

  @override
  void initState() {
    super.initState();
    _loadJournals(); // Load journals when the widget is first initialized
  }

  Future<List<Journal>> _loadJournals() async {
    try {
      // Read journals from the file
      String jsonString = await databaseFileRoutines.readJournals();

      // Convert JSON string to Database object
      Database database = Database.fromJson(json.decode(jsonString));

      // Return the list of journals
      return database.journal;
    } catch (e) {
      print("Error loading journals: $e");
      return []; // Return an empty list in case of an error
    }
  }


  Widget _buildListViewSeparated(AsyncSnapshot<List<Journal>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(snapshot.data![index].note),
          // Other properties of the journal entry...
        );
      },
    );
  }

  void _addOrEditJournal({required bool add, required int index, required Journal journal}) {
    if (add) {
      _addJournal(
        Journal(
          id: UniqueKey().toString(),
          date: DateTime.now().toLocal().toString(),
          mood: 'Happy',
          note: 'New journal entry',
        ),
      );
    } else {
      _editJournal(index, journal);
    }
  }


  void _editJournal(int index, Journal editedJournal) {
    // Replace the journal at the specified index with the editedJournal
    journals[index] = editedJournal;

    // Update the JSON file with the modified list of journals
    _updateJsonFile();

    // Update the state to reflect the changes
    setState(() {});
  }

  void _addJournal(Journal newJournal) {
    // Add the new journal to the list
    journals.add(newJournal);

    // Update the JSON file with the new list of journals
    _updateJsonFile();

    // Update the state to reflect the changes
    setState(() {});
  }

  Future<void> _updateJsonFile() async {
    try {
      // Convert the list of journals to a Database object
      Database database = Database(journal: journals);

      // Use DatabaseFileRoutines to convert Database object to JSON string
      String jsonString = databaseFileRoutines.databaseToJson(database);

      // Write the JSON string to the file
      await databaseFileRoutines.writeJournals(jsonString);
    } catch (e) {
      print("Error updating JSON file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal App'),
      ),
      body: FutureBuilder<List<Journal>>(
        initialData: [],
        future: _loadJournals(),
        builder: (BuildContext context, AsyncSnapshot<List<Journal>> snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : _buildListViewSeparated(snapshot);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(padding: const EdgeInsets.all(24.0)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Journal Entry',
        child: Icon(Icons.add),
        onPressed: () {
          _addOrEditJournal(add: true, index: -1, journal: Journal());
        },
      ),
    );
  }
}
