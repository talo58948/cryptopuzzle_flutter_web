import 'package:flutter/material.dart';

import '../manager.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class RouteAwareWidget extends StatefulWidget {
  final Widget child;
  final Pages page;

  RouteAwareWidget({@required this.child, @required this.page});

  @override
  State<RouteAwareWidget> createState() => RouteAwareWidgetState();
}

// Implement RouteAware in a widget's state and subscribe it to the RouteObserver.
class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  // Called when the current route has been pushed.
  void didPush() {
    Manager.onNavPush(widget.page);
  }

  @override
  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    Manager.onNavPop();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
