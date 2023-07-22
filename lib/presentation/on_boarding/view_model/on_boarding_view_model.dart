import 'dart:async';

import 'package:clean_architecture_projct/domain/models.dart';
import 'package:clean_architecture_projct/presentation/base/base_view_model.dart';

import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs
{
  // stream controllers Outputs
final StreamController _streamController = StreamController<SliderViewObject>();
int _currentIndex = 0 ;
late final List<SliderObject> _list;
  // onBoardingViewModel Inputs
  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }

  @override
  void start() {
    // TODO: viewModel start new job
    _list = _getSlideObject();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex >= _list.length){
      nextIndex == 0;
    }
    return nextIndex;
  }

  @override
 int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex <= 0 ){
      previousIndex == _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
  _currentIndex = index;
  _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);
 // onBoarding private function
  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
List<SliderObject> _getSlideObject () => [
  SliderObject(ImageAssets.onBoardingLogo1, AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1),
  SliderObject(ImageAssets.onBoardingLogo2, AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2),
  SliderObject(ImageAssets.onBoardingLogo3, AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3),
  SliderObject(ImageAssets.onBoardingLogo4, AppStrings.onBoardingTitle4, AppStrings.onBoardingSubTitle4),
];




}

abstract class OnBoardingViewModelInputs{
int goNext();
int goPrevious();
void onPageChanged(int index);

// stream controller input
Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs{

// stream controller output
Stream<SliderViewObject> get outputSliderViewObject;
}
