import 'package:flutter/material.dart';

class CustomLoadingButton extends StatefulWidget {
  CustomLoadingButton({
    Key key,
  }) : super(key: key);

  @override
  _CustomLoadingButtonState createState() => _CustomLoadingButtonState();
}

class _CustomLoadingButtonState extends State<CustomLoadingButton>
    with TickerProviderStateMixin {
  /// Used to perform animation on this Button
  AnimationController animationController;

  /// Used to manipulate width value for our Button
  Animation<double> widthAnimation;

  /// Used to track whether this button is collapsed or not
  bool _isCollapsed = false;

  /// Used to manipulate the border that is applied to this Button
  ShapeBorder _shapeBorder;

  /// Used to manipulate the child of this button
  Widget child;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(
        milliseconds: 250,
      ),
      vsync: this,
    );
    widthAnimation = Tween<double>(
      begin: 250.0,
      end: 75.0,
    ).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //After animation is completed I wanted to add a Check icon, direct implementation is to wait 2sec and then set the state of child Widget
          Future.delayed(Duration(seconds: 2)).then((value) {
            setState(() => child = Icon(
                  Icons.check,
                  color: Colors.brown[25], //Don't ask me why this color :D
                ));
          });
        }
      });
    _shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        style: BorderStyle.solid,
        color: Colors.black26,
        width: 1.0,
      ),
    );
    child = Text(
      'My button is awesome',
      softWrap: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeIn,
      width: widthAnimation.value,
      constraints: BoxConstraints(
        maxHeight: 50.0,
      ),
      height: 40.0,
      child: RaisedButton(
        onPressed: () {
          setState(() {
            if (_isCollapsed) {
              animationController.reverse();
              Future.delayed(
                Duration(
                  milliseconds: 230,
                ),
              ).then((result) {
                //Waiting just before the Animation.dismissed to avoid weird effect when switching _shapeBorder
                _shapeBorder = RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.black26,
                    width: 1.0,
                  ),
                );
                //Also waiting to shift child, so Text is not truncated too long
                child = Text(
                  'My button is awesome',
                  softWrap: false,
                );
              });
            } else {
              animationController.forward();
              _shapeBorder = CircleBorder(
                side: BorderSide(
                  color: Colors.black26,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
              );
              child = CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.black45,
                ),
                strokeWidth: 3.0,
              );
            }
            _isCollapsed = !_isCollapsed;
          });
        },
        color: Colors.blueGrey,
        elevation: 2.0,
        focusElevation: 1.0,
        shape: _shapeBorder,
        textColor: Colors.brown[25],
        child: child,
      ),
    );
  }
}
