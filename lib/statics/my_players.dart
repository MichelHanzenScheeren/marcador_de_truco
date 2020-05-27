import '../models/player.dart';
import './my_images.dart';

class MyPlayers {
  MyPlayers._();

  static final Player player1 = Player(
    image: MyImages.player1,
    imageType: ImageType.asset,
    name: "Nós",
    playerNumber: Players.p1,
  );

  static final Player player2 = Player(
    image: MyImages.player2,
    imageType: ImageType.asset,
    name: "Eles",
    playerNumber: Players.p2,
  );
}
