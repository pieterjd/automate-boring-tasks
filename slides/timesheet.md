# Timesheeting


## Fusion
![alt text](../assets/fusion_zoom.png "Fusion")


### jQuery - load & init
```js
//load in jquery
var jq = document.createElement('script');
jq.src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js";
document.getElementsByTagName('head')[0].appendChild(jq);
jQuery.noConflict();
//create array with dates of current month
var now = new Date();
daysInMonth=new Date(now.getFullYear(), now.getMonth()+1, 0).getDate();
//create array of all days in current month
var daysOfMonth = [];
for (var day = 1; day <= daysInMonth; day++) {
    //month is zero base in the constructor
    var date = new Date(now.getFullYear(),now.getMonth(),day);
    daysOfMonth.push(date);
}
```


### jQuery - fill out
```js
for(var i=0;i<daysOfMonth.length;i++){
 var date = daysOfMonth[i];
 if(date.getDay()!=0 && date.getDay()!=6 ){
  jQuery(jQuery('[name$="it1"]')[i]).val(8);//hours
  jQuery(jQuery('[name*="projectFullNameId"]')[i]).val('OIKOI');
  jQuery(jQuery('[name*="taskNameId"]')[i]).val('Development');
  jQuery(jQuery('[name*="fullReferenceId"]')[i]).val(poValue);
 }
}
```


### JQL + Powershell
1. Fetch the stories + time spent
  ```plaintext
/rest/api/2/search?jql=worklogAuthor=pdrouill
AND worklogDate>=startOfMonth()&fields=id,key
  ```
1. enrich data
1. dump in JSON


### Python + selenium
1. read JSON
1. Simulate manual entry