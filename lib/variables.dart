import 'package:flutter/material.dart';

int counter = 0;

int storyLength = 40;
int storyPages = (storyLength % 6) == 0
    ? int.parse((storyLength / 6).toStringAsFixed(0))
    : int.parse((storyLength / 6).toStringAsFixed(0)) + 1;

List<Widget> children;
