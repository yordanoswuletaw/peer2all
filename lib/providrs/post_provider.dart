import 'package:flutter/cupertino.dart';

class PostProvider with ChangeNotifier {
  String _title = "";
  Map<String, String> _links = {};
  String _description = "";
  String _file = "";

  set setTitle(title) => _title = title;
  set setDescription(description) => _description = description;
  set addLink(link) => _links.addEntries(link);
  set deleteLink(link) => _links.remove(link);
  set clearLink(_) => _links.clear();
  set setFile(file) => _file = file;

  String get title => _title;
  String get file => _file;
  Map<String, String> get links => _links;
  String get description => _description;
}
