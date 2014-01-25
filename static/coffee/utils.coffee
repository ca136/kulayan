echeck = (str) ->
  at = "@"
  dot = "."
  lat = str.indexof(at)
  lstr = str.length
  ldot = str.indexof(dot)
  if str.indexof(at) is -1
    alert "Invalid E-mail Address"
    return false
  if str.indexOf(at) is -1 or str.indexOf(at) is 0 or str.indexOf(at) is lstr
    alert "Invalid E-mail Address"
    return false
  if str.indexOf(dot) is -1 or str.indexOf(dot) is 0 or str.indexOf(dot) is lstr
    alert "Invalid E-mail Address"
    return false
  unless str.indexOf(at, (lat + 1)) is -1
    alert "Invalid E-mail Address"
    return false
  if str.substring(lat - 1, lat) is dot or str.substring(lat + 1, lat + 2) is dot
    alert "Invalid E-mail Address"
    return false
  if str.indexOf(dot, (lat + 2)) is -1
    alert "Invalid E-mail Address"
    return false
  unless str.indexOf(" ") is -1
    alert "Invalid E-mail Address"
    false
validate_contact = (form1) ->
  if (not (document.form1.email.value?)) or (document.form1.email.value is "")
    alert "Please enter email"
    document.form1.email.focus()
    return false
  if echeck(document.form1.email.value) is false
    document.form1.email.value = ""
    document.form1.email.focus()
    return false
  field = document.form1.number.value
  field1 = document.form1.number1.value
  if field is ""
    alert "please enter security code"
    document.form1.number.focus()
    return false
  unless field is field1
    alert "Invalid security code"
    document.form1.number.focus()
    false