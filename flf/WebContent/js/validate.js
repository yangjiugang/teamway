/**
*	validate methods	
*   
*   created by eddy song
*   version 1.0
*/

/* to check if the input value is composed of number and dot */
function checkIsNum(Str){
   Str=""+Str;
   RegularExp=/^\d+(\.\d+)?$/;
   if (RegularExp.test(Str)) {
   	 return true;
   }
   else {
      return false;
   }	
}	

/* to check if the input value is a composed of number and char value */
function checkIsNumOrStr(Str){
    Str=""+Str;
    RegularExp=/^[A-Za-z0-9]+$/;
    if (RegularExp.test(Str)) {
        return true;
    }
    else {
        return false;
    }	
}

/* to check if the input value is a percentage value */
function checkIsPercentage(Str){
   Str=""+Str;
   RegularExp=/^(\d|[1-9]\d|100)%$/;
   if (RegularExp.test(Str)) {
   	 return true;
   }
   else {
      return false;
   }	
}

/* to check if the input value is a integer which is bigger than zero*/
function checkIsBiggerThanZero(Str){
   Str=""+Str;
   RegularExp=/^[0-9]*[1-9][0-9]*$/;
   if (RegularExp.test(Str)) {
   	 return true;
   }
   else {
      return false;
   }	
}

/* to check if the input value is a integer */
function checkIsInteger(Str){
   Str=""+Str;
   RegularExp=/^[0-9]+$/;
   if (RegularExp.test(Str)) {
   	 return true;
   }
   else {
      return false;
   }	
}

/* to check if the input value is a integer */
function checkIsTelNumber(Str){
   Str=""+Str;
   RegularExp=/^[0-9\(\)\-]+$/;
   if (RegularExp.test(Str)) {
   	 return true;
   }
   else {
      return false;
   }	
}

/* to check if the input value is a correct email format */
function checkIsEmail(Str){
   Str=""+Str;
   RegularExp=/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
   if (RegularExp.test(Str)) {
   	 return true;
   }
   else {
      return false;
   }	
}

/* to check if the input date is a formated(YYYY-MM-DD) date, support YYYY-M-D and leap year date */
function checkIsFormatDate(Str){
   Str=""+Str;
   RegularExp=/^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/;
   if (RegularExp.test(Str)) {
   	 return true;
   }
   else {
      return false;
   }	
}
function chenkIsCharacter(Str){
	Str=""+Str;
	RegularExp=/^[A-Za-z0-9\u4e00-\u9fa5]+$/;
	if (RegularExp.test(Str)) {
   	 return true;
   }
   else {
      return false;
   }	
}
