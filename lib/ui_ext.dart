import 'dart:ui';

extension UiExt on num {
  Size get _size => (window.physicalSize / window.devicePixelRatio);
  double get percent => (this / 100.0) * _size.width;
}

const Color primaryColor = Color(0xFF253C3A);
const Color secondaryColor = Color(0xFF192a28);
