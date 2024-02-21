enum ImageJPG {
  zekatFoto1,
  zekatFoto2,
  zekatFoto3,
}

extension ImageJPGExtension on ImageJPG {
  String getImage() {
    return "assets/img/$name.jpg";
  }
}

enum ImagePNG {
  bag_of_gold_icon,
  history_icon,
  current_rate,
  goldIcon,
  dolarIcon,
  euroIcon,
  zakatIcon1,
  question_mark_calculator,
  cash_stack,
}

extension ImagePNGExtension on ImagePNG {
  String getImage() {
    return "assets/img/$name.png";
  }
}
