
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/componet/custom_app_bar.dart';
import 'package:lobor/home/presentation/pages/history_screen.dart';
import 'package:lobor/process/presentation/manager/process_controller.dart';
import 'package:provider/provider.dart';
import '../../../empty_state/massage_alert.dart';
import '../../../helper/componet/drop_down_btn.dart';
import '../../../helper/constant.dart';
import '../widgets/date_picker.dart';
import '../widgets/services_list.dart';
List<String> saudiArabianCities = [
  'Riyadh',
  'Jeddah',
  'Makkah',
  'Madinah',
  'Dammam',
];
List<String> saudiArabianWorker = [
  'Indian',
  'Pakistani',
  'Bangladeshi',
  'Filipino',
  'Indonesian',
  'kenya'
];
List<String>month=[
  '1', '2', '3','4', '5', '6', '7', '8', '9', '10', '11', '12'
];

class ProcessSelector extends StatefulWidget {
  const ProcessSelector({Key? key}) : super(key: key);
  static final route ="/ProcessSelector";
  @override
  _ProcessSelectorState createState() => _ProcessSelectorState();
}

class _ProcessSelectorState extends State<ProcessSelector> {

  int _activeCurrentStep = 0;
     DateTime date=DateTime.now() ;


  List<Step> stepList (String title,data) => [
    Step(
      state: _activeCurrentStep <= 0 ? StepState.indexed : StepState.indexed,
      isActive: _activeCurrentStep >= 0,
      title:  Text(data.step),
      content: Container(
        color: AppColor.gray50,
        child: Column(
          children: [
            DropdownItem(DropDawnList: month,),
            SizedBox(
              height: 20.sp,
            ),
            DropdownItem(DropDawnList: saudiArabianCities,),
             SizedBox(
              height: 20.sp,
            ),
            DropdownItem(DropDawnList:saudiArabianWorker ,),

          ],
        ),
      ),
    ),
    Step(
        state:
        _activeCurrentStep <= 1 ? StepState.indexed : StepState.indexed,
        isActive: _activeCurrentStep >= 1,
        title:   Text(data.step),
        content: Container(
          color: AppColor.gray50,
          child:  AllServicesItem(serviceType:title,),
        )),
    Step(
        state: StepState.indexed,
        isActive: _activeCurrentStep >= 2,
        title:  Text(data.step),
        content: Container(
          color: AppColor.gray50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(data.select_date),
                DatePickerWidget(selectedValue:date,),
              ],
            )))
  ];

  @override
  Widget build(BuildContext context) {
    var data = AppLocalizations.of(context)!;
    var provide=  Provider.of<ProcessController>(context);
    final Map<String, dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final int receivedIndex = arguments!['index'];
    final String title = arguments!['title'];
    final String image = arguments!['image'];
    return Scaffold(
      appBar:CustomAppBar(
        height: 140.sp,
        actions: [
          IconButton(onPressed:(){
            Navigator.of(context).pop();
          }, icon:Icon(Icons.arrow_forward_outlined,color: Colors.black,))
        ],
      ),
      // Here we have initialized the stepper widget
      body: Hero(
        tag: receivedIndex!,
        child: Container(
          height:double.infinity,
          width: double.infinity,
          color: AppColor.gray50,
          child: Stepper(
            elevation: 0,
        type: StepperType.horizontal,
        currentStep: _activeCurrentStep,
        steps: stepList(title,data),
        // onStepContinue takes us to the next step
        onStepContinue: () {
          if (_activeCurrentStep < (stepList(title,data).length - 1)) {
            setState(() {
              _activeCurrentStep += 1;
            });
          }
         if (_activeCurrentStep==2)asyncConfirmDialog(context,
             text: 'done', onPreesed: () async {
           await provide.addOrder(provide.CompanyId, date);
           Navigator.pushNamed(context, HistoryScreen.route);
         });
        },
           controlsBuilder:  (BuildContext context,ControlsDetails) {
             return Row(
               children: [
                 SizedBox(height:400.sp,),
                 ElevatedButton(
                   onPressed: ControlsDetails.onStepContinue,
                   style: ElevatedButton.styleFrom(
                     fixedSize:Size(400.sp,60.sp),
                     primary: AppColor.green400, // Change to the desired green color
                   ),
                   child: Text(data.next_btn),
                 ),
               ],
             );
           },
        // onStepCancel takes us to the previous step
              onStepCancel: null,

        // onStepTap allows to directly click on the particular step we want
        onStepTapped: (int index)  {
          setState(()  {
            _activeCurrentStep = index;

          });

        },

      ),),),
    );

  }


}
