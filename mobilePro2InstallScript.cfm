<!--- This script installs the content sections into CE for use in the Mobile Pro 2 theme --->
<!--- URL to run script:
Option #1 - If you are using an extension folder to run the deployment script (which allows you to bypass the "check request" 
security filter), then your deployment url might look like the following:
http://www.domain.com/index.cfm?fuseaction=themeDeploy.installmobilePro2&testmode=1&sections=1&pages=1&node=1&images=1&showerrors=1

Option #2 - If you want to run the file directly, the url might look similar to the following (but would need to be added as
an exception in the "check request" security filter in order to run):
http://www.domain.com/_data/n_0001/scripts/mobilePro2InstallScript.cfm?testmode=1&sections=1&pages=1&images=1&showerrors=1 
change testmode from 1 to 0 to run it. --->
<!--- Note - images need to be ftp:ed into folder named the same as below --->
<!--- One recommended scenario is to create /global/images/ThemeImages/ and put the graphics there.  That will make it easy for the image library in the web editor 
	  UI to manage the images. --->
<cfparam name="variables.ImageFolder" default="ThemeImages" type="string"><!--- This is more like a path variable for the images subfolder (e.g. "ThemeImages") --->
<cfparam name="url.testmode" type="boolean" default="true">
<cfparam name="url.sections" type="boolean" default="false">
<cfparam name="url.pages" type="boolean" default="false">
<cfparam name="url.pageslogin" type="boolean" default="false">
<cfparam name="url.images" type="boolean" default="false"><!--- If this is 1, then /global/ directory; if 0, then use node directory --->
<cfparam name="url.node" type="numeric" default=1><!--- Important to use the actual nodeid - this is where the pages and sections need to go. --->
<cfparam name="variables.callouttext" type="string" default="<h3>LORUM IPSUM DOLORUM</h3><p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.<br><a href=''>Read More</a></p><p><a href='' class='btn btn-primary' role='button'>Dark Button &raquo;</a> <a href='' class='btn btn-default' role='button'>Light Button &raquo;</a></p>">

<cfif isDefined("url.images") AND url.images EQ 1>
	<cfset variables.impagepath = "global">
<cfelseif isDefined("url.images") AND url.images EQ 0>
	<cfset variables.impagepath = "n_" & NumberFormat(url.node, "0009")>
</cfif>

<cfif isDefined("url.ImageFolder") AND url.ImageFolder NEQ "">
	<cfset variables.ImageFolder = url.ImageFolder>
</cfif>
<!--- START: SETTINGS SUMMARY (ON SCREEN) --->
<strong>SETTINGS SUMMARY</strong><br>
<cfoutput>
<cfif isDefined("url.testmode") AND url.testmode EQ 1>
	<p style="color: red; font-weight:bold;">TEST MODE ONLY - NO INSERTS INTO CE DB</p>
</cfif>
<cfif isDefined("variables.ImageFolder") AND variables.ImageFolder NEQ "">
	Image Folder = #variables.ImageFolder#<br>
</cfif>
<cfif isDefined("url.sections") AND url.sections EQ "true">
	SECTIONS SCRIPT TURNED ON<br>
<cfelseif isDefined("url.sections") AND url.sections EQ "false">
	SECTIONS SCRIPT TURNED OFF<br>
</cfif>
<cfif isDefined("url.pages") AND url.pages EQ "true">
	PAGES SCRIPT TURNED ON<br>
<cfelseif isDefined("url.pages") AND url.pages EQ "false">
	PAGES SCRIPT TURNED OFF<br>
</cfif>
<cfif isDefined("url.pageslogin") AND url.pageslogin EQ "true">
	PAGES SCRIPT TURNED ON<br>
<cfelseif isDefined("url.pageslogin") AND url.pageslogin EQ "false">
	PAGES SCRIPT TURNED OFF<br>
</cfif>
<cfif isDefined("url.node") AND url.node EQ 0>
	NODEID = #url.node# (global directory)<br><br>
<cfelseif isDefined("url.node")>
	NODEID = #url.node# (node directory)<br><br>
</cfif>
<cfif isDefined("variables.impagepath")>
	PATH TO THEME IMAGES = #variables.impagepath#<br><br>
</cfif>
</cfoutput>
<!--- END: SETTINGS SUMMARY (ON SCREEN) --->

<cfset variables.sectiondescription = "Please Note - This section displays content on the home page.<br>  
			Changes to the section title may cause the section content to disappear from the home page.">

