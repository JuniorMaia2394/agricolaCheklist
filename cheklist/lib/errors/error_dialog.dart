import 'package:cheklist/core/app_colors.dart';
import 'package:cheklist/core/core.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String errorMessage;

  const ErrorDialog({
    Key key,
    this.errorMessage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

Widget dialogContent(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 0.0,right: 0.0),
    child: Stack(
        children: <Widget>[
        Container(
            padding: EdgeInsets.only(
            top: 18.0,
            ),
            margin: EdgeInsets.only(top: 13.0,right: 8.0),
            decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                ),
                ]
            ),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                SizedBox(
                height: 20.0,
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        this.errorMessage,
                        style: AppTextStyles.errorDialog
                      ),
                    )
                ),
                SizedBox(height: 24.0),
                InkWell(
                  child: Container(
                      padding: EdgeInsets.only(top: 15.0,bottom:15.0),
                      decoration: BoxDecoration(
                        color:AppColors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Container(
                                    color: AppColors.primary,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.all(12.0),
                                        primary: AppColors.white,
                                        textStyle: const TextStyle(fontSize: 20),
                                      ),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Ok'),
                                    )
                                  ],  
                                )
                              ],
                            ),
                          ),
                        ],
                  ),
                ),
                onTap:(){
                    Navigator.pop(context);
                },
                )
            ],
            ),
        ),
        Positioned(
            right: 0.0,
            child: GestureDetector(
            onTap: (){
                Navigator.of(context).pop();
            },
            child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 16.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, color: Colors.red),
                ),
            ),
            ),
        ),
        ],
    ),
  );
}
}