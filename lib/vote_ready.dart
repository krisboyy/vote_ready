import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_isometric/custom_isometric_tile_map_component.dart';
import 'package:flame_isometric/flame_isometric.dart';
import 'package:flutter/material.dart';
import 'package:vote_ready/constants.dart';
import 'dart:math' as math;

class VoteGame extends StatefulWidget {
  const VoteGame({super.key});

  @override
  State<VoteGame> createState() => _VoteGameState();
}

class _VoteGameState extends State<VoteGame> {
  final game = VoteReady();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          GameWidget(game: VoteReady()),
        ],
      ),
    );
  }
}

class VoteReady extends FlameGame with HasGameRef, ScaleDetector, TapDetector {
  Color backgroundColor() => const Color(0xFF927963);
  static const double _minZoom = 0.5;
  static const double _maxZoom = 2.0;
  double _startZoom = _minZoom;
  late FlameIsometric l;

  @override
  void onScaleStart(ScaleStartInfo info) {
    _startZoom = camera.viewfinder.zoom;
  }

  @override
  void onScaleUpdate(ScaleUpdateInfo info) {
    final currentScale = info.scale.global;
    if (currentScale.isIdentity()) {
      _processDrag(info);
    }
  }

  void _processDrag(ScaleUpdateInfo info) {
    final delta = info.delta.global;
    final zoomDragFactor = 1.0 / _startZoom;
    final currentPosition = camera.viewfinder.position;

    camera.viewfinder.position = currentPosition.translated(
      -delta.x * zoomDragFactor,
      -delta.y * zoomDragFactor,
    );
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    await images.loadAllImages();
    final level = await FlameIsometric.create(
      tileMap: [
        'tilemap.png'
      ],
      tsxList: [
        'tiles/new_tiles.tsx'
      ],
      tmx: 'tiles/level-01.tmx',
    );
    Constants.setGameWorldSize(
      Size(
        level.tiledMap.width.toDouble() * level.tiledMap.tileWidth.toDouble(),
        level.tiledMap.height.toDouble() * level.tiledMap.tileHeight.toDouble(),
      ),
    );

    l = level;
    final gameSize = gameRef.size;
    for (var renderLayer in level.renderLayerList) {
      world.add(
        CustomIsometricTileMapComponent(
          anchor: Anchor.topLeft,
          renderLayer.spriteSheet,
          renderLayer.matrix,
          destTileSize: level.srcTileSize,
          position: Vector2(gameSize.x / 2, 0),
        ),
      );
    }
    camera.viewfinder.visibleGameSize = Vector2(
      Constants.gameWorldSize.width,
      Constants.gameWorldSize.height,
    );
    camera.viewfinder.position = Vector2(
      0.17 * Constants.gameWorldSize.width,
      0.5 * Constants.gameWorldSize.height,
    );
    camera.viewfinder.anchor = Anchor.center;
  }

  @override
  Future<void> onTapUp(TapUpInfo info) async {
    final tappedCel = _getTappedCell(info);
    print("${tappedCel.row}, ${tappedCel.col}");

    // final tappedCel = estimateCallTime<TileInfo>(() {
    //     return _getTappedCell(info);
    //   },
    // );

    // developer.log('cell: ${tappedCel.row}; ${tappedCel.col}');
  }

  TileInfo _getTappedCell(TapUpInfo info) {
    final clickOnMapPoint = camera.globalToLocal(info.eventPosition.global);

    final rows = l.tiledMap.width;
    final cols = l.tiledMap.height;
    final tileSize = Vector2(l.tileWidth.toDouble(), l.tileHeight.toDouble());

    var targetRow = 0;
    var targetCol = 0;
    var minDistance = double.maxFinite;
    var targetCenter = Offset.zero;

    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < cols; col++) {
        final xCenter = col * tileSize.x + tileSize.x / 2 + (row.isEven ? 0 : tileSize.x / 2);
        final yCenter = row * tileSize.y - (row * tileSize.y / 4) + tileSize.y / 2;

        final distance = math.sqrt(math.pow(xCenter - clickOnMapPoint.x, 2) + math.pow(yCenter - clickOnMapPoint.y, 2));

        if (distance < minDistance) {
          minDistance = distance;
          targetRow = row;
          targetCol = col;
          targetCenter = Offset(xCenter, yCenter);
        }
      }
    }

    return TileInfo(center: targetCenter, row: targetRow, col: targetCol);
  }
}

class TileInfo {
  TileInfo({
    required this.center,
    required this.row,
    required this.col,
  });

  final Offset center;
  final int row;
  final int col;
}
