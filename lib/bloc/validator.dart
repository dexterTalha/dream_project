import 'dart:async';

class BlocValidator{

  var mobileValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (mobile, sink){
      if(mobile.trim().length == 10){
        sink.add(mobile);
      }else{
        sink.addError("Invalid Mobile Number");
      }
    }
  );

var nameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink){
      if(name.trim().length > 0){
        sink.add(name);
      }else{
        sink.addError("Provide Full Name");
      }
    }
  );

  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains("@")){
        sink.add(email);
      }else{
        sink.addError("Invalid Email");
      }
    }
  );
  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length >= 8){
        sink.add(password);
      }else{
        sink.addError("Password should be minimum 8 characters");
      }
    }
  );
}