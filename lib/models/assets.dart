import 'package:flutter/material.dart';

class Assets {
  static const images = _Images();
  static const networkImages = _NetworkImages();
}

class _Images {
  final logoPng = const AssetImage('assets/images/logo.png');

  const _Images();
}

class _NetworkImages {
  const _NetworkImages();
}
