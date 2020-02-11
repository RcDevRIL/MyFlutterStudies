import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:flutter_modular_tests/widgets/hover_translation_widget.dart';

extension HoverExtensions on Widget {
  static final appContainer = html.window.document
      .getElementById('app-container'); // à rajouter dans index.html!!

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this, // the widget we're using the extension on
      onHover: (event) => appContainer.style.cursor = 'pointer',
      onExit: (event) => appContainer.style.cursor = 'default',
    );
  }

  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }
}
