enum LottiePaths {
  home_lottie,
  currency_rate_lottie,
  zakatLottie,
  empty_lottie
}

extension LottiePathsExtension on LottiePaths {
  String getPath() {
    return "assets/lottie/$name.json";
  }
}
