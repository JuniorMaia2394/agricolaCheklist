import 'package:flutter/material.dart';

import 'package:cheklist/core/core.dart';

class FormCard extends StatelessWidget {
  final String title;

  const FormCard({
    Key key,    
    this.title,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: AppColors.lightGray,
        width: 200,
        height: 200,
        child: Text(
          this.title,
          style: AppTextStyles.label,
        ),
      ),
    );
  }
}
