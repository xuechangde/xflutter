import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/common_index.dart';

class UiScaffold extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final Widget? drawer;
  final DrawerCallback? onDrawerChanged;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final Widget? bottomSheet;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;
  final String hint;
  final VoidCallback? leftIconCallBack;
  final List<Widget>? rightActions;
  final bool showAppbar;

  const UiScaffold(
      {
        required this.hint,
        super.key,
        this.appBar,
        this.body,
        this.floatingActionButton,
        this.floatingActionButtonLocation,
        this.floatingActionButtonAnimator,
        this.persistentFooterButtons,
        this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
        this.drawer,
        this.onDrawerChanged,
        this.endDrawer,
        this.onEndDrawerChanged,
        this.bottomNavigationBar,
        this.bottomSheet,
        this.backgroundColor = UiColors.whiteColor,
        this.resizeToAvoidBottomInset,
        this.primary = true,
        this.drawerDragStartBehavior = DragStartBehavior.start,
        this.extendBody = false,
        this.extendBodyBehindAppBar = false,
        this.drawerScrimColor,
        this.drawerEdgeDragWidth,
        this.drawerEnableOpenDragGesture = true,
        this.endDrawerEnableOpenDragGesture = true,
        this.restorationId,
        this.leftIconCallBack,
        this.rightActions,
        this.showAppbar = true,
      });

  @override
  State<StatefulWidget> createState() => UiScaffoldState();
}

class UiScaffoldState extends State<UiScaffold>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.appBar??buildAppBar(),
        body: widget.body,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        persistentFooterButtons: widget.persistentFooterButtons,
        drawer: widget.drawer,
        endDrawer: widget.endDrawer,
        bottomNavigationBar: widget.bottomNavigationBar,
        bottomSheet: widget.bottomSheet,
        backgroundColor: widget.backgroundColor,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        primary: widget.primary,
        drawerDragStartBehavior: widget.drawerDragStartBehavior,
        extendBody: widget.extendBody,);
  }

  AppBar? buildAppBar() {
    if(!widget.showAppbar){
      return null;
    }
    return AppBar(
      title: Text(
        widget.hint,
        style: UiTextStyles.headText36Style,
      ),
      // shadowColor: Colors.transparent,
      backgroundColor: UiColors.appBarBg,
      leadingWidth: SizeUnit.titleLeadingWidth,
      leading: GestureDetector(
        onTap: widget.leftIconCallBack??onTapDebounce(() {
          Get.back();
        }),
        child: Icon(Icons.arrow_back_ios_new,size: SizeUnit.backIconButton,color: Colors.black,),
      ),
      centerTitle: true,
      actions: widget.rightActions,
    );
  }
}
