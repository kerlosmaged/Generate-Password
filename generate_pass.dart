import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  // ignore: non_constant_identifier_names
  late String NameOfWebsite;
  // ignore: non_constant_identifier_names
  var MyFile = File("filePassword.txt");
  // ignore: non_constant_identifier_names
  var DataWriteFile = MyFile.openWrite(mode: FileMode.writeOnlyAppend);
  int lenforchance = 3;
  Random random = Random();

  // ignore: non_constant_identifier_names
  String AllCharachtare =
      "AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890`/?!@#\$%^&*()_-+";

  while (lenforchance > 0) {
    // this is for take an length for the password
    stdout.write("Enter the len: ");
    int len = int.parse(stdin.readLineSync()!);

    // the password is generate and write for you in terminal
    final passwordGenerator = List.generate(
      len,
      (index) => AllCharachtare[random.nextInt(AllCharachtare.length)],
    ).join();
    stdout.write("$passwordGenerator \n");

    // this is for take an your oppion if the password liked you
    stdout.write("What is your opion: ");
    // ignore: non_constant_identifier_names
    String Validate = stdin.readLineSync().toString();

    if (Validate == "yes") {
      stdout.write("the name for this website is: ");
      NameOfWebsite = stdin.readLineSync().toString();
      DataWriteFile.write(" $NameOfWebsite $passwordGenerator\n");
      break;
    } else {
      stdout.write("#######################\n");
      print("you have ${lenforchance - 1} Chance");
      stdout.write("#######################\n");
      lenforchance = lenforchance - 1;
    }
  }
  stdout.write("Good Bye");
  stdin.readLineSync();
}
