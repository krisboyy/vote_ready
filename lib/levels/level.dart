import 'dart:async';
import 'package:flame_isometric/custom_isometric_tile_map_component.dart';
import 'package:flame_isometric/flame_isometric.dart';
import 'package:flame/components.dart';

class Level extends World with HasGameRef {
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    final level = await FlameIsometric.create(
      tileMap: [
        'tilemap.png'
      ],
      tsxList: [
        'tiles/VoteReady.tsx'
      ],
      tmx: 'tiles/level-01.tmx',
    );
    final gameSize = gameRef.size;
    for (var renderLayer in level.renderLayerList) {
      add(
        CustomIsometricTileMapComponent(
          renderLayer.spriteSheet,
          renderLayer.matrix,
          destTileSize: level.srcTileSize,
          position: Vector2(gameSize.x / 2, level.tileHeight.toDouble()),
        ),
      );
    }
  }
}
