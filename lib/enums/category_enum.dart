import 'package:newsapp/gen/assets.gen.dart';

enum CategoryEnum {
  general,
  business,
  sports,
  tecnology,
  health,
  science,
  entertainment;

  String get getImage {
    switch (this) {
      case CategoryEnum.general:
        return Assets.images.enumpng.general.path;
      case CategoryEnum.business:
        return Assets.images.enumpng.busniess.path;
      case CategoryEnum.sports:
        return Assets.images.enumpng.sport.path;
      case CategoryEnum.tecnology:
        return Assets.images.enumpng.technology.path;
      case CategoryEnum.health:
        return Assets.images.enumpng.helth.path;
      case CategoryEnum.science:
        return Assets.images.enumpng.science.path;
      case CategoryEnum.entertainment:
        return Assets.images.enumpng.entertainment.path;
    }
  }

  String getThemeImage(bool isDark) {
    if (isDark) {
      return getImage;
    }

    switch (this) {
      case CategoryEnum.general:
        return 'assets/images/enumpng/general-1.png';

      case CategoryEnum.business:
        return 'assets/images/enumpng/busniess-1.png';

      case CategoryEnum.sports:
        return 'assets/images/enumpng/sport-1.png';

      case CategoryEnum.tecnology:
        return 'assets/images/enumpng/technology-1.png';

      case CategoryEnum.health:
        return 'assets/images/enumpng/helth-1.png';

      case CategoryEnum.science:
        return 'assets/images/enumpng/science-1.png';

      case CategoryEnum.entertainment:
        return 'assets/images/enumpng/entertainment-1.png';
    }
  }
}
