import 'package:flutter/material.dart';

class CustomLoadingButton extends StatefulWidget {
  final String buttonText;
  final double width;
  final double height;
  final IconData iconAfterComplete;
  final Color textColor;
  final Color beginBackgroundColor;
  final Color endBackgroundColor;
  final Color iconColor;
  final Color borderColor;

  CustomLoadingButton({
    Key key,
    @required this.buttonText,
    this.height = 40.0,
    this.width = 250.0,
    this.iconAfterComplete = Icons.check,
    this.textColor = const Color(0xFFFFFFFF),
    @required this.beginBackgroundColor,
    this.endBackgroundColor = const Color(0xFF607D8B),
    this.iconColor = const Color(0xFFFFFFFF),
    this.borderColor = const Color(0x42000000),
  })  : // Minimum size for [CircularProgressIndicator] to fit in [CircleBorder]
        //is 75.0 width, 40.0 height (after first tests), so we don't want to break animation
        assert(width >= 75.0 && height >= 40.0),
        super(key: key);

  @override
  _CustomLoadingButtonState createState() => _CustomLoadingButtonState();
}

class _CustomLoadingButtonState extends State<CustomLoadingButton>
    with TickerProviderStateMixin {
  /// Used to perform animation on this [Button]
  AnimationController animationController;

  /// Used to manipulate width value for this [Button]
  Animation<double> widthAnimation;

  /// Used to manipulate [backgroundColor] value for this [Button]
  /// TODO add support for a third Color -if wanted by user- that could be used when Icon is shown.
  Animation<Color> backgroundColorAnimation;

  /// Used to track whether this button is collapsed or not
  bool _isCollapsed = false;

  /// Used to manipulate the [Border] that is applied to this [Button]
  ShapeBorder _shapeBorder;

  /// Used to manipulate the child of this [Button]
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
    backgroundColorAnimation = ColorTween(
      begin: widget.beginBackgroundColor,
      //if [endBackgroundColor] is not set, use [beginBackgroundColor] as default.
      end: widget.endBackgroundColor ?? widget.beginBackgroundColor,
    ).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    widthAnimation = Tween<double>(
      begin: widget.width,
      end: 75.0,
    ).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //After animation is completed I wanted to add an icon, direct implementation is to wait 2sec and then set the state of child Widget
          Future.delayed(Duration(seconds: 2)).then((value) {
            setState(() {
              if (_isCollapsed)
                child = Icon(
                  widget.iconAfterComplete,
                  color: widget.iconColor,
                );
            });
          });
        }
      });
    _shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        style: BorderStyle.solid,
        color: widget.borderColor,
        width: 1.0,
      ),
    );
    child = Text(
      widget.buttonText,
      softWrap: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeIn,
      width: widthAnimation.value,
      height: widget.height,
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
                    color: widget.borderColor,
                    width: 1.0,
                  ),
                );
                //Also waiting to shift child, so Text is not truncated too long
                child = Text(
                  widget.buttonText,
                  softWrap: false,
                );
              });
            } else {
              animationController.forward();
              _shapeBorder = CircleBorder(
                side: BorderSide(
                  color: widget.borderColor,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
              );
              child = CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  widget.borderColor,
                ),
                strokeWidth: 3.0,
              );
            }
            _isCollapsed = !_isCollapsed;
          });
        },
        color: backgroundColorAnimation.value,
        elevation: 2.0,
        focusElevation: 1.0,
        shape: _shapeBorder,
        textColor: widget.textColor,
        child: child,
      ),
    );
  }
}
