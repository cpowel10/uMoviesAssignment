<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN"
            "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
<head>
<title>uMovies :: Movie</title>
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

<h2>Director</h2>

<p>
<?php
@$moviesdb = new mysqli('localhost','uMoviesUser','anonymous','uMovies');
@$moviesdb->set_charset("utf8");

if ($moviesdb->connect_errno) {
    echo '<h3>Database Access Error!</h3>';
}
else {
    $select = 'select * from director';
    if (@$_GET['name'] != "") {
        $select .= ' where name = "'.$_GET['name'].'"';
    }

    $result = $moviesdb->query( $select );
    $rows   = $result->num_rows;

    if ($rows == 0) {
        echo "<h3>No Director to Display</h3>";
    }
    else {
        $director = $result->fetch_assoc();

        echo "<strong>Filmography:</strong><br />";
        echo "<table class=\"uMovies\">\n";
        echo "<tr>\n";
        echo "<th></th>";
        echo "<th>Name</th>";
        echo "<tr>\n";

        $select = 'select movie from directed_by where director="'.$director['name'].'"';
        switch (@$_GET['order']) {
            case 'movie':
        }
        $result = $moviesdb->query( $select );
        $rows             = $result->num_rows;

        if ($rows == 0) {
            echo "<tr>\n";
            echo "<td colspan=\"3\">No Movies to Display</td>";
            echo "</tr>\n";
        }
        else {
            for ($i=0; $i<$rows; $i++) {
                $row = $result->fetch_assoc();
                echo "<tr class=\"highlight\">";
                echo "<td>".($i+1)."</td>";
                echo "<td><a href=\"movie.php?name=".$row['movie']."\" />".$row['movie']."</a></td>";
                echo "</tr>\n";
            }
        }
        echo "</table>\n";

        $result->free();
        $moviesdb->close();
    }
}
?>
</p>

<p><copyright>Roberto A. Flores &copy; 2019</copyright></p>
</div>

</body>
</html>
