// onBoarding models
class SliderObject {
  String title ;
  String subtitle ;
  String image ;
  SliderObject(this.image, this.title , this.subtitle);

}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject,this.numOfSlides,this.currentIndex,);
}

// login models

class Customer {
  String id ;
  String name ;
  int numOfNotifications;
  Customer(this.numOfNotifications,this.name, this.id);
}
class Contacts {
  String phone ;
  String email ;
  String link;
  Contacts(this.phone, this.link , this.email);

}


class Authentication {
  Customer? customer;
  Contacts? contacts;
  Authentication(this.contacts , this.customer);

}