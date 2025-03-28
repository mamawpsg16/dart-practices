import 'dart:io';

void main() async {
  var config = File('config.txt');

  try {
    // Put the whole file in a single string.
    var stringContents = await config.readAsString();
    print("stringContents = ${stringContents}");
    print('The file is ${stringContents.length} characters long.');

    // Put each line of the file into its own string.
    var lines = await config.readAsLines();
    print("Lines = ${lines}");
    print('The file is ${lines.length} lines long.');
  } catch (e) {
      print(e);
  }

  /** Writing file contents */
  var logFile = File('log.txt');
  var sink = logFile.openWrite();
  var sink1 = logFile.openWrite(mode: FileMode.append);
  // sink.write('FILE ACCESSED ${DateTime.now()}\n');
  sink1.write('FILE ACCESSED NEW ${DateTime.now()}\n');
  // await sink.flush();
  // await sink.close();
  await sink1.flush();
  await sink1.close();

  //  var dir = Directory('.');

  // try {
  //   var dirList = dir.list();
  //   await for (final FileSystemEntity f in dirList) {
  //     if (f is File) {
  //       print('Found file ${f.path}');
  //     } else if (f is Directory) {
  //       print('Found dir ${f.path}');
  //     }
  //   }
  // } catch (e) {
  //   print(e.toString());
  // }

  
}