<!--- Install Slide Content Channels --->
<font size=5>Install Mobile Pro 2 Theme Sections and Pages</font><br>
<br>
<!---                                                  --->
<!---          1. INSTALL DEFAULT SECTIONS             --->
<!---                                                  --->
<!---          1.1 Create a query and set its contents. --->
<cfset sectioninstallquery = QueryNew( "sectiontitle, sectiondescription, sectioncontent" ) />

		<!--- Logo Section --->
		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Logo" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img src='../_data/#variables.impagepath#/images/#variables.ImageFolder#/logo-main-lg2.png' alt=''>" ) />

		<!--- Social Media Section --->
		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Social Media Icons" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<p class='pull-right'> <a href=''><i class='fa fa-facebook-square fa-3x'></i> </a> <a href=''><i class='fa fa-twitter-square fa-3x'></i> </a> <a href=''><i class='fa fa-linkedin-square fa-3x'></i> </a> <a href=''><i class='fa fa-youtube-square fa-3x'></i> </a> </p>" ) />

		<!--- Slide Sections --->
		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Slide 1" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img src='../_data/#variables.impagepath#/images/#variables.ImageFolder#/main_img_new1.jpg' alt=''>" ) />

		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Slide 2" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img src='../_data/#variables.impagepath#/images/#variables.ImageFolder#/main_img_new1.jpg' alt=''>" ) />

		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Slide 3" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img src='../_data/#variables.impagepath#/images/#variables.ImageFolder#/main_img_new1.jpg' alt=''>" ) />

		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Slide 4" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img src='../_data/#variables.impagepath#/images/#variables.ImageFolder#/main_img_new1.jpg' alt=''>" ) />
		
		<!--- Call Out Sections --->
		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Call Out Graphic1" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img data-src='holder.js/100%x200' alt='100%x200' src='/_data/#variables.impagepath#/images/#variables.ImageFolder#/hm-box-img-1.jpg' data-holder-rendered='true' style='width: 100%; display: block;'>" ) />
		
		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Call Out Text1" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "#variables.callouttext#" ) />
		
		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Call Out Graphic2" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img data-src='holder.js/100%x200' alt='100%x200' src='/_data/#variables.impagepath#/images/#variables.ImageFolder#/hm-box-img-2.jpg' data-holder-rendered='true' style='width: 100%; display: block;'>" ) />

		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Call Out Text2" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "#variables.callouttext#" ) />

		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Call Out Graphic3" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img data-src='holder.js/100%x200' alt='100%x200' src='/_data/#variables.impagepath#/images/#variables.ImageFolder#/hm-box-img-3.jpg' data-holder-rendered='true' style='width: 100%; display: block;'>" ) />

		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Call Out Text3" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "#variables.callouttext#" ) />


		<!--- Footer Sections --->
		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Footer Text" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<p>&copy; 2017 Your Organization | <a href="">Privacy</a> | <a href="">Terms</a></p>" ) />

<cfdump var="#sectioninstallquery#" label=""/>

<cfif isDefined("url.testmode") AND url.testmode EQ 0>

	<cftransaction>
		<cfoutput query="sectioninstallquery">
		
			<!--- Checks for existance of page so that duplicates are not accidentally imported. --->
			<cfquery name="dupecheck" datasource="#request.dsn#">
				SELECT title
				FROM contentT
				WHERE title = <cfqueryparam value="#sectioninstallquery.sectiontitle#" cfsqltype="CF_SQL_VARCHAR">
				AND NodeID = <cfqueryparam value="#url.node#" cfsqltype="cf_sql_integer">
			</cfquery>
		
			<cfif NOT dupecheck.recordcount>
			<!--- write to db --->
				<cfif isDefined("url.sections") AND url.sections EQ 1>
					<cfquery name="insertcontentchannels" datasource="#request.dsn#">
						INSERT INTO contentT (
							Title
							,Content
							,Description
							,CreateDate
							<cfif isDefined("url.Node") AND isValid("integer",trim(url.node))>
							,NodeID
							</cfif>
							)
						VALUES (
							<cfqueryparam value="#trim(sectioninstallquery.sectiontitle)#" cfsqltype="CF_SQL_VARCHAR">
							,<cfqueryparam value="#trim(sectioninstallquery.sectioncontent)#" cfsqltype="CF_SQL_VARCHAR">
							,<cfqueryparam value="#trim(sectioninstallquery.sectiondescription)#" cfsqltype="CF_SQL_VARCHAR">
							,#CreateODBCDateTime(now())#
							<cfif isDefined("url.Node") AND isValid("integer",trim(url.node))>
							,<cfqueryparam value="#url.node#" cfsqltype="cf_sql_integer">
							</cfif>
							)
					</cfquery>
				</cfif>
			</cfif>
		
		</cfoutput>
	</cftransaction>

