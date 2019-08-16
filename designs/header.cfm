<!--- 
Theme: 	Mobile Pro 2.0
File: 	header.cfm
Notes: 	This is a sample header file.  The header file file is generally called from 
		head.cfm after the call to init.cfm.
--->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!--- Add Title and Meta Tags --->
<cfoutput>
  <title>MY ORGANIZATION |
  <cfif isHomepage>
    HOME PAGE TITLE
    <cfelse>
    #attributes.pagetitle#
  </cfif>
  </title>
  #getMetaTags()#</cfoutput>
<!--- Add style sheets as necessary. --->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<cfoutput>
  <link rel="stylesheet" href="../_data/#vNodeFolder#/styles/custom.css" type="text/css" media="screen" />
  <link rel="stylesheet" href="../_data/#vNodeFolder#/styles/normalize.min.css" media="screen" >
  <link rel="stylesheet" href="../_data/#vNodeFolder#/styles/nav-style.css" media="screen" >
  
  <!-- Bootstrap -->
  <link rel="stylesheet" href="../_data/#vNodeFolder#/styles/bootstrap.min.css" type="text/css" media="screen, projection" />
</cfoutput>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!--- Load jQuery --->
<cfif IsDefined("attributes.fuseaction") AND attributes.fuseaction EQ "home.editUserProfile">
	<!--- Do Nothing since jquery will be loaded within the Manage Your Profile functionality --->
<cfelse>
	<script src="/_includes/jquery/1.11.3/jquery.min.js"></script>
</cfif>
</head>
<body>
<div class="row">
  <div class="col-lg-12" id="top-row"> </div>
