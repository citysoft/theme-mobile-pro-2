</div>
<br clear="all">
<div class="container">
<div class="row">
   <div class="col-lg-12">
   
   </div> 
  </div>
 </div> 
<br>
<br><br>
<footer class="footer">
  <div class="row">
    <div class="col-lg-12">
      <p class="pull-right"><a href="#">Back to top</a></p>
		<!-- Footer Text -->
		<cfoutput>
		<cfset footertext = application.apiv1.sectionsapi.getContentSection(sectionTitle="Footer Text", NodeID=#attributes.NodeID#)>
			<cfif isDefined("footertext.query.content")>#footertext.query.content#</cfif>
		</cfoutput>
      	<!---<p>&copy; 2017 Your Organization | <a href="">Privacy</a> | <a href="">Terms</a></p>--->
    </div>
  </div>
</footer>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<!---<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>---> 
<!--- This script replaces the commented out one above so that we avoid having jquery called twice in some situations 
	  (like in the manage your profile area) --->
<script language="JavaScript">
if (window.jQuery === undefined) {
    var s = document.createElement('script');
    s.src = "//https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js";
    document.head.appendChild(s);
}

</script>

<cfoutput>
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="../_data/#vNodeFolder#/scripts/bootstrap.min.js"></script> 
</cfoutput>
</body>
</html>