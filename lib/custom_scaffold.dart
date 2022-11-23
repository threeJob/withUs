import 'package:flutter/material.dart';

class CustomScaffold extends Scaffold {
  static GlobalKey<ScaffoldState> _keyScaffold = GlobalKey();

  CustomScaffold({
    AppBar? appBar,
    Widget? body,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    FloatingActionButtonAnimator? floatingActionButtonAnimator,
    List<Widget>? persistentFooterButtons,
    Widget? drawer,
    Widget? endDrawer,
    Widget? bottomNavigationBar,
    Widget? bottomSheet,
    Color? backgroundColor,
    bool resizeToAvoidBottomPadding = true,
    bool primary = true,
  }) : super(
          key: _keyScaffold,
          appBar: endDrawer != null &&
                  appBar!.actions != null &&
                  appBar.actions!.isNotEmpty
              ? _buildEndDrawerButton(appBar)
              : appBar,
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          drawer: drawer,
          endDrawer: endDrawer,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          primary: primary,
        );

  static AppBar _buildEndDrawerButton(AppBar myAppBar) {
    myAppBar.actions!.add(IconButton(
        icon: Icon(Icons.menu),
        constraints: BoxConstraints(),
        padding: EdgeInsets.only(right: 30),
        onPressed: () => !_keyScaffold.currentState!.isEndDrawerOpen
            ? _keyScaffold.currentState!.openEndDrawer()
            : null));
    return myAppBar;
  }
}