<cfelse>

	TEST MODE - NO SECTIONS INSERTED<br><br>

</cfif>

<!---                                               --->
<!---          2. INSTALL DEFAULT PAGES             --->
<!---                                               --->
<!--- Create a query and set its contents. --->
<cfset pageinstallquery = QueryNew( "pagetitle, pagenavtitle, pagecontent" ) />

	<cfset QueryAddRow( pageinstallquery ) />
	<cfset QuerySetCell( pageinstallquery, "pagetitle", "About" ) />
	<cfset QuerySetCell( pageinstallquery, "pagenavtitle", "About" ) />
	<cfset QuerySetCell( pageinstallquery, "pagecontent", "About Page Content" ) />

	<cfset QueryAddRow( pageinstallquery ) />
	<cfset QuerySetCell( pageinstallquery, "pagetitle", "Services" ) />
	<cfset QuerySetCell( pageinstallquery, "pagenavtitle", "Services" ) />
	<cfset QuerySetCell( pageinstallquery, "pagecontent", "Services Page Content" ) />

	<cfset QueryAddRow( pageinstallquery ) />
	<cfset QuerySetCell( pageinstallquery, "pagetitle", "News" ) />
	<cfset QuerySetCell( pageinstallquery, "pagenavtitle", "News" ) />
	<cfset QuerySetCell( pageinstallquery, "pagecontent", "News Page Content" ) />

	<cfset QueryAddRow( pageinstallquery ) />
	<cfset QuerySetCell( pageinstallquery, "pagetitle", "Events" ) />
	<cfset QuerySetCell( pageinstallquery, "pagenavtitle", "Events" ) />
	<cfset QuerySetCell( pageinstallquery, "pagecontent", "Events Page Content" ) />

	<cfset QueryAddRow( pageinstallquery ) />
	<cfset QuerySetCell( pageinstallquery, "pagetitle", "Resources" ) />
	<cfset QuerySetCell( pageinstallquery, "pagenavtitle", "Resources" ) />
	<cfset QuerySetCell( pageinstallquery, "pagecontent", "Resources Page Content" ) />

	<cfset QueryAddRow( pageinstallquery ) />
	<cfset QuerySetCell( pageinstallquery, "pagetitle", "Programs" ) />
	<cfset QuerySetCell( pageinstallquery, "pagenavtitle", "Programs" ) />
	<cfset QuerySetCell( pageinstallquery, "pagecontent", "Programs Page Content" ) />

	<cfset QueryAddRow( pageinstallquery ) />
	<cfset QuerySetCell( pageinstallquery, "pagetitle", "Join" ) />
	<cfset QuerySetCell( pageinstallquery, "pagenavtitle", "Join" ) />
	<cfset QuerySetCell( pageinstallquery, "pagecontent", "Join Page Content" ) />

	<cfset QueryAddRow( pageinstallquery ) />
	<cfset QuerySetCell( pageinstallquery, "pagetitle", "Login" ) />
	<cfset QuerySetCell( pageinstallquery, "pagenavtitle", "Login" ) />
	<!--- NEED LOGIN CHANNEL INFO HERE --->


	<!--- Get Page Template --->
	<cfquery name="getpagetemplateid" datasource="#request.dsn#">
		SELECT pagetemplateid
		FROM pagetemplate
		WHERE name = <cfqueryparam value="div_c1" cfsqltype="CF_SQL_VARCHAR">
	</cfquery>

	<!--- Get Channel Page Template --->
	<cfquery name="getchannelpagetemplateid" datasource="#request.dsn#">
		SELECT pagetemplateid
		FROM pagetemplate
		WHERE name = <cfqueryparam value="div_ch1" cfsqltype="CF_SQL_VARCHAR">
	</cfquery>

<cfdump var="#pageinstallquery#" label=""/>

