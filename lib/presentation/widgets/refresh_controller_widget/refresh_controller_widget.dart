import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshControllerWidget extends StatelessWidget {
  final List<Widget> slivers;
  final Future<void> Function()? onRefresh;
  final Future<void> Function(ScrollNotification scrollInfo)? onScroll;
  final Widget? headerWidget;
  final double headerHeight;
  final ScrollController? controller;
  final Color? refreshBgColor;

  const RefreshControllerWidget({
    Key? key,
    required this.slivers,
    this.headerWidget,
    this.headerHeight = 0,
    this.onRefresh,
    this.controller,
    this.onScroll,
    this.refreshBgColor,
  })  : assert(
            (onScroll != null && controller != null) ||
                (onScroll == null && controller != null) ||
                (onScroll == null && controller == null),
            'onScroll depend by controller'),
        super(key: key);

  bool get _isAndroid => Platform.isAndroid;

  Widget get _header => SliverPersistentHeader(
      pinned: true,
      delegate: _StaticSliverPersistentHeaderDelegate(
        child: headerWidget ?? const SizedBox.shrink(),
        height: headerHeight,
      ));

  List<Widget> get _slivers => [
        if (headerWidget != null) _header,
        if (!_isAndroid)
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh ?? () async {},
            builder: refreshBgColor == null
                ? CupertinoSliverRefreshControl.buildRefreshIndicator
                : (context, mode, v1, v2, v3) {
                    return Container(
                      color: refreshBgColor,
                      child: const Center(
                        child: CupertinoActivityIndicator(
                          radius: 12.0,
                        ),
                      ),
                    );
                  },
          ),
        if (slivers.isNotEmpty) ...slivers,
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 1,
          ),
        ),
      ];

  Widget get _buildCustomScrollView => CustomScrollView(
        controller: controller,
        physics: _isAndroid
            ? const AlwaysScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        slivers: _slivers,
      );

  Widget get _buildCustomScrollViewWithNotificationListener =>
      NotificationListener(
          onNotification: (ScrollNotification scrollInfo) {
            onScroll!(scrollInfo);
            return false;
          },
          child: CustomScrollView(
            controller: controller,
            physics: _isAndroid
                ? const AlwaysScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            slivers: _slivers,
          ));

  Widget get _buildRefreshController {
    if (_isAndroid) {
      return RefreshIndicator(
        color: Colors.black,
        onRefresh: onRefresh ?? () async {},
        child: onScroll != null
            ? _buildCustomScrollViewWithNotificationListener
            : _buildCustomScrollView,
      );
    }
    return onScroll != null
        ? _buildCustomScrollViewWithNotificationListener
        : _buildCustomScrollView;
  }

  @override
  Widget build(BuildContext context) {
    return _buildRefreshController;
  }
}

class _StaticSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _StaticSliverPersistentHeaderDelegate({
    required this.child,
    required this.height,
  });

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      child;

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
