import 'package:flutter/material.dart';

enum FileType {
  image,
  text,
  video,
}

extension FileTypeEx on FileType {
  String get name {
    Map<FileType, String> params = {
      FileType.text: '文本',
      FileType.image: '图片',
      FileType.video: ' 视频',
    };
    return params[this]!;
  }

  bool get isImage {
    return this == FileType.image;
  }
}

dynamic getSecond(List list) {
  if (list.length < 2) return null;
  return list[1];
}

extension BoolEx on String {
  bool get isContainsBlank {
    return contains(' ');
  }
}

extension ColorEx on Color {
  Color get translucent {
    return withOpacity(0.5);
  }
}

void main() {
  print('hello juejin ${'hello juejin'.isContainsBlank}');
  print('helloJuejin ${'helloJuejin'.isContainsBlank}');
}

extension WidgetEx on Widget {
  Widget get addPadding {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: this,
    );
  }
}
