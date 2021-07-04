import 'package:cheklist/core/app_colors.dart';
import 'package:cheklist/core/core.dart';
import 'package:cheklist/home/Widgets/button/pdf_button.dart';
import 'package:cheklist/home/Widgets/button/xls_button.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {

  final String fieldName;
  final String fieldTractorIdentification;

  const CustomDialog({
    Key key,   
    @required this.fieldName,
    @required this.fieldTractorIdentification
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
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
                        "Escolha qual formato de arquivo \ndeseja gerar",
                        style: AppTextStyles.dialog
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
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Icon(
                                        Icons.list_alt_sharp,
                                        color: AppColors.white
                                      ),
                                    ),
                                    XlsButton(
                                      label: 'Planilha',
                                      fileName: 'revisao',
                                      fieldName: this.fieldName,
                                      fieldTractorIdentification: this.fieldTractorIdentification,
                                    )
                                  ],  
                                )
                              ],
                            ),        
                          ),
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
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Icon(
                                        Icons.article,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    PdfButton(
                                      label: 'PDF', 
                                      fileName: 'revisao',
                                      fieldName: this.fieldName,
                                      fieldTractorIdentification: this.fieldTractorIdentification
                                    ),
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