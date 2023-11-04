

abstract class CustomString{

  static const String firstText = "Dining and Delivery\nRestaurant App";
  static const String selectionFoodsText = "Diverse selection of foods!";
  static const String skip = "skip";
  static const String next = "Next";
  static const String istanbul = "ISTANBUL";
  static const String istanbulRestaurant = "Istanbul Restaurant";

  static const String ourRestaurant = "Our restaurant serves a wide variety of cuisines";
  static const String seatSelection = "Use the app reserve your favourite seat";
  static const String appUseSelectRestaurant = "Select a date and reserve a seat in the restaurant";
  static const String homeDelivery = "Home delivery available";
  static const String contactFree = "We provider a contact-free home delivery service.";

  static const String signUp = "Sign Up";
  static const String signIn = "Sign In";
  static const String email = "Email";
  static const String name = "Name";
  static const String passwordMessage = "You entered the password incorrectly, try again";
  static const String confirmMessage = "You entered the confirm incorrectly, try again";
  static const String nameMessage = "You entered the name incorrectly, try again,exp: Tursunxon";
  static const String notLogin = "No login or password available, try again";
  static const String emailMessage = "You entered the email incorrectly, try again exp: bekzod@gmail.com";
  static const String somethingError = "Something error, try again later";
  static const String accountServerError = "This account exists on the server";

  static const String invalidValueEmail = "Invalid email";
  static const String invalidValuePass = "Invalid password";
  static const String invalidValueName = "Invalid name";
  static const String invalidValuePrePass = "Invalid confirm password";

  static const String password = "Password";
  static const String prePassword = "Confirm password";
  static const String getStarted = "Get started";
  static const String or = "or";
  static const String google = "Sign Up with Google";
  static const String already = "Already have an account? ";
  static const String dontHaveAccount = "Don't have an account? ";
  static const String logIn = "Log in";
  static const String search = "Search";

  static const String checkData = "Please check your data!!!";
  static const String userLogOut = "User log out success";

  /// #BottomNaigationButton text

 static const String home = "Home";
 static const String about = "About";
 static const String map = "Map";
 static const String cart = "Cart";
 static const String history = "History";

 /// Detail page Strings
 static const String desc = "Description";
 static const String category = "Category";
 static const String price = "Price";

 /// OrderPage Strings

static const String phone = "91 123 45 67";
static const String calendar = "Deta";
static const String time = "Time";
static const String personAdd = "Person Count";
static const String nameFamily= "Name";
static const String addNumberPeople = "Add the number of people,exp: 1 - 100";
static const String addNumberMessage = "You entered the wrong number, please try again. exm: 91 123 45 67";
static const String forgetPasswordText = "Forgot password ?";
static const String forgotPasswordAppBar = "Forgot password";
static const String fieldEmpty = "Sorry, some fields are empty, please fill them";
static const String nameOrPerson = "Sorry, there was an error entering your name or number of people,exp: name: Maxmudov Ibroxim, person add 1 - 100";
static const List<String> timeList = [
  "09:00",
  "10:00",
  "11:00",
  "12:00",
  "13:00",
  "14:00",
  "15:00",
  "16:00",
  "17:00",
  "18:00",
  "19:00",
  "20:00",
  "21:00",
  "22:00",
  "23:00",
  "00:00",
];
  static const String location = "Toshkent, Mirobod koʻchasi, 35";
  static const String allDaysOfWeek = "09:00 - 23:00, All days of week";
  static const String phoneNumber = "+998 71 252 67 67";
  static const String instagramUrl = "https://www.instagram.com/istanbul_restaurant_tashkent/";
  static const String facebookUrl = "https://www.facebook.com/people/istanbul_restaurant_tashkent/100054338868679/";
  static const String telegramUrl = "https://t.me/istanbul_restaurant_tashkent";
  static const String mapUrl = "https://www.google.com/maps/place/%22Istanbul%22+Turkish+Restaurant/@41.3401496,69.0929724,10.64z/data=!4m6!3m5!1s0x38ae8ac4990137ef:0xeedc112d020fe667!8m2!3d41.2941167!4d69.2705623!16s%2Fg%2F11hbt_9q2k?entry=ttu";
}

enum CategoryEnum{
  food("Foods"),
  salad("Salad"),
  dessert("Dessert"),
  drink("Drink");
 const CategoryEnum(this.category);
 final String category;
}