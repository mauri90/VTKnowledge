<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VT Knowledge</title>

    <!-- Bootstrap -->
    <link href="<?= SERVER_PATH ?>public/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?= SERVER_PATH ?>public/css/custom.css" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
  </head>
  <body>

<div class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button> 
				
			<a class="navbar-brand" href="<?= SERVER_PATH ?>">VT Knowledge</a>
		</div> 
		
		<?php	
		$directoryURI = $_SERVER['REQUEST_URI'];
		$path = parse_url($directoryURI, PHP_URL_PATH);
		?>

		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				
			 	<li class="<?php if ($path=="/VTKnowledge/") {echo "active"; } else  {echo "noactive";}?>"><a href="<?= SERVER_PATH ?>">Home</a></li>
			 	<li> <a href="#">Logged in as ...</a></li>
			 	<li class="<?php if ($path=="/VTKnowledge/question") {echo "active"; } else  {echo "noactive";}?>"><a href="<?= SERVER_PATH ?>question">Ask a question</a></li>
			 	<li class="<?php if ($path=="/VTKnowledge/topic") {echo "active"; } else  {echo "noactive";}?>"><a href="<?= SERVER_PATH ?>topic">Create a Topic</a></li>
			 
			</ul> 
			<form class="navbar-form navbar-left" role="search">
        		<div class="form-group">
          			<input type="text" class="form-control" placeholder="Search">
        		</div>
        		<button type="submit" class="btn btn-default">Submit</button>
      		</form>
		</div> 
	</div> 
</div> 


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<?= SERVER_PATH ?>public/js/bootstrap.min.js"></script>
    <script src="<?= SERVER_PATH ?>public/js/script.js"></script>
    

  </body>
</html>