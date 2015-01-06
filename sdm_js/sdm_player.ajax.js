function sdm_player_change_song_ajax(sdm_song_name, sdm_player_id) {
var xmlhttp;
if (sdm_song_name.length==0)
  {
  document.getElementById(sdm_player_id).innerHTML="Player not available right now... please try again later";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById(sdm_player_id).innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","sdm_includes/sdm_player_queries.php?q="+sdm_song_name,true);
xmlhttp.send();
}
function sdm_player_onEnd_change_song_ajax(sdm_current_song_mname, sdm_player_id) {
var xmlhttp;
if (sdm_current_song_mname.length==0)
  {
  document.getElementById(sdm_player_id).innerHTML="Player not available right now... please try again later";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById(sdm_player_id).innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","sdm_includes/sdm_player_auto_change.php?s="+sdm_current_song_mname,true);
xmlhttp.send();
}