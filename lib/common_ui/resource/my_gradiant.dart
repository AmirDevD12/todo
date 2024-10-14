import 'package:flutter/material.dart';
import 'package:todo/common_ui/resource/my_colors.dart';

class MyGradiant {
  static LinearGradient alternative = LinearGradient(
    begin: const Alignment(1.00, 0.03),
    end: const Alignment(-1, -0.03),
    colors: [MyColors.primary.shade500, MyColors.primary.shade600],
  );

  static LinearGradient primary = LinearGradient(
    begin: const Alignment(-1.00, -0.03),
    end: const Alignment(1, 0.03),
    colors: [MyColors.primary.shade500, MyColors.primary.shade600],
  );
}
