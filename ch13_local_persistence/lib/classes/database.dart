// Import necessary packages and libraries
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

// DatabaseFileRoutines class
class DatabaseFileRoutines {
  // Get the local documents directory path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Get the reference to the local persistence file
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/local_persistence.json');
  }

  // Read journals from the file
  Future<String> readJournals() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        print("File does not Exist: ${file.absolute}");
        await writeJournals('{"journals": []}');
      }
      // Read the file
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      print("error readJournals: $e");
      return "";
    }
  }

  // Write journals to the file
  Future<File> writeJournals(String json) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$json');
  }

  // Database class methods for JSON conversion
  Database databaseFromJson(String str) {
    final dataFromJson = json.decode(str);
    return Database.fromJson(dataFromJson);
  }

  String databaseToJson(Database data) {
    final dataToJson = data.toJson();
    return json.encode(dataToJson);
  }
}
// Database class
class Database {
  List<Journal> journal;

  Database({required this.journal});

  factory Database.fromJson(Map<String, dynamic> json) => Database(
    journal: List<Journal>.from(json["journals"].map((x) => Journal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "journals": List<dynamic>.from(journal.map((x) => x.toJson())),
  };
}

// Journal class
class Journal {
  String id;
  String date;
  String mood;
  String note;

  Journal({required this.id, required this.date, required this.mood, required this.note});

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
    id: json["id"],
    date: json["date"],
    mood: json["mood"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "mood": mood,
    "note": note,
  };
}

// JournalEdit class
class JournalEdit {
  String action;
  Journal journal;

  JournalEdit({required this.action, required this.journal});
}
