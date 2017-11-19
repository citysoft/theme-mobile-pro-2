<!--- This script installs the content sections into CE for use in the Mobile Pro 2 theme --->
<!--- URL to run script:
Option #1 - If you are using an extension folder to run the deployment script (which allows you to bypass the "check request" 
security filter), then your deployment url might look like the following:
http://www.domain.com/index.cfm?fuseaction=themeDeploy.installmobilePro2&testmode=1&sections=1&pages=1&node=1&themename=webthemeimages&images=1&showerrors=1

Option #2 - If you want to run the file directly, the url might look similar to the following (but would need to be added as
an exception in the "check request" security filter in order to run):
http://www.domain.com/_data/n_0001/scripts/mobilePro2InstallScript.cfm?testmode=1&sections=1&pages=1&showerrors=1 
change testmode from 1 to 0 to run it. --->
<cfparam name="variables.themename" default="MobilePro2" type="string">
<cfparam name="url.testmode" type="boolean" default="true">
<cfparam name="url.sections" type="boolean" default="false">
<cfparam name="url.pages" type="boolean" default="false">
<cfparam name="url.images" type="boolean" default="false"><!--- If this is 1, then /global/ directory; if 0, then use node directory --->
<cfparam name="url.node" type="numeric" default=1><!--- If this is 0, that indicates the /global/ directory --->
<cfparam name="variables.callouttext" type="string" default="<h3>LORUM IPSUM DOLORUM</h3><p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.<br><a href=''>Read More</a></p><p><a href='' class='btn btn-primary' role='button'>Dark Button &raquo;</a> <a href='' class='btn btn-default' role='button'>Light Button &raquo;</a></p>">

<cfif isDefined("url.images") AND url.images EQ 1>
	<cfset variables.impagepath = "global">
<cfelseif isDefined("url.images") AND url.images EQ 0>
	<cfset variables.impagepath = "n_" & NumberFormat(url.node, "0009")>
</cfif>

<cfif isDefined("url.themename") AND url.themename NEQ "">
	<cfset variables.themename = url.themename>
</cfif>

SETTINGS SUMMARY<br>
<cfoutput>
<cfif isDefined("variables.themename") AND variables.themename NEQ "">
	#variables.themename#<br>
</cfif>
<cfif isDefined("url.testmode") AND url.testmode EQ 1>
	<p style="color: red; font-weight:bold;">TEST MODE ONLY - NO INSERTS INTO CE DB</p>
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
<cfif isDefined("url.node")>
	NODEID = #url.node#<br>
</cfif>
<cfif isDefined("variables.impagepath")>
	PATH TO THEME IMAGES = #variables.impagepath#<br>
</cfif>
</cfoutput>

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

		<!--- Slide Sections --->
		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Slide 1" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img src='../_data/#variables.impagepath#/images/#variables.themename#/main_img_new1.jpg' alt=''>" ) />

		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Slide 2" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img src='../_data/#variables.impagepath#/images/#variables.themename#/main_img_new1.jpg' alt=''>" ) />

		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Slide 3" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img src='../_data/#variables.impagepath#/images/#variables.themename#/main_img_new1.jpg' alt=''>" ) />

		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Slide 4" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img src='../_data/#variables.impagepath#/images/#variables.themename#/main_img_new1.jpg' alt=''>" ) />
		
		<!--- Call Out Sections --->
		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Call Out Graphic1" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img data-src='holder.js/100%x200' alt='100%x200' src='/_data/#variables.impagepath#/images/#variables.themename#/hm-box-img-1.jpg' data-holder-rendered='true' style='width: 100%; display: block;'>" ) />
		
		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Call Out Text1" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "#variables.callouttext#" ) />
		
		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Call Out Graphic2" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img data-src='holder.js/100%x200' alt='100%x200' src='/_data/#variables.impagepath#/images/#variables.themename#/hm-box-img-2.jpg' data-holder-rendered='true' style='width: 100%; display: block;'>" ) />

		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Call Out Text2" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "#variables.callouttext#" ) />

		<cfset QueryAddRow( sectioninstallquery ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiontitle", "Call Out Graphic3" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectiondescription", "#variables.sectiondescription#" ) />
		<cfset QuerySetCell( sectioninstallquery, "sectioncontent", "<img data-src='holder.js/100%x200' alt='100%x200' src='/_data/#variables.impagepath#/images/#variables.themename#/hm-box-img-3.jpg' data-holder-rendered='true' style='width: 100%; display: block;'>" ) />

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

	<!--- Get Page Template --->
	<cfquery name="getpagetemplateid" datasource="#request.dsn#">
		SELECT pagetemplateid
		FROM pagetemplate
		WHERE name = <cfqueryparam value="div_c1" cfsqltype="CF_SQL_VARCHAR">
	</cfquery>

<cfdump var="#pageinstallquery#" label=""/>

<cfif isDefined("url.testmode") AND url.testmode EQ 0>

	<!--- Insert to the Destination DB --->
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
			</cfif>
		</cfif>
	</cfoutput>

<cfelse>

	TEST MODE - NO PAGES INSERTED<br><br>

</cfif>

DONE!