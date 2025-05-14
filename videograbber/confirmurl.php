<?php
  if ($_POST['url']) {
    $url=$_POST['url'];

    $return = file_put_contents("/Lenny/videoLibrary/ytdl_queue", "$url\n");
  } else {
    $return = false;
  }

  if ($return == false) {
    echo "Error, was not able to write to queue file for some reason";
  } else {
    echo "Your video will be downloaded.!!!!";
  }
  echo '<br><br><a href="/ytdl.html"><-- Back to form</a>'
?>
