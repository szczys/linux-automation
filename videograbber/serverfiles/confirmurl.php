<?php
  if ($_POST['url']) {
    $url=$_POST['url'];
    exec("echo '$url' >> /home/mike/compile/linux-automation/videograbber/videoqueue.txt", $output, $return);
  } else {
    $return = 1;
  }

  if (!$return) {
    echo "Your video will be downloaded.";
  } else {
    echo "Error, was not able to write to queue file for some reason";
  }
  echo '<br><br><a href="/ytdl.html"><-- Back to form</a>'
?>
