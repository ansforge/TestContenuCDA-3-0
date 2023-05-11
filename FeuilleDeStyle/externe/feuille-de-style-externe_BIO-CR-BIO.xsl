<?xml version="1.0" encoding="utf-8"?>
<!--
  Title : cda_asip_BIO_CR_BIO.xsl
  =======================================================================================================================================================
  This StyleSheet is based on the StyleSheet "Modular CDA XSL StyleSheet (cda_modular.xsl)" made by Alchuler Associates LCC.
  Below is the original declaration of Alschuler Associates LCC
  Title: Modular CDA XSL StyleSheet
  Version: 3.0
  Specification: ANSI/HL7 CDA, R2-2005  
  The current version and documentation are available at www.alschulerassociates.com/cda/?topic=cda-xsl. 
  We welcome feedback to tools@alschulerassociates.com
  The stylesheet is the cumulative work of several developers; the most significant prior milestones were the foundation work from HL7 
  Germany and Finland (Tyylitiedosto) and HL7 US (Calvin Beebe), and the presentation approach from Tony Schaller, medshare GmbH provided at IHIC 2009. 
  =======================================================================================================================================================
  Suivi des version de la feuille de style française (ANS) :
    - Version : 1.0 (06/01/2023)
  =======================================================================================================================================================
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:n1="urn:hl7-org:v3"
	xmlns:exsl="http://exslt.org/common" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:lab="urn:oid:1.3.6.1.4.1.19376.1.3.2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:xad="http://uri.etsi.org/01903/v1.2.2#"
	xsi:schemaLocation="urn:hl7-org:v3 ../infrastructure/cda/CDA_extended.xsd">
	<xsl:output method="html" indent="yes" version="4.01" encoding="utf-8"
		doctype-system="http://www.w3.org/TR/html4/strict.dtd"
		doctype-public="-//W3C//DTD HTML 4.01//EN"/>

	<xsl:template match="xsl:stylesheet">
		<xsl:apply-templates select="n1:ClinicalDocument"/>
	</xsl:template>
	<xsl:template match="n1:ClinicalDocument">
		<html>
			<head>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<style>
					@media screen and (max-width : 320px){
					    body{
					        font-family: Calibri, sans-serif;
					    }
					    h1{
					    }
					    h2{
					        margin: 0px;
					    }
					    table{
					        border-collapse: collapse;
					    }
					    th{
					        padding: 0px 1px 0px 1px;
					
					    }
					    tr{
					        font-weight: normal;
					    }
					    td{
					        padding: 0px 1px 0px 1px;
					    }
					    #header img,
					    #header p,
					    #header h2{
					        margin: 0px 5px 0px 5px;
					    }
					    .data{
					        font-style: italic;
					        color: rgb(0, 112, 192);
					    }
					}
					@media screen and (min-width : 320px){
					    body{
					        font-family: Calibri, sans-serif;
					    }
					    h1{
					    }
					    h2{
					        margin: 0px;
					    }
					    table{
					        border-collapse: collapse;
					    }
					    th{
					        padding: 0px 2px 0px 2px;
					
					    }
					    tr{
					        font-weight: normal;
					    }
					    td{
					        padding: 0px 2px 0px 2px;
					    }
					    #header img,
					    #header p,
					    #header h2{
					        margin: 0px 10px 0px 10px;
					    }
					    .data{
					        font-style: italic;
					        color: rgb(0, 112, 192);
					    }
					}
					
					@media screen and (min-width : 480px){
					    body{
					        font-family: Calibri, sans-serif;
					    }
					    h1{
					    }
					    h2{
					        margin: 0px;
					    }
					    table{
					        border-collapse: collapse;
					    }
					    th{
					        padding: 0px 3px 0px 3px;
					
					    }
					    tr{
					        font-weight: normal;
					    }
					    td{
					        padding: 0px 3px 0px 3px;
					    }
					    #header img,
					    #header p,
					    #header h2{
					        margin: 0px 15px 0px 15px;
					    }
					    .data{
					        font-style: italic;
					        color: rgb(0, 112, 192);
					    }
					}
					
					@media screen and (min-width : 600px){
					    body{
					        font-family: Calibri, sans-serif;
					    }
					    h1{
					    }
					    h2{
					        margin: 0px;
					    }
					    table{
					        border-collapse: collapse;
					    }
					    th{
					        padding: 0px 3.76px 0px 3.76px;
					
					    }
					    tr{
					        font-weight: normal;
					    }
					    td{
					        padding: 0px 3.76px 0px 3.76px;
					    }
					    #header img,
					    #header p,
					    #header h2{
					        margin: 0px 18.8px 0px 18.8px;
					    }
					    .data{
					        font-style: italic;
					        color: rgb(0, 112, 192);
					    }
					}
					
					@media screen and (min-width : 801px){
					    body{
					        font-family: Calibri, sans-serif;
					    }
					    h1{
					    }
					    h2{
					        margin: 0px;
					    }
					    table{
					        border-collapse: collapse;
					    }
					    th{
					        padding: 0px 3.9px 0px 3.9px;
					
					    }
					    tr{
					        font-weight: normal;
					    }
					    td{
					        padding: 0px 3.9px 0px 3.9px;
					    }
					    #header img,
					    #header p,
					    #header h2{
					        margin: 0px 19.53px 0px 19.53px;
					    }
					    .data{
					        font-style: italic;
					        color: rgb(0, 112, 192);
					    }
					}
					
					@media screen and (min-width : 1025px){
					    body{
					        font-family: Calibri, sans-serif;
					    }
					    h1{
					    }
					    h2{
					        margin: 0px;
					    }
					    table{
					        border-collapse: collapse;
					    }
					    th{
					        padding: 0px 5px 0px 5px;
					
					    }
					    tr{
					        font-weight: normal;
					    }
					    td{
					        padding: 0px 5px 0px 5px;
					    }
					    #header img,
					    #header p,
					    #header h2{
					        margin: 0px 25px 0px 25px;
					    }
					    .data{
					        font-style: italic;
					        color: rgb(0, 112, 192);
					    }
					}
					
					@media screen and (min-width : 1281px){
					    body{
					        font-family: Calibri, sans-serif;
					    }
					    h1{
					    }
					    h2{
					        margin: 0px;
					    }
					    table{
					        border-collapse: collapse;
					    }
					    th{
					        padding: 0px 6.25px 0px 6.25px;
					
					    }
					    tr{
					        font-weight: normal;
					    }
					    td{
					        padding: 0px 6.25px 0px 6.25px;
					    }
					    #header img,
					    #header p,
					    #header h2{
					        margin: 0px 31.25px 0px 31.25px;
					    }
					    .data{
					        font-style: italic;
					        color: rgb(0, 112, 192);
					    }
					}</style>
				<title>
					<xsl:value-of select="n1:title"/>
				</title>
			</head>
			<body>
				<table id="header">
					<tr>
						<td>
							<xsl:call-template name="printLogo"/>
						</td>
						<td>
							<h2 class="data">
								<xsl:value-of select="n1:custodian//n1:name"/>
							</h2>
							<p>
								<span class="data">
									<xsl:call-template name="show-address">
										<xsl:with-param name="address" select="n1:custodian//n1:addr"
										/>
									</xsl:call-template>
									<xsl:for-each select="n1:custodian//n1:telecom[@use = 'PUB']">
										<xsl:call-template name="show-telecom">
											<xsl:with-param name="telecom" select="."/>
										</xsl:call-template>
										<br/>
									</xsl:for-each>
								</span> Médecin biologiste responsable: <xsl:call-template
									name="printNameAndId">
									<xsl:with-param name="ref"
										select="n1:legalAuthenticator/n1:assignedEntity"/>
								</xsl:call-template>
							</p>
						</td>
					</tr>
				</table>

				<h1 class="data">
					<xsl:value-of select="//n1:title"/>
				</h1>
				<table class="header_table">
					<tbody>
						<tr>
							<td>
								<span class="td_label">
									<xsl:text>Produit le</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="printDate">
									<xsl:with-param name="date" select="n1:effectiveTime/@value"/>
								</xsl:call-template>
							</td>
						</tr>
						<xsl:call-template name="show-patient-name">
							<xsl:with-param name="name" select="n1:recordTarget//n1:patient/n1:name"/>
						</xsl:call-template>
						<tr>
							<td width="20%">
								<span class="td_label">
									<xsl:text>Date de naissance</xsl:text>
								</span>
							</td>
							<td width="80%">
								<xsl:call-template name="show-time">
									<xsl:with-param name="datetime"
										select="n1:recordTarget//n1:patient/n1:birthTime"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td width="15%">
								<span class="td_label">
									<xsl:text>Sexe</xsl:text>
								</span>
							</td>
							<td>
								<xsl:for-each
									select="n1:recordTarget//n1:patient/n1:administrativeGenderCode">
									<xsl:call-template name="show-gender"/>
								</xsl:for-each>
							</td>
						</tr>
						<xsl:if test="n1:recordTarget//n1:patient/n1:birthplace/n1:place">
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Lieu de naissance</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:if
										test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:name">
										<xsl:call-template name="show-name">
											<xsl:with-param name="name"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:name"
											/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if
										test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr">
										<xsl:call-template name="show-address-city">
											<xsl:with-param name="address"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr"
											/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td width="20%">
									<xsl:if
										test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr/n1:county">
										<span class="td_label">
											<xsl:text>Code INSEE du lieu de naissance</xsl:text>
										</span>
									</xsl:if>
								</td>
								<td colspan="3">
									<xsl:if
										test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr">
										<xsl:call-template name="show-address-county">
											<xsl:with-param name="address"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr"
											/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td>
								<span class="td_label">
									<xsl:text>Adresse</xsl:text>
								</span>
							</td>
							<td>
								<xsl:call-template name="show-address-patient">
									<xsl:with-param name="address"
										select="n1:recordTarget/n1:patientRole/n1:addr"/>
								</xsl:call-template>
							</td>
						</tr>
						<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:telecom">
							<tr>
								<td>
									<span class="td_label">
										<xsl:text>Telécom</xsl:text>
									</span>
								</td>
								<td>
									<xsl:call-template name="show-telecom">
										<xsl:with-param name="telecom" select="."/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td>
								<span class="td_label">
									<xsl:text>INS</xsl:text>
								</span>
							</td>
							<td>
								<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:id">
									<xsl:choose>
										<xsl:when test="@root = '1.2.250.1.213.1.4.8'">
											<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
											</xsl:call-template>
											<xsl:text>&#160;</xsl:text>
											<xsl:text>[NIR]</xsl:text>
										</xsl:when>
										<xsl:when test="@root = '1.2.250.1.213.1.4.9'">
											<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
											</xsl:call-template>
											<xsl:text>&#160;</xsl:text>
											<xsl:text>[NIA]</xsl:text>
										</xsl:when>
										<xsl:when test="@root = '1.2.250.1.213.1.4.10'">
											<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
											</xsl:call-template>
											<xsl:text>&#160;</xsl:text>
											<xsl:text>[TEST]</xsl:text>
										</xsl:when>
										<xsl:when test="@root = '1.2.250.1.213.1.4.11'">
											<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
											</xsl:call-template>
											<xsl:text>&#160;</xsl:text>
											<xsl:text>[DEMO]</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>&#160;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td>
								<span class="td_label">
									<xsl:text>IPP</xsl:text>
								</span>
							</td>
							<td>
								<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:id">
									<xsl:if
										test="
											(@root != '1.2.250.1.213.1.4.8') and (@root != '1.2.250.1.213.1.4.9')
											and (@root != '1.2.250.1.213.1.4.10') and (@root != '1.2.250.1.213.1.4.11')">
										<xsl:call-template name="show-id">
											<xsl:with-param name="id" select="."/>
										</xsl:call-template>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td>
								<span class="td_label">
									<xsl:text>Représentant du patient</xsl:text>
								</span>
							</td>
							<td>
								<xsl:if test="n1:recordTarget//n1:patient/n1:guardian">
									<xsl:for-each select="n1:recordTarget//n1:patient/n1:guardian">
										<xsl:call-template name="show-guardian">
											<xsl:with-param name="guardian" select="."/>
										</xsl:call-template>
									</xsl:for-each>
								</xsl:if>
							</td>
						</tr>
					</tbody>
				</table>
				<p> Demande d'examens <span class="data">
					<xsl:value-of select="n1:documentationOf/n1:serviceEvent/n1:id/@extension"/>
					</span> prescrite le <xsl:call-template name="printDate">
						<xsl:with-param name="date"
							select="n1:participant[@typeCode = 'REF']/n1:time/n1:high/@value"/>
					</xsl:call-template> par <xsl:call-template name="printNameAndId">
						<xsl:with-param name="ref"
							select="n1:participant[@typeCode = 'REF']/n1:associatedEntity"/>
					</xsl:call-template>
					<br/> Echantillons biologiques prélevés le <xsl:call-template name="printDate">
						<xsl:with-param name="date"
							select="n1:participant[@typeCode = 'PRF']/n1:time/n1:high/@value"/>
					</xsl:call-template> par <xsl:call-template name="printNameAndId">
						<xsl:with-param name="ref"
							select="n1:participant[@typeCode = 'PRF']/n1:associatedEntity"/>
					</xsl:call-template>
					<br/> Examens réalisés du <xsl:call-template name="printDate">
						<xsl:with-param name="date"
							select="n1:documentationOf/n1:serviceEvent/n1:effectiveTime/n1:low/@value"/>
					</xsl:call-template> au <xsl:call-template name="printDate">
						<xsl:with-param name="date"
							select="n1:documentationOf/n1:serviceEvent/n1:effectiveTime/n1:high/@value"
						/>
					</xsl:call-template>
				</p>
				<xsl:apply-templates select="n1:component/n1:structuredBody"/>
				<br/>
				<table>
					<tr>
						<th>Biologistes médicaux ayant participé à l'interprétation du compte
							rendu</th>
						<th>Date &amp; heure</th>
					</tr>

					<xsl:for-each select="n1:authenticator">
						<tr>
							<td>
								<xsl:call-template name="printNameAndId">
									<xsl:with-param name="ref" select="n1:assignedEntity"/>
								</xsl:call-template>

							</td>
							<td>
								<xsl:call-template name="printDateAndTime">
									<xsl:with-param name="date" select="n1:time/@value"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:if test="not(n1:authenticator/n1:assignedEntity)">
						<tr>
							<td>
								<xsl:call-template name="printNameAndId">
									<xsl:with-param name="ref"
										select="n1:legalAuthenticator/n1:assignedEntity"/>
								</xsl:call-template>
							</td>
							<td>
								<xsl:call-template name="printDateAndTime">
									<xsl:with-param name="date"
										select="n1:legalAuthenticator/n1:time/@value"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<tr>
						<td>
							<xsl:call-template name="directeur_signe"/>
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="printNameAndId">
		<xsl:param name="ref"/>
		<span class="data">
			<xsl:value-of select="$ref/n1:assignedPerson/n1:name | $ref/n1:associatedPerson/n1:name"/>
		</span>
		<xsl:text>(</xsl:text>
		<span class="data">
			<xsl:value-of select="$ref//n1:id/@extension"/>
		</span>
		<xsl:text>)</xsl:text>
	</xsl:template>

	<xsl:template name="printDate">
		<xsl:param name="date"/>
		<span class="data">
			<xsl:value-of select="substring($date, 7, 2)"/>
		</span>
		<xsl:text>/</xsl:text>
		<span class="data">
			<xsl:value-of select="substring($date, 5, 2)"/>
		</span>
		<xsl:text>/</xsl:text>
		<span class="data">
			<xsl:value-of select="substring($date, 1, 4)"/>
		</span>
	</xsl:template>

	<xsl:template name="printDateAndTime">
		<xsl:param name="date"/>
		<xsl:call-template name="printDate">
			<xsl:with-param name="date" select="$date"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<span class="data">
			<xsl:value-of select="substring($date, 9, 2)"/>
		</span>
		<xsl:text>:</xsl:text>
		<span class="data">
			<xsl:value-of select="substring($date, 11, 2)"/>
		</span>
	</xsl:template>

	<xsl:template name="printLogo">
		<img
			src="data:image/jpeg;base64,
			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
			eW4Gc5/gNMjRo0H/2Q==
			"
		/>
	</xsl:template>

	<xsl:template name="directeur_signe">
		<br/>
		<img
			src="data:image/jpeg;base64,
			iVBORw0KGgoAAAANSUhEUgAAAK8AAACvAQMAAACxXBw2AAAAB3RJTUUH2woPDAQmGYX3JgAAAAlw
			SFlzAAAK8AAACvABQqw0mAAAAAZQTFRFAAAA////pdmf3QAAAShJREFUeNrtl0EOhCAMRcvKJTeC
			mw16M7xRl6xgfkGNmllOITPRpEGfCwv/tyCVT1emB/8TToTLEdloC8t90Me+RiaMHGqoY0cmeXZ2
			BXqRGY1LxJqsnTGE6IarDJi8KH9Xpy+uHkRyEndr6uCttjyTaH8tQCWcTBKzYfp4dZq8Ihbtp1JW
			PDg7Q/8yDGM9kiRHCDhwT1ATxylPWb6PWPhQXhPXWmMDARxdZeiN4yTJwfZkMOZdBk0smTS9nc10
			WRMtDJuJ2WB8U2a78ECcWo810mTsvK+JJm6NRfraVQY9XJupr1OXnSSc+7cWboeFuGVyNNMBWLZR
			uG/bR177BqOPAWF6w92wr+Xt4e95IBYZcFRAclL7XXA7LADDg4ED6+Ov/CA8+NfwG147q3gE6HAP
			AAAAAElFTkSuQmCC
			"
		/>
	</xsl:template>

	<xsl:template match="n1:component/n1:structuredBody">
		<xsl:for-each select="n1:component/n1:section">
			<xsl:comment>Debut body structure</xsl:comment>
			<xsl:call-template name="section"/>
			<xsl:comment>Fin body structure</xsl:comment>
		</xsl:for-each>
	</xsl:template>

	<!-- top level component/section: display title and text,
		and process any nested component/sections
   -->
	<xsl:template name="section">
		<xsl:call-template name="section-title">
			<xsl:with-param name="title" select="n1:title"/>
		</xsl:call-template>
		<xsl:call-template name="section-text"/>
		<xsl:for-each select="n1:component/n1:section">
			<xsl:call-template name="nestedSection">
				<xsl:with-param name="margin" select="2"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<!-- top level section title -->
	<xsl:template name="section-title">
		<xsl:param name="title"/>
		<h3>
			<xsl:value-of select="$title"/>
		</h3>
	</xsl:template>

	<!-- top-level section Text   -->
	<xsl:template name="section-text">
		<div>
			<xsl:apply-templates select="n1:text"/>
		</div>
	</xsl:template>
	<xsl:template name="renderTextB64">
		<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
		<xsl:variable name="node-set" select="function-available('exsl:node-set')"/>
		<xsl:choose>
			<xsl:when test="$vendor = 'libxslt' and $node-set">
				<!-- Le navigateur est soit safari version 3.x et superieure 
		soit google chrome version 2.x et superieure -->
				<!-- On peut donc afficher le pdf -->
				<xsl:element name="object">
					<xsl:attribute name="type">
						<xsl:value-of select="n1:text/@mediaType"/>
					</xsl:attribute>
					<xsl:attribute name="width">800px></xsl:attribute>
					<xsl:attribute name="height">600px</xsl:attribute>
					<xsl:attribute name="data">data:<xsl:value-of select="n1:text/@mediaType"
					/>;base64,<xsl:value-of select="n1:text"/>
					</xsl:attribute>
				</xsl:element>
			</xsl:when>
			<xsl:when test="$vendor = 'Opera' and $node-set">
				<!-- Le navigateur est opera 9.x et superieure -->
				<!-- On peut donc afficher le pdf -->
				<xsl:element name="object">
					<xsl:attribute name="type">
						<xsl:value-of select="n1:text/@mediaType"/>
					</xsl:attribute>
					<xsl:attribute name="width">800px></xsl:attribute>
					<xsl:attribute name="height">600px</xsl:attribute>
					<xsl:attribute name="data">data:<xsl:value-of select="n1:text/@mediaType"
					/>;base64,<xsl:value-of select="n1:text"/>
					</xsl:attribute>
				</xsl:element>
			</xsl:when>
			<xsl:when test="$vendor = 'Transformiix' and $node-set">
				<!-- Le navigateur est Firefox version 3.x ou superieure -->
				<!-- Le pdf ne sera disponble que sous forme de lien -->
				<xsl:text>Enregistrer le document PDF (clic droit "puis enregistrer sous") : </xsl:text>
				<xsl:element name="a">
					<xsl:attribute name="href">data:<xsl:value-of select="n1:text/@mediaType"
					/>;base64,<xsl:value-of select="n1:text"/>
					</xsl:attribute>
					<xsl:text>ici</xsl:text>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<!-- Navigaeur non pris en charge -->
				<xsl:text>Ce document contient un fichier PDF qui ne peut être affiché par ce
					navigateur</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- nested component/section -->
	<xsl:template name="nestedSection">
		<xsl:param name="margin"/>
		<h4 style="margin-left : {$margin}em;">
			<xsl:value-of select="n1:title"/>
		</h4>
		<div style="margin-left : {$margin}em;">
			<xsl:apply-templates select="n1:text"/>
		</div>
		<xsl:for-each select="n1:component/n1:section">
			<xsl:call-template name="nestedSection">
				<xsl:with-param name="margin" select="2 * $margin"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<!--   paragraph  -->
	<xsl:template match="n1:paragraph">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<!--   pre format  -->
	<xsl:template match="n1:pre">
		<pre>
	  <xsl:apply-templates/>
	</pre>
	</xsl:template>
	<!--   Content w/ deleted text is hidden -->
	<xsl:template match="n1:content[@revised = 'delete']"/>
	<!--   content  -->
	<xsl:template match="n1:content">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- line break -->
	<xsl:template match="n1:br">
		<xsl:element name="br">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<!--   list  -->
	<xsl:template match="n1:list">
		<xsl:if test="n1:caption">
			<p>
				<b>
					<xsl:apply-templates select="n1:caption"/>
				</b>
			</p>
		</xsl:if>
		<ul>
			<xsl:for-each select="n1:item">
				<li>
					<xsl:apply-templates/>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template match="n1:list[@listType = 'ordered']">
		<xsl:if test="n1:caption">
			<span style="font-weight:bold; ">
				<xsl:apply-templates select="n1:caption"/>
			</span>
		</xsl:if>
		<ol>
			<xsl:for-each select="n1:item">
				<li>
					<xsl:apply-templates/>
				</li>
			</xsl:for-each>
		</ol>
	</xsl:template>
	<!--   caption  -->
	<xsl:template match="n1:caption">
		<xsl:apply-templates/>
		<xsl:text>: </xsl:text>
	</xsl:template>
	<!--  Tables   -->
	<xsl:template
		match="n1:table/@* | n1:thead/@* | n1:tfoot/@* | n1:tbody/@* | n1:colgroup/@* | n1:col/@* | n1:tr/@* | n1:th/@* | n1:td/@*">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="n1:table">
		<table class="table">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	<xsl:template match="n1:thead">
		<thead>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</thead>
	</xsl:template>
	<xsl:template match="n1:tfoot">
		<tfoot>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tfoot>
	</xsl:template>
	<xsl:template match="n1:tbody">
		<tbody>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tbody>
	</xsl:template>
	<xsl:template match="n1:colgroup">
		<colgroup>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</colgroup>
	</xsl:template>
	<xsl:template match="n1:col">
		<col>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</col>
	</xsl:template>
	<xsl:template match="n1:tr">
		<tr class="tr">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tr>
	</xsl:template>
	<xsl:template match="n1:th">
		<th class="th">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</th>
	</xsl:template>
	<xsl:template match="n1:td">
		<td>
			<xsl:choose>
				<xsl:when test="@styleCode = 'Bold'">
					<xsl:element name="b">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="@styleCode = 'Italics'">
					<xsl:element name="i">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="@styleCode = 'Underline'">
					<xsl:element name="u">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="@*"/>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</td>
	</xsl:template>
	<xsl:template match="n1:table/n1:caption">
		<span style="font-weight:bold; ">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!--   RenderMultiMedia 
	this currently only handles GIF's and JPEG's.  It could, however,
	be extended by including other image MIME types in the predicate
	and/or by generating <object> or <applet> tag with the correct
	params depending on the media type  @ID  =$imageRef  referencedObject
	-->
	<xsl:template match="n1:renderMultiMedia">
		<xsl:variable name="imageRef" select="@referencedObject"/>
		<xsl:choose>
			<xsl:when test="//n1:regionOfInterest[@ID = $imageRef]">
				<!-- Here is where the Region of Interest image referencing goes -->
				<xsl:if
					test="
					//n1:regionOfInterest[@ID = $imageRef]//n1:observationMedia/n1:value[@mediaType = 'image/gif' or
						@mediaType = 'image/jpeg' or @mediaType = 'image/png']">
					<br clear="all"/>
					<xsl:element name="img">
						<xsl:attribute name="src">
							<xsl:value-of
								select="//n1:regionOfInterest[@ID = $imageRef]//n1:observationMedia/n1:value/n1:reference/@value"
							/>
						</xsl:attribute>
					</xsl:element>
				</xsl:if>
				<!-- Here is where the Region of Interest image referencing goes -->
				<xsl:if
					test="//n1:regionOfInterest[@ID = $imageRef]//n1:observationMedia/n1:value[@mediaType = 'text/xml' or @mediaType = 'application/pdf']">
					<br clear="all"/>
					<xsl:element name="p">
						<xsl:value-of
							select="//n1:regionOfInterest[@ID = $imageRef]//n1:observationMedia/n1:value/n1:reference/@value"
						/>
					</xsl:element>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
				<xsl:variable name="node-set" select="function-available('exsl:node-set')"/>
				<!-- Here is where the direct MultiMedia image referencing goes -->
				<xsl:if
					test="//n1:observationMedia[@ID = $imageRef]/n1:value[@mediaType = 'image/gif' or @mediaType = 'image/jpeg' or @mediaType = 'image/png']">
					<br clear="all"/>
					<xsl:element name="IMG">
						<!-- <xsl:attribute name='alt'>L'image du document ne peut pas être visualisée avec ce navigateur.</xsl:attribute> -->
						<xsl:attribute name="id">
							<xsl:value-of select="$imageRef"/>
						</xsl:attribute>
						<xsl:attribute name="src">data:<xsl:value-of
							select="//n1:observationMedia[@ID = $imageRef]/n1:value/@mediaType"
							/>;base64, <xsl:value-of
								select="//n1:observationMedia[@ID = $imageRef]/n1:value"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:if>
				<!--SESAM VITAL 1  -->
				<xsl:if
					test="//n1:observationMedia[@ID = $imageRef]/n1:value[@mediaType = 'text/xml']">
					<br clear="all"/>
					<xsl:choose>
						<xsl:when test="$vendor = 'libxslt' and $node-set">
							<!-- Le navigateur est soit safari version 3.x et superieure soit google chrome version 2.x et superieure -->
							<!-- On peut donc afficher le sesam -->
							<xsl:element name="object">
								<xsl:attribute name="type">
									<xsl:value-of
										select="//n1:observationMedia[@ID = $imageRef]/n1:value/@mediaType"
									/>
								</xsl:attribute>

								<xsl:attribute name="id">
									<xsl:value-of select="$imageRef"/>
								</xsl:attribute>
								<xsl:attribute name="data">data:<xsl:value-of
									select="//n1:observationMedia[@ID = $imageRef]/n1:value/@mediaType"
									/>;base64, <xsl:value-of
										select="//n1:observationMedia[@ID = $imageRef]/n1:value"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:when>

						<xsl:when test="$vendor = 'Transformiix' and $node-set">
							<!-- Le navigateur est firefox  -->
							<!-- On peut donc afficher le sesam -->
							<xsl:element name="object">
								<xsl:attribute name="type">
									<xsl:value-of
										select="//n1:observationMedia[@ID = $imageRef]/n1:value/@mediaType"
									/>
								</xsl:attribute>
								<xsl:attribute name="id">
									<xsl:value-of select="$imageRef"/>
								</xsl:attribute>
								<xsl:attribute name="data">data:<xsl:value-of
									select="//n1:observationMedia[@ID = $imageRef]/n1:value/@mediaType"
									/>;base64, <xsl:value-of
										select="//n1:observationMedia[@ID = $imageRef]/n1:value"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>Ce document contient des données (SESAM vitale) qui ne peuvent être affichées par ce navigateur.</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<!--Données cliniques rapportés  -->
				<xsl:if
					test="//n1:observationMedia[@ID = $imageRef]/n1:value[@mediaType = 'application/pdf']">
					<xsl:choose>
						<xsl:when test="$vendor = 'libxslt' and $node-set">
							<!-- Le navigateur est soit safari version 3.x et superieure soit google chrome version 2.x et superieure -->
							<!-- On peut donc afficher le pdf -->
							<xsl:element name="object">
								<xsl:attribute name="id">
									<xsl:value-of select="$imageRef"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of
										select="//n1:observationMedia[@ID = $imageRef]/n1:value/@mediaType"
									/>
								</xsl:attribute>
								<xsl:attribute name="width">800px></xsl:attribute>
								<xsl:attribute name="height">600px</xsl:attribute>
								<xsl:attribute name="data">data:<xsl:value-of
									select="//n1:observationMedia[@ID = $imageRef]/n1:value/@mediaType"
										/>;base64,<xsl:value-of
											select="//n1:observationMedia[@ID = $imageRef]/n1:value"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:when>
						<xsl:when test="$vendor = 'Transformiix' and $node-set">
							<!-- Le navigateur est firefox -->
							<!-- On peut donc afficher le pdf -->
							<xsl:element name="object">
								<xsl:attribute name="id">
									<xsl:value-of select="$imageRef"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of
										select="//n1:observationMedia[@ID = $imageRef]/n1:value/@mediaType"
									/>
								</xsl:attribute>
								<xsl:attribute name="width">800px></xsl:attribute>
								<xsl:attribute name="height">600px</xsl:attribute>
								<xsl:attribute name="data">data:<xsl:value-of
									select="//n1:observationMedia[@ID = $imageRef]/n1:value/@mediaType"
										/>;base64,<xsl:value-of
											select="//n1:observationMedia[@ID = $imageRef]/n1:value"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<!-- Navigateur non pris en charge, IE -->
							<xsl:text>Ce document contient un fichier PDF qui ne peut être affiché par ce navigateur.</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="show-address">
		<xsl:param name="address"/>
		<xsl:choose>
			<xsl:when test="$address">
				<xsl:for-each select="$address/n1:streetAddressLine">
					<xsl:value-of select="."/>
					<br/>
				</xsl:for-each>
				<xsl:if test="$address/n1:streetName">
					<xsl:value-of select="$address/n1:houseNumber"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$address/n1:streetNameType"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$address/n1:streetName"/>
					<br/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:postalCode) > 0">
					<xsl:value-of select="$address/n1:postalCode"/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:city) > 0">
					<xsl:text>,&#160;</xsl:text>
					<xsl:value-of select="$address/n1:city"/>
					<br/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:state) > 0">
					<xsl:text>,&#160;</xsl:text>
					<xsl:value-of select="$address/n1:state"/>
					<br/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:country) > 0">
					<xsl:text>,&#160;</xsl:text>
					<xsl:value-of select="$address/n1:country"/>
					<br/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>addresse non renseignée</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="show-telecom">
		<xsl:param name="telecom"/>
		<xsl:choose>
			<xsl:when test="$telecom">
				<xsl:variable name="type" select="substring-before($telecom/@value, ':')"/>
				<xsl:variable name="value" select="substring-after($telecom/@value, ':')"/>
				<xsl:if test="$type">
					<xsl:call-template name="translateTelecomCode">
						<xsl:with-param name="code" select="$type"/>
					</xsl:call-template>
					<xsl:text>: </xsl:text>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$value"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Coordonnées téléphoniques non renseignées</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="translateTelecomCode">
		<xsl:param name="code"/>
		<xsl:choose>
			<xsl:when test="$code = 'tel'">
				<xsl:text>Tél</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'fax'">
				<xsl:text>Fax</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'http'">
				<xsl:text>Page Web</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'mailto'">
				<xsl:text>e-mail</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>{$code='</xsl:text>
				<xsl:value-of select="$code"/>
				<xsl:text>'?}</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- formatDateTime -->
	<xsl:template name="formatDateTime">
		<xsl:param name="date"/>
		<!-- day -->
		<xsl:choose>
			<xsl:when test="substring($date, 7, 1) = &quot;0&quot;">
				<xsl:value-of select="substring($date, 8, 1)"/>
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring($date, 7, 2)"/>
				<xsl:text> </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<!-- month -->
		<xsl:variable name="month" select="substring($date, 5, 2)"/>
		<xsl:choose>
			<xsl:when test="$month = '01'">
				<xsl:text>Janvier </xsl:text>
			</xsl:when>
			<xsl:when test="$month = '02'">
				<xsl:text>Février </xsl:text>
			</xsl:when>
			<xsl:when test="$month = '03'">
				<xsl:text>Mars </xsl:text>
			</xsl:when>
			<xsl:when test="$month = '04'">
				<xsl:text>Avril </xsl:text>
			</xsl:when>
			<xsl:when test="$month = '05'">
				<xsl:text>Mai </xsl:text>
			</xsl:when>
			<xsl:when test="$month = '06'">
				<xsl:text>Juin </xsl:text>
			</xsl:when>
			<xsl:when test="$month = '07'">
				<xsl:text>Juillet </xsl:text>
			</xsl:when>
			<xsl:when test="$month = '08'">
				<xsl:text>Août </xsl:text>
			</xsl:when>
			<xsl:when test="$month = '09'">
				<xsl:text>Septembre </xsl:text>
			</xsl:when>
			<xsl:when test="$month = '10'">
				<xsl:text>Octobre </xsl:text>
			</xsl:when>
			<xsl:when test="$month = '11'">
				<xsl:text>Novembre </xsl:text>
			</xsl:when>
			<xsl:when test="$month = '12'">
				<xsl:text>Décembre </xsl:text>
			</xsl:when>
		</xsl:choose>
		<!-- year -->
		<xsl:value-of select="substring($date, 1, 4)"/>
		<!-- time and US timezone -->
		<xsl:if test="string-length($date) > 8">
			<xsl:text>, </xsl:text>
			<!-- time -->
			<xsl:variable name="time">
				<xsl:value-of select="substring($date, 9, 6)"/>
			</xsl:variable>
			<xsl:variable name="hh">
				<xsl:value-of select="substring($time, 1, 2)"/>
			</xsl:variable>
			<xsl:variable name="mm">
				<xsl:value-of select="substring($time, 3, 2)"/>
			</xsl:variable>
			<xsl:variable name="ss">
				<xsl:value-of select="substring($time, 5, 2)"/>
			</xsl:variable>
			<xsl:if test="string-length($hh) &gt; 1">
				<xsl:value-of select="$hh"/>
				<xsl:if
					test="string-length($mm) &gt; 1 and not(contains($mm, '-')) and not(contains($mm, '+'))">
					<xsl:text>:</xsl:text>
					<xsl:value-of select="$mm"/>
					<xsl:if
						test="string-length($ss) &gt; 1 and not(contains($ss, '-')) and not(contains($ss, '+'))">
						<xsl:text>:</xsl:text>
						<xsl:value-of select="$ss"/>
					</xsl:if>
				</xsl:if>
			</xsl:if>
			<!-- time zone -->
			<xsl:variable name="tzon">
				<xsl:choose>
					<xsl:when test="contains($date, '+')">
						<xsl:text>+</xsl:text>
						<xsl:value-of select="substring-after($date, '+')"/>
					</xsl:when>
					<xsl:when test="contains($date, '-')">
						<xsl:text>-</xsl:text>
						<xsl:value-of select="substring-after($date, '-')"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<!-- reference: http://www.timeanddate.com/library/abbreviations/timezones/na/ -->
				<xsl:when test="$tzon = '-0500'">
					<xsl:text>, EST</xsl:text>
				</xsl:when>
				<xsl:when test="$tzon = '-0600'">
					<xsl:text>, CST</xsl:text>
				</xsl:when>
				<xsl:when test="$tzon = '-0700'">
					<xsl:text>, MST</xsl:text>
				</xsl:when>
				<xsl:when test="$tzon = '-0800'">
					<xsl:text>, PST</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$tzon"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<!-- show-name	-->
	<xsl:template name="show-name">
		<xsl:param name="name"/>
		<xsl:choose>
			<xsl:when test="$name/n1:family">
				<xsl:choose>
					<xsl:when test="$name/n1:suffix">
						<xsl:for-each select="$name/n1:suffix">
							<span style="font-weight:bold; ">
								<xsl:value-of select="."/>
							</span>
							<xsl:text> </xsl:text>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="$name/n1:prefix">
							<span style="font-weight:bold; ">
								<xsl:value-of select="."/>
							</span>
							<xsl:text> </xsl:text>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="$name/n1:given">
					<span style="font-weight:bold; ">
						<xsl:value-of select="."/>
						<xsl:text> </xsl:text>
					</span>
				</xsl:for-each>
				<xsl:for-each select="$name/n1:family">
					<span style="font-weight:bold; ">
						<xsl:value-of select="."/>
					</span>
					<xsl:if test="@qualifier">
						<xsl:choose>
							<xsl:when test="@qualifier = &apos;BR&apos;">
								<xsl:text> (Nom de famille) </xsl:text>
							</xsl:when>
							<xsl:when test="@qualifier = &apos;SP&apos;">
								<xsl:text> (Nom d'usage) </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@qualifier"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<span style="font-weight:bold; ">
					<xsl:value-of select="$name"/>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show-gender	-->
	<xsl:template name="show-gender">
		<xsl:choose>
			<xsl:when test="@code = &apos;M&apos;">
				<xsl:text>Masculin</xsl:text>
			</xsl:when>
			<xsl:when test="@code = &apos;F&apos;">
				<xsl:text>Féminin</xsl:text>
			</xsl:when>
			<xsl:when test="@code = &apos;U&apos;">
				<xsl:text>Inconnu</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- show-address-city -->
	<xsl:template name="show-address-city">
		<xsl:param name="address"/>
		<xsl:choose>
			<xsl:when test="$address">
				<xsl:if test="$address/@use">
					<xsl:text> </xsl:text>
					<xsl:call-template name="translateTelecomCode">
						<xsl:with-param name="code" select="$address/@use"/>
					</xsl:call-template>
					<xsl:text>:</xsl:text>
					<br/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:city) > 0">
					<xsl:text> </xsl:text>
					<xsl:value-of select="$address/n1:city"/>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- show-address-county -->
	<xsl:template name="show-address-county">
		<xsl:param name="address"/>
		<xsl:choose>
			<xsl:when test="$address">
				<xsl:if test="$address/@use">
					<xsl:text> </xsl:text>
					<xsl:call-template name="translateTelecomCode">
						<xsl:with-param name="code" select="$address/@use"/>
					</xsl:call-template>
					<xsl:text>:</xsl:text>
					<br/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:county) > 0">
					<xsl:text> </xsl:text>
					<xsl:value-of select="$address/n1:county"/>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- show-identifiant -->
	<xsl:template name="show-identifiant">
		<xsl:param name="id"/>
		<xsl:choose>
			<xsl:when test="not($id)">
				<xsl:if test="not(@nullFlavor)">
					<xsl:if test="@extension">
						<xsl:value-of select="@extension"/>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not($id/@nullFlavor)">
					<xsl:if test="$id/@extension">
						<xsl:value-of select="$id/@extension"/>
					</xsl:if>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show-id -->
	<xsl:template name="show-id">
		<xsl:param name="id"/>
		<xsl:choose>
			<xsl:when test="not($id)">
				<xsl:if test="not(@nullFlavor)">
					<xsl:if test="@extension">
						<xsl:value-of select="@extension"/>
					</xsl:if>
					<xsl:text> [</xsl:text>
					<xsl:value-of select="@root"/>
					<xsl:text>]</xsl:text>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not($id/@nullFlavor)">
					<xsl:if test="$id/@extension">
						<xsl:value-of select="$id/@extension"/>
					</xsl:if>
					<xsl:text> [</xsl:text>
					<xsl:value-of select="$id/@root"/>
					<xsl:text>]</xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show-guardian	-->
	<xsl:template name="show-guardian">
		<xsl:param name="guardian"/>
		<br/>
		<xsl:for-each select="$guardian/n1:guardianPerson">
			<xsl:call-template name="show-name">
				<xsl:with-param name="name" select="."/>
			</xsl:call-template>
			<br/>
			<xsl:for-each select="$guardian/n1:addr">
				<xsl:call-template name="show-address-patient">
					<xsl:with-param name="address" select="."/>
				</xsl:call-template>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="$guardian/n1:telecom">
				<xsl:call-template name="show-telecom">
					<xsl:with-param name="telecom" select="."/>
				</xsl:call-template>
			</xsl:for-each>
			<br/>
		</xsl:for-each>
		<xsl:for-each select="$guardian/n1:guardianOrganization">
			<xsl:call-template name="show-name">
				<xsl:with-param name="name" select="."/>
			</xsl:call-template>
			<br/>
			<xsl:for-each select="$guardian/n1:addr">
				<xsl:call-template name="show-address-patient">
					<xsl:with-param name="address" select="."/>
				</xsl:call-template>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="$guardian/n1:telecom">
				<xsl:call-template name="show-telecom">
					<xsl:with-param name="telecom" select="."/>
				</xsl:call-template>
				<br/>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	<!-- show-address-patient -->
	<xsl:template name="show-address-patient">
		<xsl:param name="address"/>
		<xsl:choose>
			<xsl:when test="$address">
				<xsl:for-each select="$address/n1:streetAddressLine">
					<xsl:value-of select="."/>
				</xsl:for-each>
				<xsl:if test="$address/n1:streetName">
					<xsl:value-of select="$address/n1:houseNumber"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$address/n1:streetNameType"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$address/n1:streetName"/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:postalCode) > 0">
					<xsl:value-of select="$address/n1:postalCode"/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:city) > 0">
					<xsl:text>,&#160;</xsl:text>
					<xsl:value-of select="$address/n1:city"/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:state) > 0">
					<xsl:text>,&#160;</xsl:text>
					<xsl:value-of select="$address/n1:state"/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:country) > 0">
					<xsl:text>,&#160;</xsl:text>
					<xsl:value-of select="$address/n1:country"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>addresse non renseignée</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show-patient-name	-->
	<xsl:template name="show-patient-name">
		<xsl:param name="name"/>
		<xsl:if test="$name/n1:prefix">
			<tr>
				<td width="20%">
					<span class="td_label">
						<xsl:text>Civilité</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:for-each select="$name/n1:prefix">
						<xsl:value-of select="."/>
						<br/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>

		<xsl:for-each select="$name/n1:family">
			<xsl:choose>
				<xsl:when test="@qualifier">
					<xsl:choose>
						<xsl:when test="@qualifier = &apos;BR&apos;">
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Nom de naissance</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<span style="font-weight:bold; ">
										<xsl:value-of select="."/>
									</span>
								</td>
							</tr>
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Prénom(s)</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:variable name="count" select="count($name/n1:given)"/>
									<xsl:for-each select="$name/n1:given">
										<xsl:choose>
											<xsl:when test="@qualifier = &apos;BR&apos;">
												<span style="font-weight:bold; ">
												<xsl:value-of select="."/>
												</span>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="."/>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="$count > 1">
											<xsl:if
												test="(position() != last()) and (position() > 1)">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:if test="position() = 1">
												<xsl:text> [</xsl:text>
											</xsl:if>
											<xsl:if test="position() = last()">
												<xsl:text>]</xsl:text>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="@qualifier = &apos;SP&apos;">
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Nom d'usage</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<xsl:value-of select="."/>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="@qualifier = &apos;CL&apos;">
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Nom et prénom utilisés</xsl:text>
									</span>
								</td>
								<td colspan="3">
									<span style="font-weight:bold; ">
										<xsl:value-of select="."/>
										<xsl:text>&#160;</xsl:text>
										<xsl:for-each select="$name/n1:given">
											<xsl:if test="@qualifier = &apos;CL&apos;">
												<xsl:value-of select="."/>
											</xsl:if>
											<xsl:text>&#160;</xsl:text>
										</xsl:for-each>
									</span>
								</td>
							</tr>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td width="20%">
							<span class="td_label">
								<xsl:text>Nom</xsl:text>
							</span>
						</td>
						<td colspan="3">
							<xsl:value-of select="."/>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!-- show time -->
	<xsl:template name="show-time">
		<xsl:param name="datetime"/>
		<xsl:choose>
			<xsl:when test="not($datetime)">
				<xsl:call-template name="formatDateTime">
					<xsl:with-param name="date" select="@value"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="formatDateTime">
					<xsl:with-param name="date" select="$datetime/@value"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>