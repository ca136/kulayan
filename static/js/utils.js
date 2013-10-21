function echeck(str) {
  var at="@";
  var dot=".";
  var lat=str.indexof(at);
  var lstr=str.length;
  var ldot=str.indexof(dot);

  if (str.indexof(at)==-1){
    alert("Invalid E-mail Address");
    return false;
  }

  if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
    alert("Invalid E-mail Address");
    return false;
  }

  if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
    alert("Invalid E-mail Address");
    return false;
  }

  if (str.indexOf(at,(lat+1))!=-1){
    alert("Invalid E-mail Address");
    return false;
  }

  if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
    alert("Invalid E-mail Address");
    return false;
  }

  if (str.indexOf(dot,(lat+2))==-1){
    alert("Invalid E-mail Address");
    return false;
  }

  if (str.indexOf(" ")!=-1){
    alert("Invalid E-mail Address");
    return false;
  }
};

function validate_contact(form1) {

  if ((document.form1.email.value==null)||(document.form1.email.value=="")) {
    alert("Please enter email");
    document.form1.email.focus();
    return false;
  }

  if (echeck(document.form1.email.value)==false) {
    document.form1.email.value="";
    document.form1.email.focus();
    return false;
  }

  var field = document.form1.number.value;
  var field1 = document.form1.number1.value;

  if(field == '') {
    alert("please enter security code");
    document.form1.number.focus();
    return false;
  }

  if(field != field1) {
    alert("Invalid security code");
    document.form1.number.focus();
    return false;
  }
}