<cfif isDefined("url.testmode") AND url.testmode EQ 0>

	<!--- Insert to the Destination DB --->
	<cftransaction>
		<cfoutput query="pageinstallquery">
		
			<!--- Checks for existance of page so that duplicates are not accidentally imported. --->
			<cfquery name="dupecheck" datasource="#request.dsn#">
				SELECT pagetitle
				FROM page
				WHERE pagetitle = <cfqueryparam value="#pageinstallquery.pagetitle#" cfsqltype="CF_SQL_VARCHAR">
				AND NodeID = <cfqueryparam value="#url.node#" cfsqltype="cf_sql_integer">
			</cfquery>
	
			<!--- Get ParentPageID for insert below into Page table. --->
			<cfquery name="getHomePageID" datasource="#request.dsn#">
				SELECT pageid
				FROM page
				WHERE parentpageid = 0
					AND NodeID = <cfqueryparam value="#url.node#" cfsqltype="cf_sql_integer">
			</cfquery>
		
			<cfif NOT dupecheck.recordcount>
			<!--- Insert page info --->
				<cfif NOT url.testmode and url.pages EQ 1>
					<cfquery name="insertpage" datasource="#request.dsn#">
						INSERT INTO page(
							parentpageID,
							pagetemplateid,	
							nodeid,
							pageTitle,
							pageNavTitle,
							approvallevel,
							CreatorUserID,
							CreateDate
							)
						Values(
							<cfqueryparam value="#getHomePageID.PageID#" cfsqltype="cf_sql_integer">
							,<cfqueryparam value="#getpagetemplateid.pagetemplateid#" cfsqltype="CF_SQL_VARCHAR">
							,<cfqueryparam value="#url.node#" cfsqltype="cf_sql_integer">
							,<cfqueryparam value="#trim(pageinstallquery.pagetitle)#" cfsqltype="CF_SQL_VARCHAR">
							,<cfqueryparam value="#trim(pageinstallquery.pagenavtitle)#" cfsqltype="CF_SQL_VARCHAR">
							,4
							,4295
							,#CreateODBCDateTime(now())#
							)
						SELECT @@IDENTITY pageID
					</cfquery>

					<!--- ADD LOGIN PAGE CONTENT HERE IS TURNED ON --->
					<cfif NOT url.testmode and url.pages EQ 1 and url.pageslogin EQ 1>
						<cfquery name="insertpage" datasource="#request.dsn#">
							INSERT INTO page(
								parentpageID,
								pagetemplateid,	
								nodeid,
								pageTitle,
								pageNavTitle,
								approvallevel,
								CreatorUserID,
								CreateDate
								)
							Values(
								<cfqueryparam value="#getHomePageID.PageID#" cfsqltype="cf_sql_integer">
								,<cfqueryparam value="#getpagetemplateid.pagetemplateid#" cfsqltype="CF_SQL_VARCHAR">
								,<cfqueryparam value="#url.node#" cfsqltype="cf_sql_integer">
								,<cfqueryparam value="#trim(pageinstallquery.pagetitle)#" cfsqltype="CF_SQL_VARCHAR">
								,<cfqueryparam value="#trim(pageinstallquery.pagenavtitle)#" cfsqltype="CF_SQL_VARCHAR">
								,4
								,4295
								,#CreateODBCDateTime(now())#
								)
							SELECT @@IDENTITY pageID
						</cfquery>
					</cfif>
					
					<!--- Insert page content --->
					<cfquery name="insertpagecontent" datasource="#request.dsn#">			
						INSERT INTO PageContent
							(
							PageID,
							HTMLContent,
							TemplatePosition,
							CreatorUserID,
							CreateDate,
							ApplicationPK
							)
						VALUES 
							(
							<cfqueryparam value="#insertpage.pageid#" cfsqltype="CF_SQL_INTEGER">
							,<cfqueryparam value="#pageinstallquery.pagecontent#" cfsqltype="CF_SQL_VARCHAR">
							,'c1'
							,4295
							,#CreateODBCDateTime(now())#
							,0
							)
					</cfquery>

					<cfif NOT url.testmode and url.pages EQ 1 and url.pageslogin EQ 1>
						<!--- Insert LOGIN page content --->
						<cfquery name="insertpagecontent" datasource="#request.dsn#">			
							INSERT INTO PageContent
								(
								PageID,
								HTMLContent,
								TemplatePosition,
								CreatorUserID,
								CreateDate,
								ApplicationPK
								)
							VALUES 
								(
								<cfqueryparam value="#insertpage.pageid#" cfsqltype="CF_SQL_INTEGER">
								,<cfqueryparam value="#pageinstallquery.pagecontent#" cfsqltype="CF_SQL_VARCHAR">
								,'c1'
								,4295
								,#CreateODBCDateTime(now())#
								,0
								)
						</cfquery>
					</cfif>
				</cfif>
			</cfif>
		</cfoutput>
	</cftransaction>

<cfelse>

	TEST MODE - NO PAGES INSERTED<br><br>

</cfif>

DONE!