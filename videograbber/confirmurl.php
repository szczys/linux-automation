<?php
  $q = array();
  if ($_POST['url']) {
    $url=$_POST['url'];

    $q['url'] = $url;
    $return = file_put_contents("/Lenny/videoLibrary/ytdl_queue", "$url\n");
  } else {
    $return = false;
  }

  if ($return == false) {
    $q['status'] = "Error, unable to queue for download";
  } else {
    $q['status'] = "Successfully queued for download.";
  }

  $q_str = http_build_query($q);
  header("Location: http://krusty/ytdl.html?$q_str");
  die();
?>
