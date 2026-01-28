import 'package:flutter/material.dart';
import 'package:mina_resume/widgets/footer/footer.dart';
import 'package:mina_resume/widgets/how_it_works/how_it_works.dart';
import 'package:mina_resume/widgets/landing_banner/landing_banner.dart';
import 'package:mina_resume/widgets/navbar/navbar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Color(0xfffafafa),
          appBar: navBar(),
          body: Scrollbar(
            controller: scrollController,
            trackVisibility: true,

            thickness: 15.0,
            radius: Radius.circular(2),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // banner
                  LandingBanner(constraints: constraints),

                  Container(height: 2, color: Colors.grey.shade100),

                  // how it works
                  HowItWorks(constraints: constraints),

                  // footer
                  LandingFooter(constraints: constraints,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
