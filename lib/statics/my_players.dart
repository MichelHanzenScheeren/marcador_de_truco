import 'package:marcadordetruco/models/player_description.dart';
import './my_images.dart';

class MyPlayers {
  MyPlayers._();

  static final PlayerDescription p1Description = PlayerDescription(
    image: MyImages.player1,
    imageType: ImageType.asset,
    name: "Nós",
    playerNumber: Players.p1,
  );

  static final PlayerDescription p2Description = PlayerDescription(
    image: MyImages.player2,
    imageType: ImageType.asset,
    name: "Eles",
    playerNumber: Players.p2,
  );
}
