class InputValidator{


  static bool emailValidator(String email){
    if(email.contains("@") && email.contains(".")){
      return true;
    }
    return false;
  }

  
}