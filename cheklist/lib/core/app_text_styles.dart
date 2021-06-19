import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle navTitle = GoogleFonts.inter(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle title = GoogleFonts.inter(
    color: AppColors.font,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle label = GoogleFonts.inter(
    color: AppColors.font,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  
  static final TextStyle cardNumber = GoogleFonts.inter(
    color: AppColors.darkPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle splashScreen = GoogleFonts.inter(
    color: AppColors.white,
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );

}