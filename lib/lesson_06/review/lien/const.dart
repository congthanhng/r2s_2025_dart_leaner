
 class RegexValidator{
   static final  validCharName = RegExp(r'^[a-zA-Z]+$');
   static final  validCharPhone = RegExp(r'^[0-9]+$');
   static final  validCharEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

 }

 class ValidatorMessage{
   static final nameNotEmpty = 'Please enter abc';
   static final nameNotIncludeNumberAndSpecialChar = 'full name không được chứa kí tự đặc biệt và kí tự số';
 }