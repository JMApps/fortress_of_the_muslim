import 'package:flutter/material.dart';

class ScrollPageState extends ChangeNotifier {
  double _previousScrollPosition = 0.0;
  final ScrollController _scrollController = ScrollController();

  ScrollController get getScrollController => _scrollController;

  final ValueNotifier<double> _buttonOpacityNotifier = ValueNotifier(0.0);
  ValueNotifier<double> get getButtonOpacity => _buttonOpacityNotifier;

  ScrollPageState() {
    _scrollController.addListener(_onScroll);
  }

  void getToTop() => _toTop();

  void _toTop() {
    _scrollController.animateTo(0, duration: const Duration(milliseconds: 360), curve: Curves.easeIn);
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      final double currentPixels = _scrollController.position.pixels;
      final double maxScroll = _scrollController.position.maxScrollExtent;

      if (currentPixels <= 0) {
        _buttonOpacityNotifier.value = 0.0;
      } else if (maxScroll > 0 && (currentPixels - _previousScrollPosition).abs() > 0) {
        if (currentPixels < _previousScrollPosition) {
          _buttonOpacityNotifier.value = 1.0;
        } else {
          _buttonOpacityNotifier.value = 0.0;
        }
        _previousScrollPosition = currentPixels;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}