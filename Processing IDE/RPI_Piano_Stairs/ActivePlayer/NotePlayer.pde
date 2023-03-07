import processing.sound.*;

class Player {  
  private
  SoundFile note;  
  Player(ActivePlayer player, String file) {
    note = new SoundFile(player, file);
  }
  void play() {
    if(!note.isPlaying()) {
      note.play();
    }
  }
};