</div>
<div class="container"> <br clear="all">
  <div class="row">
    <div class="col-md-8">
    	<cfoutput>
	    	<cfset logo = application.apiv1.sectionsapi.getContentSection(sectionTitle="Logo", NodeID=#attributes.NodeID#)>
			<cfif isDefined("logo.query.content")>#logo.query.content#</cfif>
		</cfoutput>
    	<!---<a href="##"><img src="../_data/global/images/MobilePro2/logo-main-lg2.png"  alt="" class="img-responsive"/></a><br>--->
    </div>
    <div class="col-md-4"> 
      
    <div class="input-group">
      <input type="text" class="form-control" placeholder="Search for...">
      <span class="input-group-btn">
      <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Go!</button>
      </span> </div>
      <!-- /input-group -->
      
      <p class="pull-right"> <a href="/join">Join</a> |
        <cfif isDefined("client.userid") and client.userid NEQ 0>
          <cfoutput><a href="/index.cfm?fuseaction=home.editUserProfile">#request.editProfileTitle#</a></cfoutput> | 
          <!--<li class="member" style="border-right:0px"> --><a href="/index.cfm?fuseaction=home.Logout&nodeID=1">Logout</a> |<!--</li> -->
          <cfif isDefined("session.adminRoleID") and IsValid("integer",session.adminRoleID) AND session.adminRoleID GT 0>
            <!--<li class="member" style="border-right:0px"> --><a href="/admin">Admin</a><!--</li> -->
          </cfif>
          <cfelse>
          <!--<li class="member" style="border-right:0px"> --><a href="/login">Login</a><!--</li> -->
        </cfif>
        <!---| <a href="/subscribe">Subscribe</a>---> 
      </p>
      <br>
      <br>
		<!-- Social Media Icons -->
		<cfoutput>
		<cfset socialmediaicons = application.apiv1.sectionsapi.getContentSection(sectionTitle="Social Media Icons", NodeID=#attributes.NodeID#)>
			<cfif isDefined("socialmediaicons.query.content")>#socialmediaicons.query.content#</cfif>
		</cfoutput>
      <!---<p class="pull-right"> <a href="#"><i class="fa fa-facebook-square fa-3x"></i> </a> <a href="#"><i class="fa fa-twitter-square fa-3x"></i> </a> <a href="#"><i class="fa fa-linkedin-square fa-3x"></i> </a> <a href="#"><i class="fa fa-youtube-square fa-3x"></i> </a> </p>--->
      <br>
    </div>
  </div>
  <br clear="all">
</div>
<div style="margin-auto !important; background-color:#0a1e36;">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <nav role="navigation" id="k-nav">
          <input class="trigger" type="checkbox" id="mainNavButton">
          <label for="mainNavButton" onclick>Menu</label>
          <ul id="nav">
            <!---    The topmenu_show variable is used in the menu widget to determine which version
					  (public or password protected) of the menu will be displayed. --->
            <cfif not isDefined("client.userID") or client.userId lte 0>
              <cfset topmenu_show="public">
              <cfelse>
              <cfset topmenu_show="roleid">
            </cfif>
            <!---  Include menu file.  This will in turn include a cached navigation
				file that, in conjunction with the id defined above and the .css file, will define 
				the navigation (e.g. a drop down menu structure). --->
            <cfinclude template="../../../_includes/design/menu.cfm">
            <!---   Optional: Add login and admin links to menu. ---> 
            <!---
				<cfif isDefined("client.userid") and client.userid NEQ 0>
					<li class="member" style="border-right:0px"><a href="/index.cfm?fuseaction=home.Logout&nodeID=1">Logout</a></li>
					<cfif isDefined("client.issuperuser") and client.issuperuser EQ 1>
						<li class="member" style="border-right:0px"><a href="/admin">Admin</a></li>
					</cfif>
				<cfelse>
					<li class="member" style="border-right:0px"><a href="/index.cfm?pageId=482">Member Login</a></li>
				</cfif>--->
          </ul>
        </nav>
      </div>
    </div>
  </div>
</div>
<br clear="all">
<div class="container">
<cfif isHomepage>
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"> 
    
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
      <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    </ol>
    
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
		<!-- Slide 1 -->
		<cfoutput>
		<cfset slide1 = application.apiv1.sectionsapi.getContentSection(sectionTitle="Slide 1", NodeID=#attributes.NodeID#)>
			<cfif isDefined("slide1.query.content")>#slide1.query.content#</cfif>
		</cfoutput>
      	<!--- Code below to be used in Slide section --->
      	<!---<a href=""><img src="../_data/global/images/MobilePro2Graphics/main_img_new1.jpg" alt=""></a>--->
        <!--- Code below could be used for heading and text on slide --->
        <!---<div class="carousel-caption">
          <h1>Heading</h1>
          <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
          <p> <a class="btn btn-lg btn-success" href="#" role="button">Learn More!</a> </p>
        </div>--->
      </div>
      <div class="item"> 
		<!-- Slide 2 -->
		<cfoutput>
		<cfset slide2 = application.apiv1.sectionsapi.getContentSection(sectionTitle="Slide 2", NodeID=#attributes.NodeID#)>
			<cfif isDefined("slide2.query.content")>#slide2.query.content#</cfif>
		</cfoutput>
      	<!--- Code below to be used in Slide section --->
      	<!---<a href=""><img src="../_data/global/images/MobilePro2Graphics/main_img_new1.jpg" alt=""></a>---> 
        <!--- Code below could be used for heading and text on slide --->
        <!---<div class="carousel-caption">
          <h1>Heading</h1>
          <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
          <p> <a class="btn btn-lg btn-success" href="#" role="button">Learn More!</a></p>
        </div>---> 
      </div>
      <div class="item">
		<!-- Slide 3 -->
		<cfoutput>
		<cfset slide3 = application.apiv1.sectionsapi.getContentSection(sectionTitle="Slide 3", NodeID=#attributes.NodeID#)>
			<cfif isDefined("slide3.query.content")>#slide3.query.content#</cfif>
		</cfoutput>
      	<!--- Code below to be used in Slide section --->
      	<!---<a href=""><img src="../_data/global/images/MobilePro2Graphics/main_img_new1.jpg" alt=""></a>---> 
        <!--- Code below could be used for heading and text on slide --->
        <!---<div class="carousel-caption">
          <h1>Heading</h1>
          <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
          <p> <a class="btn btn-lg btn-success" href="#" role="button">Learn More!</a></p>
        </div>---> 
      </div>
      <div class="item">
		<!-- Slide 4 -->
		<cfoutput>
		<cfset slide4 = application.apiv1.sectionsapi.getContentSection(sectionTitle="Slide 4", NodeID=#attributes.NodeID#)>
			<cfif isDefined("slide4.query.content")>#slide4.query.content#</cfif>
		</cfoutput>
      	<!--- Code below to be used in Slide section --->
      	<!---<a href=""><img src="../_data/global/images/MobilePro2Graphics/main_img_new1.jpg" alt=""></a>--->
        <!--- Code below could be used for heading and text on slide --->
        <!---<div class="carousel-caption">
          <h1>Heading</h1>
          <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
          <p> <a class="btn btn-lg btn-success" href="#" role="button">Learn More!</a></p>
        </div>---> 
      </div>
    </div>
    
    <!-- Controls --> 
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> </div>
  <br clear="all">
  
  <!---START: HOME SECTION BOXES--->
  <div class="row">
    <div class="col-sm-6 col-md-4">
      <div class="thumbnailx"> 
		<!-- Call Out Graphic 1 -->
		<cfoutput>
		<cfset calloutgraphic1 = application.apiv1.sectionsapi.getContentSection(sectionTitle="Call Out Graphic1", NodeID=#attributes.NodeID#)>
			<cfif isDefined("calloutgraphic1.query.content")>#calloutgraphic1.query.content#</cfif>
		</cfoutput>      	
      	<!---<img data-src="holder.js/100%x200" alt="100%x200" src="/_data/n_0027/images/hm-box-img-1.jpg" data-holder-rendered="true" style="width: 100%; display: block;">--->
       <div class="caption">
		<!-- Call Out Text 1 -->
		<cfoutput>
		<cfset callouttext1 = application.apiv1.sectionsapi.getContentSection(sectionTitle="Call Out Text1", NodeID=#attributes.NodeID#)>
			<cfif isDefined("callouttext1.query.content")>#callouttext1.query.content#</cfif>
		</cfoutput>
        <!--- Code below could be used for heading and text on slide --->
          <!---<h3>LORUM IPSUM DOLORUM</h3>
          <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.<br>
            <a href="#">Read More</a></p>
          <p><a href="#" class="btn btn-primary" role="button">Dark Button &raquo;</a> <a href="#" class="btn btn-default" role="button">Light Button &raquo;</a></p>--->
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-md-4">
      <div class="thumbnailx"> 
		<!-- Call Out Graphic 2 -->
		<cfoutput>
    	<cfset calloutgraphic2 = application.apiv1.sectionsapi.getContentSection(sectionTitle="Call Out Graphic2", NodeID=#attributes.NodeID#)>
			<cfif isDefined("calloutgraphic2.query.content")>#calloutgraphic2.query.content#</cfif>
		</cfoutput>
      	<!---<img data-src="holder.js/100%x200" alt="100%x200" src="/_data/n_0027/images/hm-box-img-2.jpg" data-holder-rendered="true" style="width: 100%; display: block;">--->
     <div class="caption">
		<!-- Call Out Text 2 -->
		<cfoutput>
		<cfset callouttext2 = application.apiv1.sectionsapi.getContentSection(sectionTitle="Call Out Text2", NodeID=#attributes.NodeID#)>
			<cfif isDefined("callouttext2.query.content")>#callouttext2.query.content#</cfif>
		</cfoutput>
        <!--- Code below could be used for heading and text on slide --->
          <!---<h3>LORUM IPSUM DOLORUM</h3>
          <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.<br>
            <a href="#">Read More</a></p>
          <p><a href="#" class="btn btn-primary" role="button">Dark Button &raquo;</a> <a href="#" class="btn btn-default" role="button">Light Button &raquo;</a></p>--->
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-md-4">
      <div class="thumbnailx"> 
    	<!-- Call Out Graphic 3 -->
		<cfoutput>
    	<cfset calloutgraphic3 = application.apiv1.sectionsapi.getContentSection(sectionTitle="Call Out Graphic3", NodeID=#attributes.NodeID#)>
			<cfif isDefined("calloutgraphic3.query.content")>#calloutgraphic3.query.content#</cfif>
		</cfoutput>
      	<!---<img data-src="holder.js/100%x200" alt="100%x200" src="/_data/n_0027/images/hm-box-img-3.jpg" data-holder-rendered="true" style="width: 100%; display: block;">--->
     <div class="caption">
		<!-- Call Out Text 3 -->
		<cfoutput>
		<cfset callouttext3 = application.apiv1.sectionsapi.getContentSection(sectionTitle="Call Out Text3", NodeID=#attributes.NodeID#)>
			<cfif isDefined("callouttext3.query.content")>#callouttext3.query.content#</cfif>
		</cfoutput>
        <!--- Code below could be used for heading and text on slide --->
          <!---<h3>LORUM IPSUM DOLORUM</h3>
          <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.<br>
            <a href="#">Read More</a></p>
          <p><a href="#" class="btn btn-primary" role="button">Dark Button &raquo;</a> <a href="#" class="btn btn-default" role="button">Light Button &raquo;</a></p>--->
        </div>
      </div>
    </div>
  </div>
  <!---END: HOME SECTION BOXES--->  
</cfif>
<br>
<br>