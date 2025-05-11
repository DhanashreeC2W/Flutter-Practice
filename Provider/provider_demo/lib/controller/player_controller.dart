import 'package:flutter/material.dart';
import 'package:provider_demo/model/player_model.dart';

class PlayerController extends InheritedWidget{
  @override
  bool updateShouldNotify( PlayerController oldWidget) {
  
    return PlayerModel().playerName!= PlayerModel().playerName
  }
}