import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _circleController;
  late AnimationController _textController;

  late Animation<double> _circleScale;
  late Animation<double> _circleOpacity;

  @override
  void initState() {
    super.initState();

    // Circle animation
    _circleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    // Text animation
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _circleScale = Tween<double>(begin: 0.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _circleController,
        curve: Curves.easeOutBack,
      ),
    );

    _circleOpacity = Tween<double>(begin: 0.8, end: 0.0).animate(
      CurvedAnimation(
        parent: _circleController,
        curve: Curves.easeOut,
      ),
    );

    startAnimation();

    // Move to next page after 1 minute
    Future.delayed(const Duration(seconds: 30), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NextScreen(),
          ),
        );
      }
    });
  }

  Future<void> startAnimation() async {
    await _circleController.forward();

    await Future.delayed(const Duration(milliseconds: 200));

    _textController.forward();
  }

  @override
  void dispose() {
    _circleController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const text = "Eventro.";

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Animated Circle
            AnimatedBuilder(
              animation: _circleController,
              builder: (context, child) {
                return Opacity(
                  opacity: _circleOpacity.value,
                  child: Transform.scale(
                    scale: _circleScale.value,
                    child: Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xffDFF1E2).withOpacity(0.15),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Animated Letters
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                text.length,
                (index) {
                  final start = index * 0.08;
                  final end = start + 0.4;

                  final animation = Tween<Offset>(
                    begin: const Offset(-2, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: _textController,
                      curve: Interval(
                        start.clamp(0.0, 1.0),
                        end.clamp(0.0, 1.0),
                        curve: Curves.easeOut,
                      ),
                    ),
                  );

                  final opacityAnimation = Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(
                    CurvedAnimation(
                      parent: _textController,
                      curve: Interval(
                        start.clamp(0.0, 1.0),
                        end.clamp(0.0, 1.0),
                        curve: Curves.easeIn,
                      ),
                    ),
                  );

                  return AnimatedBuilder(
                    animation: _textController,
                    builder: (context, child) {
                      return Opacity(
                        opacity: opacityAnimation.value,
                        child: Transform.translate(
                          offset: Offset(
                            animation.value.dx * 40,
                            0,
                          ),
                          child: Text(
                            text[index],
                            style: const TextStyle(
                              fontSize: 52,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffDFF1E2),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Next Page",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}