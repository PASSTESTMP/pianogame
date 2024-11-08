import 'package:flutter/material.dart';

const double gameWidth = 1920;
const double gameHeight = 1080;
const double keyboardWidth = 1880;
const double keyboardHeight = 600;
const double whiteKeyWidth = keyboardWidth / 14 - 1;
const double whiteKeyHeight = keyboardHeight * 0.8;
const double blackKeyWidth = whiteKeyWidth * 0.8;
const double blackKeyHeight = whiteKeyHeight * 0.6;
const Color  whiteKey = Color.fromARGB(255, 255, 255, 255);
const Color  blackKey = Color.fromARGB(255, 0, 0, 0);
const Color  backColor = Color.fromARGB(255, 54, 54, 54);
const Color selectedKey = Color.fromARGB(255, 93, 236, 255);
const Color selectedBlackKey = Color.fromARGB(255, 49, 128, 138);
const defaultVomule = 100;
const defaultTempo = 60;
const tempoValues = [60, 90, 120, 180];
const defaultNotes = 6;
const noteList = ["C1", "D1", "E1", "F1", "G1", "A1", "B1",
                  "C2", "D2", "E2", "F2", "G2", "A2", "B2",
                  "C#1", "D#1", "F#1", "G#1", "A#1",
                  "C#2", "D#2", "F#2", "G#2", "A#2"];

