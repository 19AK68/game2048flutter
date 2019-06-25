import 'package:flutter_2048_app/Service/game_service.dart';
import 'package:flutter_2048_app/Tools/dimension_helper.dart';
import 'package:flutter_2048_app/widgets/game_button.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2048_app/Tools/subscriber.dart';


class GameToolbar extends StatefulWidget {

  @override
  State<GameToolbar> createState() => _GameToolbarState();
}

class _GameToolbarState extends State<GameToolbar> with SubscriberMixin, DimensionHelper {

  final _gameService = Injector.getInjector().get<GameService>();

  @override
  void initState() {
    subscriptions.add(_gameService.onStateChanged.listen((_) => setState(() {})));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: getPercentFromWidth(context, 5),
          bottom: getPercentFromWidth(context, 2),
        ),
        child: Row(
            children: [
              GameButton(caption: 'score', value: _gameService.score.toString()),
              GameButton(caption: 'top score', value: _gameService.topScore.toString()),
              GameButton(caption: 'restart', onTap: _gameService.initNewGame),
            ]
        )
    );
  }

}
