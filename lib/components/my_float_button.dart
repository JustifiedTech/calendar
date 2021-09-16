import '../config/import.dart';

class MyFLoatButton extends StatefulWidget {
  @override
  _MyFLoatButtonState createState() => _MyFLoatButtonState();
}

class _MyFLoatButtonState extends State<MyFLoatButton> with SingleTickerProviderStateMixin {

 late  AnimationController animationController;
 late Animation degOneTranslationAnimation,degTwoTranslationAnimation,degThreeTranslationAnimation;
 late  Animation rotationAnimation;


  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.2,end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.4,end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.75,end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0,end: 0.0).animate(CurvedAnimation(parent: animationController
        , curve: Curves.easeOut));
    super.initState();
    animationController.addListener((){
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) => Positioned(
                right: 30,
                bottom: 30,
                child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                IgnorePointer(
                    child: Container(
                    color: Colors.transparent,
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(270),degOneTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degOneTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: kSecondaryColor,
                      width: 50,
                      height: 50,
                      icon: Icon(
                        Icons.add_task_outlined,
                        color: Colors.white,
                      ),
                      onClick: (){
                        print('First Button');
                      },
                    ),
                  ),
                ),

                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(180),degThreeTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degThreeTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.orangeAccent,
                      width: 50,
                      height: 50,
                      icon: Icon(
                        Icons.alarm_add,
                        color: Colors.white,
                      ),
                      onClick: (){
                        print('Third Button');
                      },
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: kAccentColor,
                    width: 60,
                    height: 60,
                    icon: Icon(
                                            Icons.add_rounded,
                      color: Colors.white,
                    ),
                    onClick: (){
                      if (animationController.isCompleted) {
                        animationController.reverse();
                      } else {
                        animationController.forward();
                      }
                    },
                  ),
                )

              ],
            ));


}


