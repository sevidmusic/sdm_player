<?php
$sdm_player_errors = array();
$sdm_player_features = 1;
?>
<?php
$sdm_current_song_mname = $_GET["s"];
$sdm_auto_change_con = mysql_connect('localhost:8888','root','root');
if(!$sdm_auto_change_con) {
  $sdm_player_errors[] = "<p>An error occured</p>";
} else {
  mysql_select_db("sdm_player", $sdm_auto_change_con);
  $sdm_count_songs_sql = 'SELECT COUNT(sdm_song_id) AS song_id_count FROM sdm_song_info';
  $sdm_get_current_song_id_sql="SELECT sdm_song_id AS sdm_current_id FROM sdm_song_info WHERE sdm_song_machine_name = '" . $sdm_current_song_mname . "'";
  $sdm_count_songs_query = mysql_query($sdm_count_songs_sql);
  $sdm_get_current_song_query = mysql_query($sdm_get_current_song_id_sql);
  $sdm_total_songs_in_db_result  = mysql_fetch_array($sdm_count_songs_query);
  $sdm_current_song_id_result  = mysql_fetch_array($sdm_get_current_song_query);
  $sdm_total_songs_in_db = $sdm_total_songs_in_db_result['song_id_count'];
  $sdm_current_song_id = $sdm_current_song_id_result['sdm_current_id'];
  if ($sdm_current_song_id < $sdm_total_songs_in_db) {
    $sdm_next_song_id = $sdm_current_song_id + 1;
  } elseif ($sdm_current_song_id == $sdm_total_songs_in_db) {
    $sdm_next_song_id = $sdm_current_song_id - $sdm_total_songs_in_db + 1;
  } else {
    $sdm_player_errors[] = 'somethng is wrong and the next song could not be determined. The player may be unaccsessible. (see lines 203 - 226 | auto change)';
  }
  $sdm_next_song_mname_con = mysql_connect('localhost:8888','root','root');
  if(!$sdm_next_song_mname_con) {
    $sdm_player_errors[] = "<p>An error occured</p>";
  } else {
    mysql_select_db("sdm_player", $sdm_next_song_mname_con);
    $sdm_next_song_mname_sql = "SELECT sdm_song_machine_name AS sdm_song_new_mname FROM sdm_song_info WHERE sdm_song_id = '" . $sdm_next_song_id ."'";
    $sdm_next_song_mname_query = mysql_query($sdm_next_song_mname_sql);
    $sdm_next_song_mname_result = mysql_fetch_array($sdm_next_song_mname_query);
    $sdm_next_song_mname = $sdm_next_song_mname_result['sdm_song_new_mname'];
  }
}
?>
<?php
$sdm_new_song_info_con = mysql_connect('localhost:8888','root','root');
if(!$sdm_new_song_info_con) {
  $sdm_player_errors[] = "<p>An error occured and the song info could not be retrieved. Try reloading the page. If problem persists please <a href=\"#\">contact the site administrator</a></p>";
} else {
  mysql_select_db("sdm_player", $sdm_new_song_info_con);
  $sdm_new_song_info_sql_sname ="SELECT sdm_song_name AS sname  FROM sdm_song_info WHERE sdm_song_machine_name = '" . $sdm_next_song_mname . "'";
  $sdm_new_song_info_sql_sartist ="SELECT sdm_song_musician_name AS sartist  FROM sdm_song_musician_info WHERE sdm_song_musician_id = '1'";
  $sdm_new_song_info_sql_salbum ="SELECT sdm_song_album AS salbum  FROM sdm_song_info WHERE sdm_song_machine_name = '" . $sdm_next_song_mname . "'";
  $sdm_new_song_info_sname_result = mysql_query($sdm_new_song_info_sql_sname);
  $sdm_new_song_info_sartist_result = mysql_query($sdm_new_song_info_sql_sartist);
  $sdm_new_song_salbum_result = mysql_query($sdm_new_song_info_sql_salbum);
  $sdm_new_song_info_sname = mysql_fetch_array($sdm_new_song_info_sname_result);
  $sdm_new_song_info_sartist = mysql_fetch_array($sdm_new_song_info_sartist_result);
  $sdm_new_song_info_salbum = mysql_fetch_array($sdm_new_song_salbum_result);
  print '<div class="sdm-player" id="sdm-player">';
  print '<div class="sdm-player-song-info-display">';
  print '<div class="sdm-player-song-info-display-item">';
  print $sdm_new_song_info_sname['sname'];
  print '</div>';
  print '<div class="sdm-player-song-info-display-item">';
  print $sdm_new_song_info_sartist['sartist'];
  print '</div>';
  print '<div class="sdm-player-song-info-display-item">';
  print $sdm_new_song_info_salbum['salbum'];
  print '</div>';
  print '</div><!-- close sdm-player-song-info-display -->';
} 
?>
<?php
if($sdm_next_song_mname) {
  $sdm_new_controls_con = mysql_connect('localhost:8888', 'root', 'music');
  if (!$sdm_new_controls_con) {
    print '<h4 class="sdm-player-errors">Uh Oh!</h4>';
    print '<p class="sdm-player-errors">Please check sdm_player_queries.php for bugs...<p>';
    die('<p class="sdm-player-errors">Player Failed to Load Due To A FATAL ERROR! There is something wrong with the query script. Please <a href=\"#\">contact the site administrator</a> with the message: "Music Bug" so we can fix the problem. Sorry for the inconvenience.</p>');
  } else {
    mysql_select_db("sdm_player", $sdm_new_controls_con);
    $sdm_new_controls_sql="SELECT sdm_song_ogg_url AS ogg_url, sdm_song_mp3_url AS mp3_url FROM sdm_song_file_info WHERE sdm_song_machine_name = '" . $sdm_next_song_mname . "'";
    $sdm_new_controls_controls_result = mysql_query($sdm_new_controls_sql);
    $sdm_new_controls_song_urls = mysql_fetch_array($sdm_new_controls_controls_result);
    $sdm_new_controls_html[] = "<div class=\"sdm-player-controls\" id=\"sdm-player-controls\">";
    $sdm_new_controls_html[] = "<audio id=\"" . $sdm_next_song_mname . "\" controls=\"controls\" autoplay=\"autoplay\" onended=\"sdm_player_onEnd_change_song_ajax(this.id, 'sdm-player-main-wrapper')\">";	/**/
    $sdm_new_controls_html[] = "<source src=\"" . $sdm_new_controls_song_urls['ogg_url'] . "\" type=\"audio/ogg\" />";	
    $sdm_new_controls_html[] = "<source src=\"" . $sdm_new_controls_song_urls['mp3_url'] . "\" type=\"audio/mpeg\" />";	
    $sdm_new_controls_html[] = "Your browser does not support HTML5 or the audio element";
    $sdm_new_controls_html[] = "</audio>";
    $sdm_new_controls_html[] = "</div><!-- close sdm-player-colntrols -->";
    if ($sdm_new_controls_html > 0) {
      $new_new_controls_html = "";
      for($i=0; $i < count($sdm_new_controls_html); $i++) {
        if ($new_new_controls_html == "") {
          $new_new_controls_html=$sdm_new_controls_html[$i];
        } else {
          $new_new_controls_html=$new_new_controls_html.$sdm_new_controls_html[$i];
        }
      }
    }
    if (!$new_new_controls_html or $new_new_controls_html == "") {
      $sdm_new_controls_query_output = "";
      $sdm_player_errors[] = "<p>For some reason we cannot retrieve the song. You can try reloading the page. If problem persists   please <a href=\"#\">contact the site administrator</a> and try again later. Sorry for the inconvenience.</p>";
    } else {
      $sdm_new_controls_query_output=$new_new_controls_html;
    }
    print $sdm_new_controls_query_output;
    mysql_close($sdm_new_controls_con);
  }
}
else {
  $sdm_player_errors[] = "<p>There is a problem with the Player. This could be due to site maintenance, or an error. You can try reloading the page. If problem persists please <a href=\"#\">contact the site administrator</a> and try again later. Sorry for the inconvenience.</p>";
}
?>
<?php
$sdm_new_song_playlist_con = mysql_connect('localhost:8888','root','root');
if(!$sdm_new_song_playlist_con) {
  $sdm_player_errors[] = "<p>An error occured and the playlist could not be retrieved. Try reloading the page. If problem persists please <a href=\"#\">contact the site administrator</a></p>";
} else {
  mysql_select_db("sdm_player", $sdm_new_song_playlist_con);
  $sdm_new_playlist_sql = "SELECT sdm_song_machine_name AS sdm_pmname, sdm_song_name AS sdm_psname FROM sdm_song_info";
  $sdm_new_playlist_result = mysql_query($sdm_new_playlist_sql);
  while($sdm_new_playlist_items = mysql_fetch_array($sdm_new_playlist_result)) {
    $sdm_new_playlist_html = array();
    $sdm_new_playlist_html[] = '<div class="sdm-player-playlist">';
    $sdm_new_playlist_html[] = '<div class="sdm-player-playlist-item" id="' . $sdm_new_playlist_items['sdm_pmname'] . '">';
    $sdm_new_playlist_html[] = '<a href="#" onClick="sdm_player_change_song_ajax(\'' . $sdm_new_playlist_items['sdm_pmname'] . '\',\'sdm-player-main-wrapper\')">' . $sdm_new_playlist_items['sdm_psname'] . '</a>';
    $sdm_new_playlist_html[] = '</div>';
    $sdm_new_playlist_html[] = '</div><!-- close sdm-player-playlist -->';
    if ($sdm_new_playlist_html) {
      $sdm_new_playlist_html_string = "";
      for($i=0; $i < count($sdm_new_playlist_html); $i++) {
        if ($sdm_new_playlist_html_string == "") {
          $sdm_new_playlist_html_string=$sdm_new_playlist_html[$i];
        } else {
          $sdm_new_playlist_html_string=$sdm_new_playlist_html_string.$sdm_new_playlist_html[$i];
        }
      }
    }
    if (!$sdm_new_playlist_html_string or $sdm_new_playlist_html_string == "") {
      $sdm_new_playlist_output = "";
      $sdm_player_errors[] = "<p>For some reason we cannot retrieve the song. You can try reloading the page. If problem persists please <a href=\"#\">contact the site administrator</a> and try again later. Sorry for the inconvenience.</p>";
    } else {
      $sdm_new_playlist_output=$sdm_new_playlist_html_string;
    }
    print $sdm_new_playlist_output;
  }
}
?>
<?php
if ($sdm_player_features == 1) {
  $sdm_new_lyric_con = mysql_connect('localhost:8888','root','root');
  if(!$sdm_new_lyric_con) {
    $sdm_player_errors[] = "<p>An error occured and the lyrics could not be retrieved. Try reloading the page. If problem persists please <a href=\"#\">contact the site administrator</a></p>";
  } else {
    mysql_select_db("sdm_player", $sdm_new_lyric_con);
    $sdm_new_lyric_sql="SELECT sdm_song_lyrics AS sdm_lyrics FROM sdm_song_info WHERE sdm_song_machine_name = '" . $sdm_next_song_mname . "'";
    $sdm_new_lyric_result = mysql_query($sdm_new_lyric_sql);
    $sdm_new_song_lyrics = mysql_fetch_array($sdm_new_lyric_result);
    print "<div class=\"sdm-player-lyrics-display\" id=\"sdm-player-lyrics-display\">";
    print "<div id=\"sdm-lyrics\">";
    print $sdm_new_song_lyrics['sdm_lyrics'];
    print "</div><!-- close sdm-lyrics -->";
    print "</div><!-- close sdm-player-lyris-display -->";
  } 
}
?>
<?php
if ($sdm_player_errors) {
  print '<!-- SDM PLAYER ERRORS -->';
  print '<div class="sdm-player-errors">';
  print '<h5>SDM Player Error</h5>';
  print '<ul class="sdm-player-error-list">';
  foreach ($sdm_player_errors as $msg) {
    print '<li id="sdm-player-error-list-item">';
    print $msg;
    print '</li>';
  }
  print '</ul>';
  print '</div>';
  print '<!-- END SDM PLAYER ERRORS -->';
}
?>
