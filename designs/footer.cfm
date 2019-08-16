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
    </div>
  </div>
</footer>
<cfoutput>
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="../_data/#vNodeFolder#/scripts/bootstrap.min.js"></script> 
</cfoutput>
</body>
</html>