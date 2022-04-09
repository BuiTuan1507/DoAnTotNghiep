import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  print('Say Hello!!!');

  var dirAddress = stdin.readLineSync(encoding: utf8);
  print(dirAddress);
  bool exists = await Directory(dirAddress!).exists();
  if (exists) {
    var dir = new Directory(dirAddress);
    var nameOfDir = dirAddress.substring(dirAddress.lastIndexOf('\\'));
    var file = File(dirAddress + '\\' + nameOfDir + '.dart');
    var sink = file.openWrite();
    readFile(dir.path, dir, sink);
    sink.close();
  }else{
    print('Nhập liệu ngu!!!');

  }
}

void readFile(String parent, Directory dir, IOSink sink) {
  List contents = dir.listSync();
  for (var fileOrDir in contents) {
    if (fileOrDir is File) {
      writeFile(parent, fileOrDir.path, sink);
    } else if (fileOrDir is Directory) {
      readFile(parent, fileOrDir, sink);
    }
  }
}

void writeFile(String parent, String path, IOSink sink) {
  var listIgnore = ['.DS_Store'];
  bool isIgnore = false;

  for (final text in listIgnore) {
    isIgnore = path.contains(text);
    if(isIgnore) break;
  }

  if (!isIgnore) {
    var result = path.replaceAll(parent + '\\', 'export \'') + '\';\n';
    var resultWindowns = result.replaceAll('\\', '/');
    sink.write(resultWindowns);
  }
}
