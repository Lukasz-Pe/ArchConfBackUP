# !/bin/sh

while read -r set varname varval date hour
 do
 if [[ $set = "#Stop" ]]
  then
   echo "Breaking"
   break
 elif [[ $set = "set" ]]
  then
  if [[ $varname != "$bar_date_format" ]]
  then
   var="${varname//$}=$varval"
   echo $var
   export $(echo $var)
  else
   var="${varname//$}=$varval $date $hour"
   echo $var
   export $(echo $var)
  fi
 fi
done < $1
