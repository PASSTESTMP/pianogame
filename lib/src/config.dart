import 'package:flutter/material.dart';

double gameWidth = 1920;
double gameHeight = 1080;
double keyboardWidth = gameWidth * 0.9;
double keyboardHeight = gameHeight/2;
double whiteKeyWidth = keyboardWidth / 14 - 1;
double whiteKeyHeight = keyboardHeight * 0.8;
double blackKeyWidth = whiteKeyWidth * 0.8;
double blackKeyHeight = whiteKeyHeight * 0.6;
double sliderWidth = 4 * whiteKeyWidth;
double sliderHeight = blackKeyWidth;
double tempoWidth = 4 * whiteKeyWidth;
double tempoHeight = blackKeyWidth;
double notesWidth = 4 * whiteKeyWidth;
double notesHeight = blackKeyWidth;
const double spaceHeight = 20;
const Color  whiteKey = Color.fromARGB(255, 255, 255, 255);
const Color  blackKey = Color.fromARGB(255, 0, 0, 0);
const Color  backColor = Color.fromARGB(255, 54, 54, 54);
const Color selectedKey = Color.fromARGB(255, 93, 236, 255);
const Color selectedBlackKey = Color.fromARGB(255, 49, 128, 138);
const Color transparent = Color.fromARGB(255, 255, 0, 0);
const Color notActive = Color.fromARGB(150, 117, 117, 117);
double startButtonWidth = gameWidth/3;
double startButtonHeight = startButtonWidth;
double startButtonX = gameWidth / 2;
double startButtonY = gameHeight / 4;
const defaultVomule = 1.0;
const defaultTempo = 60;
const tempoValues = [60, 90, 120, 180];
const defaultNotes = 6;
const numberOfNotesValues = [6, 8, 10, 12, 16];
const noteList = ["C1", "D1", "E1", "F1", "G1", "A1", "B1",
                  "C2", "D2", "E2", "F2", "G2", "A2", "B2",
                  "C#1", "D#1", "F#1", "G#1", "A#1",
                  "C#2", "D#2", "F#2", "G#2", "A#2"];

