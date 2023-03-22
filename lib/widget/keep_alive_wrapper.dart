import 'package:flutter/cupertino.dart';

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;
  final bool isKeepAlive ;

  const KeepAliveWrapper({Key? key, required this.child, this.isKeepAlive = true})
      : super(key: key);

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => widget.isKeepAlive;
}
