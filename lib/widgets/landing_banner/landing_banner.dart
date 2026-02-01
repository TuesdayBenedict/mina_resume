import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mina_resume/controllers/create_controller.dart';

class LandingBanner extends StatelessWidget {
  const LandingBanner({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateController>();

    final width = constraints.maxWidth;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width < 768 ? 20 : 50,
        vertical: 100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 750),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // banner info
                  Text(
                    'Transform your Resume \n Into a Portfolio',
                    style: GoogleFonts.inter(
                      fontSize: width < 500
                          ? 45
                          : width < 800
                          ? 50
                          : 60,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff0d131c),
                      height: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Text(
                      'Power your profesional presence with AI. Turn static documents into dynamic, hosted websites in seconds.',
                      style: GoogleFonts.inter(
                        fontSize: width < 500 ? 15 : 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff666f9c),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Obx(() {
                    final response = controller.response.value;

                    return ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 600),
                      child: SelectableText(
                        response.isEmpty ? 'Waiting for response...' : response,
                        style: GoogleFonts.inter(
                          fontSize: width < 500 ? 15 : 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff666f9c),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),

          // search input
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                12,
              ), // Optional: rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                    0.1,
                  ), // Shadow color and transparency
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ), //
                  ),
                  padding: const EdgeInsets.all(35),
                  child: TextField(
                    controller: controller.prompt,
                    decoration: InputDecoration.collapsed(
                      hintText:
                          'Paste your professional experience, education, and skills here...',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        color: Color(0xFFC5C6C8),
                      ),
                    ),
                    maxLines: 6,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 58, 58, 58),
                    ),
                  ),
                ),
                Container(height: 2, color: Colors.grey.shade100),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xfffbfcfd),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 25,
                  ),
                  child: width < 768
                      ? Column(
                          children: [
                            selectFile(),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: createPortfolioButton(),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [selectFile(), createPortfolioButton()],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox createPortfolioButton() {
    final controller = Get.find<CreateController>();

    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () => controller.parseResumeWithGemini(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff3d84f5),
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Create Portfolio',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  ElevatedButton selectFile() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
      ),
      child: Row(
        children: [
          DottedBorder(
            options: CircularDottedBorderOptions(
              padding: EdgeInsets.all(15),
              color: Color(0xffced8e8),
              strokeWidth: 2,
              dashPattern: [
                8,
                4,
              ], // Pattern of dashes and spaces (8px dash, 4px space)
            ),
            child: ClipRRect(
              // Clip the child to match the rounded corners
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Icon(Icons.add, size: 25, color: Color(0xff9ba9bd)),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            'Upload PDF',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xff64748b),
            ),
          ),
        ],
      ),
    );
  }
}
