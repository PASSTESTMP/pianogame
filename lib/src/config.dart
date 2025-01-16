import 'package:flutter/material.dart';

const double magicPadding = 0.9;
const double magicDivision = 3;
const double gameWidth = 1920;
const double gameHeight = 1080;
const double defaultKeyboardWidth = 1880;
const double defaultKeyboardHeight = gameHeight/2;
const double defaultWhiteKeyWidth = defaultKeyboardWidth / 14 - 1;
const double defaultWhiteKeyHeight = defaultKeyboardHeight * 0.8;
const double defaultBlackKeyWidth = defaultWhiteKeyWidth * 0.8;
const double defaultBlackKeyHeight = defaultWhiteKeyHeight * 0.6;
const double defaultSliderWidth = 4 * defaultWhiteKeyWidth;
const double sliderHeight = defaultWhiteKeyHeight;
const double defaultButtonStartWidth = defaultSliderWidth;
const double defaultButtonStartHeight = defaultButtonStartWidth;
const double tempoWidth = 4 * defaultWhiteKeyWidth;
const double tempoHeight = defaultWhiteKeyHeight;
const double notesWidth = 4 * defaultWhiteKeyWidth;
const double notesHeight = defaultWhiteKeyHeight;
const Color  whiteKey = Color.fromARGB(255, 255, 255, 255);
const Color  blackKey = Color.fromARGB(255, 0, 0, 0);
const Color  backColor = Color.fromARGB(255, 54, 54, 54);
const Color selectedKey = Color.fromARGB(255, 93, 236, 255);
const Color selectedBlackKey = Color.fromARGB(255, 49, 128, 138);
const Color transparent = Color.fromARGB(0, 0, 0, 0);
const Color notActive = Color.fromARGB(150, 117, 117, 117);
const Color dropColor = Color.fromARGB(255, 117, 117, 117);
const defaultVomule = 1.0;
const defaultTempo = 60;
const tempoValues = [60, 90, 120, 180];
const defaultNotes = 6;
const numberOfNotesValues = [6, 8, 10, 12, 16];
const noteList = ["C1", "D1", "E1", "F1", "G1", "A1", "B1",
                  "C2", "D2", "E2", "F2", "G2", "A2", "B2",
                  "C#1", "D#1", "F#1", "G#1", "A#1",
                  "C#2", "D#2", "F#2", "G#2", "A#2"];

