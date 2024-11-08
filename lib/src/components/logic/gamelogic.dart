class Gamelogic {
  var isStarted = false;
  var score = 0;
  
  var iteration = 0;

  void start(){
    score = 0;
    // play every active note one by one with y tempo
    // randomize active notes into x element pattern
    // play every randomized note one by one with tempo and show with every note empty line
  }

  int compareNotes(String obtain, List<String> expected){
    if(obtain == expected.elementAt(iteration)){
      score++;
    }
    iteration++;
    if(iteration>=expected.length){
      iteration = 0;
      return score;
    }
    return -1;
  }

  void playerActions() {
    // wait for x actions
    // with every action write above the line note selected
    // if selected note is equal the expected add 1/x *100 to score
    finish();
  }



  int finish(){
    return score;
  }
}