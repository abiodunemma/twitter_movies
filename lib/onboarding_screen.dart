import 'package:flutter/material.dart';
import 'Auth/register.dart';


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

    _circleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

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
      body: Stack(
        children: [
         
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            width: double.infinity,
            child: Image.asset(
              'assets/images/onboarding.jpg', 
              fit: BoxFit.cover,
            ),
          ),

         
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black54,
                  Colors.black,
                  Colors.black,
                ],
                stops: [0.45, 0.65, 0.85, 1.0],
              ),
            ),
          ),

          // TEXT
          Positioned(
            bottom: 120,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                   
                    AnimatedBuilder(
                      animation: _circleController,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _circleOpacity.value,
                          child: Transform.scale(
                            scale: _circleScale.value,
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffDFF1E2)
                                    .withOpacity(0.15),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    
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

               

                // SUBTEXT
             
            SizedBox(
  width: double.infinity,
  
  child: ElevatedButton(
    
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
   child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [
    Text(
      'Create account',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

    SizedBox(width: 10),

    Icon(
      Icons.arrow_forward,
      color: Colors.black,
    ),
  ],
),
  ),
            ),
            



              const SizedBox(height: 20),

              SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                child: const Text('Sign in',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 18,
                ),
                ),
              )
              ),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}