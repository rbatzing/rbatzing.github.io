<?php
$filename = $_SERVER["SCRIPT_NAME"];
$keys = array_keys($_SERVER);
sort($keys);
foreach ($keys as $key)
{
  echo "<P>".$key.": ".$_SERVER[$key];
}
echo "<hr><hr><hr><h2>GET</h2>";
$keys = array_keys($_GET);
sort($keys);
foreach ($keys as $key)
{
  echo "<P>".$key.": ".$_GET[$key];
}

echo "<hr><hr><hr><h2>request</h2>";

$keys = array_keys($_REQUEST);
sort($keys);
foreach ($keys as $key)
{
  echo "<P>".$key.": ".$_REQUEST[$key];
}

echo "<hr><hr><hr>";

   echo "<h1>Hello, world</h1>";
if (isset($_REQUEST['count']))
  {   $count = $_REQUEST['count'] + 1; }
else 
  {   $count = 5; }

$goose = $_REQUEST['goose'];
$age = $_REQUEST['age'];

echo "<form method=GET action=$filename>";
echo "<p> Goose: <input type=text name='goose' value='$goose'>";
echo "<p> Age: <input type=text name='age' value='$age'>";
echo "<input type=hidden name='count' value='$count'>";
echo "<input type=submit name='Submit' value='Go for it'>";

echo "</form>";


   echo "<p><a href='$filename?msg=Hi&count=$count'>Try again</a>";

echo "<hr><hr><hr>";



?>
