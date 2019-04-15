<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN"
            "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
<head>
<title>uMovies :: Movies</title>
<style type="text/css">
@import url(uMovies.css);
</style>
</head>
<body>

<div id="links">
<a href="index.html">Home<span> Access the database of movies, actors and directors. Free to all!</span></a>
<a href="admin.html">Administrator<span> Administrator access. Password required.</span></a>
</div>


<div id="content">
<h1>uMovies&trade;</h1>
<p>
Welcome to <em>uMovies</em>, your destination for information on <a href="movies.php" title="access movies information">movies</a>, <a href="actors.php" title="access actors information">actors</a> and <a href="directors.php" title="access directors information">directors</a>.
</p>

<h2>Administrator Menu</h2>
<p>
<?php

$okay = true;
if($_FILES['uploaded']['error']>0){
   echo 'A problem was detected:<br/>';
   switch($_FILES['uploaded']['error']){
      case 1: echo '* File exceeded maximum size allowed by server.<br/>'; break;
      case 2: echo '* File exceeded maximum size allowed by application.<br/>'; break;
      case 3: echo '* File could not be fully uploaded.<br/>'; break;
      case 4: echo '* File was not uploaded.<br/>';
   }
   $okay = false;
}


?>
</p>
<p><copyright>Roberto A. Flores &copy; 2019</copyright></p>
</div>

</body>
</html>