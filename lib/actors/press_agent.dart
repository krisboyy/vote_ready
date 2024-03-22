import 'dart:async';
import 'dart:ui';
import 'package:flame/components.dart';
import '../vote_ready.dart';

class PressAgent extends SpriteComponent with HasGameReference<VoteReady> {
  PressAgent({
    required super.position,
  }) {
    super.size = Vector2.all(256);
    super.anchor = Anchor.center;
    // super.sprite = Sprite(Image.(image: AssetImage('press_agent.png')));
  }
  @override
  FutureOr<void> onLoad() {
    // final myObject = SpriteComponent()
    //   ..sprite = await loadSprite('my_object.png')
    //   ..size = Vector2(64, 64) // Set the size of your object
    //   ..position = getIsometricPosition(3, 5);
    return super.onLoad();
  }
}
