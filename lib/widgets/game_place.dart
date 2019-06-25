import 'package:flutter/widgets.dart';
import 'package:flutter_2048_app/widgets/game_bord.dart';
import 'package:flutter_2048_app/widgets/game_heder.dart';
import 'package:flutter_2048_app/widgets/game_toolbar.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:flutter_2048_app/Service/game_service.dart';
import 'package:flutter_2048_app/Tools/dimension_helper.dart';
import 'package:flutter_2048_app/Tools/direction.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class GamePlace extends StatefulWidget {
  @override
  State<GamePlace> createState() => _GamePlaceState();
  
}

class _GamePlaceState extends State<GamePlace> with DimensionHelper {

  final GameService _gameService = Injector.getInjector().get<GameService>();

  @override
  void initState() {
    _gameService.initNewGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GameHeader(),
        GameBoard(),
        GameToolbar(),
      ],
    );
    return SwipeDetector(
      child: content,
      onSwipeUp: () => _gameService.turn(Direction.top),
      onSwipeDown: () =>_gameService.turn(Direction.bottom),
      onSwipeLeft: () => _gameService.turn(Direction.left),
      onSwipeRight: () =>_gameService.turn(Direction.right),
      swipeConfiguration: SwipeConfiguration(
        verticalSwipeMinVelocity: 10.0,
        verticalSwipeMinDisplacement: 0.0,
        horizontalSwipeMinDisplacement:0.0,
        horizontalSwipeMinVelocity: 10.0,
      ),
    );

  }
}

