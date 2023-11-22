import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_talantix/app/utils.dart';
import 'package:test_talantix/features/presentation/blocs/main/main_cubit.dart';
import 'package:test_talantix/features/presentation/widgets/bottom_switches_container.dart';
import 'package:test_talantix/features/presentation/widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: BlocListener<MainCubit, MainState>(
        listener: (context, state) {
          if (state.mainStatus == MainStatus.error) {
            showTextDialog(context, state.errorMessage);
          }
        },
        child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              if (state.mainStatus == MainStatus.success) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: PageView(
                        controller: pageController,
                        children: [
                          for (var user in state.users)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              child: UserCard(user: user),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        ),
      ),
      bottomNavigationBar: BottomSwitchesContainer(
        onPrev: () {
          pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        onNext: () {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
