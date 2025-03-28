import 'classes.dart' show Spacecraft;

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}


class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

mixin Musician {
  void playInstrument(String instrumentName); // Abstract method.

  void playPiano() {
    playInstrument('Piano');
  }
  void playFlute() {
    playInstrument('Flute');
  }
}

class Virtuoso with Musician { 

  @override
  void playInstrument(String instrumentName) { // Subclass must define.
    print('Plays the $instrumentName beautifully');
  }  
}

/** Access State in the Mixin’s Subclass */
mixin UsernameIdentity {
  String get username; // Abstract getter, subclass must implement

  @override
  int get hashCode => username.hashCode;

  @override
  bool operator ==(Object other) =>
      other is UsernameIdentity && username == other.username;
}

class User with UsernameIdentity {
  final String username;

  User(this.username);
}


/** Implement an Interface in a Mixin */
abstract interface class Tuner {
  void tuneInstrument(); // Every musician must implement tuning
}

mixin Guitarist implements Tuner {
  void playSong() {
    tuneInstrument(); // Calls the subclass method

    print('🎸 Playing a song on the guitar...');
  }
}

class RockStar with Guitarist {
  @override
  void tuneInstrument() {
    print('🔧 Tuning guitar before the show!');
  }
}

/** Use on Clause to Declare a Superclass */
class MusicianV1 {
  void playInstrument() {
    print('🎵 Playing an instrument!');
  }
}

mixin PerformerV1 on MusicianV1 {
  void performOnStage() {
    print('🎤 Performing on stage!');
    super.playInstrument(); // Calls Musician's method
  }
}

class ViolinistV1 extends MusicianV1 with PerformerV1 {}


/** MIXIN CLASS */
mixin class ContentCreator {
  void createContent() {
    print('🎬 Creating amazing content!');
  }
}

// Used as a mixin
class YouTuber with ContentCreator {
  void uploadVideo() {
    print('📹 Uploading a YouTube video...');
  }
}

// Used as a class
class Blogger extends ContentCreator {
  void writeArticle() {
    print('✍️ Writing a blog article...');
  }
}
void main(){
  var piloted = PilotedCraft('Voyager I', DateTime(1977, 9, 5));
  piloted.describeCrew();

  Virtuoso virtuoso = Virtuoso();
  virtuoso.playPiano();
  virtuoso.playFlute();

  /** Access State in the Mixin’s Subclass */
  var user1 = User("john_doe");
  var user2 = User("john_doe");
  
  print(user1 == user2); // ✅ true, because usernames are the same
  print(user1.hashCode); // ✅ Hashcode based on username

  /** Implement an Interface in a Mixin */
  var musician = RockStar();
  musician.playSong();

  /** Use on Clause to Declare a Superclass */
  var artist = ViolinistV1();
  artist.performOnStage();
  artist.playInstrument();

  /** MIXIN CLASS */
  var youtuber = YouTuber();
  youtuber.createContent(); // ✅ Allowed
  youtuber.uploadVideo();

  var blogger = Blogger();
  blogger.createContent(); // ✅ Allowed
  blogger.writeArticle();
}