import 'package:clean_architecture_projct/presentation/on_boarding/view_model/on_boarding_view_model.dart';
import 'package:clean_architecture_projct/presentation/resources/color_manager.dart';
import 'package:clean_architecture_projct/presentation/resources/constants_manager.dart';
import 'package:clean_architecture_projct/presentation/resources/routes_manager.dart';
import 'package:clean_architecture_projct/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/models.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
final PageController _pageController = PageController();
final OnBoardingViewModel _viewModel = OnBoardingViewModel();

_bind (){
  _viewModel.start();
}
@override
  void initState() {
    _bind();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject){
  if (sliderViewObject == null){
    return Container();
  }
  else
   {

  return  Scaffold(
    appBar:  AppBar(
      backgroundColor: ColorManager.white,
      elevation: AppSize.s0,
      systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark
      ),
    ),
    backgroundColor: ColorManager.white,
    body: PageView.builder(
        onPageChanged: (index) {
        _viewModel.onPageChanged(index);
        },
        controller: _pageController ,
        itemCount: sliderViewObject.numOfSlides,
        itemBuilder: (context , index ) {
          // on boarding view .....
          return OnBoardingPage( sliderViewObject.sliderObject);
        }
    ),
    bottomSheet: Container(
      color: ColorManager.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutesManager.loginRoute);
              },
              child: Text(AppStrings.skip ,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleMedium,
              ),

            )       ,

          ),
          _getBottomSheetWidget (sliderViewObject),
        ],
      ),
    ),
  );
  }}



  Widget _getBottomSheetWidget (SliderViewObject sliderViewObject){
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: (){
                _pageController.animateToPage(_viewModel.goPrevious(), duration: Duration(milliseconds: AppConstants.sliderAnimationTime), curve: Curves.bounceIn);
              },
            ),
          ),
          Row(
            children: [
              for(int i =0 ; i< sliderViewObject.numOfSlides; i++)
                Padding(padding: EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i,sliderViewObject.currentIndex),
                )
            ],
          ),


          Padding(padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
              onTap: (){
                _pageController.animateToPage(_viewModel.goNext(), duration: Duration(milliseconds: AppConstants.sliderAnimationTime), curve: Curves.bounceIn);
              },

            ),
          ),

        ],
      ),
    );
  }



  Widget _getProperCircle (int index, int  currentIndex){
    if (index == currentIndex){
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
    else return  SvgPicture.asset(ImageAssets.hollowCircleIc);
    }
@override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

}

class OnBoardingPage extends StatelessWidget {
  final  SliderObject _sliderObject;
  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: AppSize.s20,),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.title,
            textAlign: TextAlign.center,
            style:Theme.of(context).textTheme.displayLarge
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.subtitle,
            textAlign: TextAlign.center,
            style:Theme.of(context).textTheme.headlineMedium
          ),

        ),
        const SizedBox(height: AppSize.s60,),
        SvgPicture.asset(_sliderObject.image),
      ],

    );
  }
}

