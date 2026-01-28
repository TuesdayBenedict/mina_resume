import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mina_resume/models/how_it_works_model.dart';

class HowItWorks extends StatelessWidget {
  const HowItWorks({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final width = constraints.maxWidth;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Column(
        crossAxisAlignment: width < 768
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          // heading
          Column(
            crossAxisAlignment: width < 768
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,

            children: [
              // banner info
              Text(
                'How it works',
                style: GoogleFonts.inter(
                  fontSize: width < 500 ? 25 : 35,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff0d131c),
                  height: 0,
                ),
                textAlign: width < 768 ? TextAlign.center : TextAlign.start,
              ),
              const SizedBox(height: 10),
              Text(
                'Three simple steps to a professional portfolio.',
                style: GoogleFonts.inter(
                  fontSize: width < 500 ? 15 : 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff666f9c),
                ),
                textAlign: width < 768 ? TextAlign.center : TextAlign.start,
              ),
            ],
          ),
          const SizedBox(height: 50),

          // list of items
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: constraints.maxWidth < 600
                ? 1 // Mobile
                : constraints.maxWidth < 1100
                ? 2 // Tablet / Small Web
                : 3, // Large Web
            mainAxisSpacing: 24,
            crossAxisSpacing: 40,
            itemCount: HowItWorksModel.items.length,
            itemBuilder: (context, index) {
              final item = HowItWorksModel.items[index];

              return Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xffebf2fe),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        item.icon,
                        size: 28,
                        color: const Color(0xff3d84f5),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Title
                    Text(
                      "${index + 1}. ${item.title}",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff0d131c),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Description
                    Text(
                      item.description,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff666f9c),
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
