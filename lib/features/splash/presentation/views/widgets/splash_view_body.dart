import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  void initSlidingAnimation(){
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 1),
    );
    slidingAnimation = Tween<Offset>(begin: const Offset(0,10), end: Offset.zero).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2),(){
      //Get.to(()=> const HomeView(), transition: Transition.fade, duration: kTransitionDuration);
      GoRouter.of(context).push('/homeView');
    });
  }

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 4),
        SlidingText(slidingAnimation: slidingAnimation,),
      ],
    );
  }
}