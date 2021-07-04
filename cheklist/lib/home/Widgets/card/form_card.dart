import 'package:cheklist/core/app_colors.dart';
import 'package:cheklist/core/app_text_styles.dart';
import 'package:cheklist/data/tractor_problems.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FormCard extends StatefulWidget {
  final String title;
  final String cardNumber;
  final String image;
  final String status;

  const FormCard(
      {Key key, this.title, this.cardNumber, this.image, this.status})
      : super(key: key);

  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  var _cardBorderColor = AppColors.white;

  var _successBorderColor = AppColors.success;
  var _successButtonBackgroundColor = AppColors.success;

  var _dangerBorderColor = AppColors.danger;
  var _dangerButtonBackgroundColor = AppColors.danger;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: _cardBorderColor,
          width: 2.0,
        ),
      ),
      shadowColor: AppColors.black.withOpacity(1),
      child: Column(
        children: <Widget>[
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.cardNumber,
                style: AppTextStyles.cardNumber,
              ),
            ),
            Flexible(
              child: Text(
                widget.title,
                style: AppTextStyles.label,
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: Container(
              width: 80.w,
              height: 40.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 80,
                    height: 40,
                    child: ElevatedButton(
                      child: Text('OK', style: AppTextStyles.button),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            _successButtonBackgroundColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                            color: _successBorderColor,
                            width: 2.0,
                          ),
                        )),
                      ),
                      onPressed: () {
                        setState(() {
                          tractorProblems[widget.cardNumber]
                              .updateStatus('Ok');
                          _cardBorderColor = AppColors.darkSuccess;
                          _successBorderColor = AppColors.darkSuccess;
                          _successButtonBackgroundColor =
                              AppColors.lightSuccess;
                          _dangerBorderColor = AppColors.lightDanger;
                          _dangerButtonBackgroundColor = AppColors.lightDanger;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    child: Text('DEFEITO', style: AppTextStyles.button),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          _dangerButtonBackgroundColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: _dangerBorderColor,
                          width: 2.0,
                        ),
                      )),
                    ),
                    onPressed: () {
                      setState(() {
                        tractorProblems[widget.cardNumber]
                            .updateStatus('Defeito');
                        _cardBorderColor = AppColors.darkDanger;
                        _successBorderColor = AppColors.lightSuccess;
                        _successButtonBackgroundColor = AppColors.lightSuccess;
                        _dangerBorderColor = AppColors.darkDanger;
                        _dangerButtonBackgroundColor = AppColors.lightDanger;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
