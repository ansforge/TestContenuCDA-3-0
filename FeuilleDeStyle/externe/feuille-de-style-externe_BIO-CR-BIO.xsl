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
	xmlns:n1="urn:hl7-org:v3" xmlns:exsl="http://exslt.org/common"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:lab="urn:oid:1.3.6.1.4.1.19376.1.3.2"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xad="http://uri.etsi.org/01903/v1.2.2#"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:fox="http://xmlgraphics.apache.org/fop/extensions"
	xsi:schemaLocation="urn:hl7-org:v3 ../infrastructure/cda/CDA_extended.xsd">
	<xsl:output method="html" indent="yes" version="4.01" encoding="utf-8"
		doctype-system="http://www.w3.org/TR/html4/strict.dtd"
		doctype-public="-//W3C//DTD HTML 4.01//EN"/>

	<xsl:param name="vocFile" select="'../cda_l10n.xml'"/>
	<xsl:variable name="vocMessages" select="document($vocFile)"/>
	<xsl:param name="textlangDefault" select="'fr-fr'"/>

	<xsl:param name="textLang">
		<xsl:choose>
			<xsl:when test="/n1:ClinicalDocument/n1:languageCode/@code">
				<xsl:value-of select="/n1:ClinicalDocument/n1:languageCode/@code"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$textlangDefault"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:param>

	<xsl:variable name="textLangLowerCase">
		<xsl:call-template name="caseDown">
			<xsl:with-param name="data" select="$textLang"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="textLangDefaultLowerCase">
		<xsl:call-template name="caseDown">
			<xsl:with-param name="data" select="$textlangDefault"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="renderElement"
		select="self::n1:nonXMLBody/n1:text | self::n1:observationMedia/n1:value"/>

	<xsl:param name="limit-pdf" select="'no'"/>

	<xsl:variable name="textLangPartLowerCase" select="substring($textLangLowerCase, 1, 2)"/>

	<xsl:variable name="textLangDefaultPartLowerCase"
		select="substring($textLangDefaultLowerCase, 1, 2)"/>


	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myMargin">
		<xsl:attribute name="margin-top">20px</xsl:attribute>
		<xsl:attribute name="margin-left">5px</xsl:attribute>
		<xsl:attribute name="margin-bottom">0</xsl:attribute>
		<xsl:attribute name="margin-right">5px</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBorder">
		<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
		<xsl:attribute name="width">100%</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock3">
		<xsl:attribute name="font-size">6</xsl:attribute>
		<xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="background-color">#DCF0FF</xsl:attribute>
		<xsl:attribute name="color">black</xsl:attribute>
		<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock5">
		<xsl:attribute name="font-size">6</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="font-style">italic</xsl:attribute>
		<xsl:attribute name="margin-left">10px</xsl:attribute>
	</xsl:attribute-set>


	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock6">
		<xsl:attribute name="font-size">6</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="background-color">white</xsl:attribute>
		<xsl:attribute name="color">rgb(0,51,102)</xsl:attribute>
		<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock7">
		<xsl:attribute name="font-size">6</xsl:attribute>
		<xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="background-color">white</xsl:attribute>
		<xsl:attribute name="color">rgb(0,51,102)</xsl:attribute>
		<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock13">
		<xsl:attribute name="font-size">7</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock14">
		<xsl:attribute name="font-size">7</xsl:attribute>
		<xsl:attribute name="font-weight">normal</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock15">
		<xsl:attribute name="font-size">7</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>

	<xd:doc>
		<xd:desc>
			<xd:p>Non XML Body</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:variable name="nonXML" select="//n1:ClinicalDocument/n1:component/n1:nonXMLBody"/>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="/">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:apply-templates select="n1:ClinicalDocument"/>
		</xsl:if>
		<!-- Extension FR : PDF -->
		<!-- Test si PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
				<fo:layout-master-set>
					<fo:simple-page-master master-name="only">
						<fo:region-body region-name="xsl-region-body"/>
					</fo:simple-page-master>
				</fo:layout-master-set>
				<fo:page-sequence master-reference="only">
					<fo:flow flow-name="xsl-region-body">
						<xsl:apply-templates select="n1:ClinicalDocument"/>
					</fo:flow>
				</fo:page-sequence>
				<xsl:if test="$nonXML">
					<xsl:call-template name="encodedPdf"/>
				</xsl:if>
				<xsl:for-each select="descendant::n1:observationMedia">
					<xsl:if test="n1:value[@mediaType = 'application/pdf']">
						<xsl:if
							test="not(preceding::n1:templateId[@root = '1.2.250.1.213.1.1.2.243'])">
							<xsl:variable name="id" select="@ID"/>
							<xsl:variable name="value"
								select="translate(normalize-space(n1:value[@mediaType = 'application/pdf']/text()), ' ', '')"/>
							<fox:external-document content-type="pdf" id="{$id}">
								<xsl:attribute name="src">
									<xsl:value-of
										select="concat('data:', 'application/pdf', ';base64,', $value)"
									/>
								</xsl:attribute>
							</fox:external-document>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
			</fo:root>
		</xsl:if>
	</xsl:template>

	<!-- Extension FR : PDF -->
	<!-- Encoded nonXMLBody PDF -->
	<xd:doc>
		<xd:desc>
			<xd:p>Encoded PDF FILE</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template name="encodedPdf">
		<xsl:variable name="nonXMLText"
			select="//n1:ClinicalDocument/n1:component/n1:nonXMLBody/n1:text"/>
		<xsl:variable name="value" select="normalize-space($nonXMLText/text())"/>
		<fox:external-document content-type="pdf" id="nonXmlId">
			<xsl:attribute name="src">
				<xsl:value-of select="concat('data:', $nonXMLText/@mediaType, ';base64,', $value)"/>
			</xsl:attribute>
		</fox:external-document>
	</xsl:template>



	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:ClinicalDocument">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<html>
				<head>
					<meta name="viewport" content="width=device-width, initial-scale=1"/>
					<style>
						@media screen and (max-width : 320px) {
						    body {
						        font-family: Calibri, sans-serif;
						    }
						    h1 {
						    }
						    h2 {
						        margin: 0px;
						    }
						    table {
						        width: 80%;
						    }
						    th {
						        padding: 0px 1px 0px 1px;
						
						    }
						    tr {
						        font-weight: normal;
						    }
						    td {
						        padding: 0px 1px 0px 1px;
						    }
						    #header img,
						    #header p,
						    #header h2 {
						        margin: 0px 5px 0px 5px;
						    }
						    .data {
						        font-style: italic;
						        color: rgb(0, 112, 192);
						    }
						}
						@media screen and (min-width : 320px) {
						    body {
						        font-family: Calibri, sans-serif;
						    }
						    h1 {
						    }
						    h2 {
						        margin: 0px;
						    }
						    table {
						        width: 80%;
						    }
						    th {
						        padding: 0px 2px 0px 2px;
						
						    }
						    tr {
						        font-weight: normal;
						    }
						    td {
						        padding: 0px 2px 0px 2px;
						    }
						    #header img,
						    #header p,
						    #header h2 {
						        margin: 0px 10px 0px 10px;
						    }
						    .data {
						        font-style: italic;
						        color: rgb(0, 112, 192);
						    }
						}
						
						@media screen and (min-width : 480px) {
						    body {
						        font-family: Calibri, sans-serif;
						    }
						    h1 {
						    }
						    h2 {
						        margin: 0px;
						    }
						    table {
						        width: 80%;
						    }
						    th {
						        padding: 0px 3px 0px 3px;
						
						    }
						    tr {
						        font-weight: normal;
						    }
						    td {
						        padding: 0px 3px 0px 3px;
						    }
						    #header img,
						    #header p,
						    #header h2 {
						        margin: 0px 15px 0px 15px;
						    }
						    .data {
						        font-style: italic;
						        color: rgb(0, 112, 192);
						    }
						}
						
						@media screen and (min-width : 600px) {
						    body {
						        font-family: Calibri, sans-serif;
						    }
						    h1 {
						    }
						    h2 {
						        margin: 0px;
						    }
						    table {
						        width: 80%;
						    }
						    th {
						        padding: 0px 3.76px 0px 3.76px;
						
						    }
						    tr {
						        font-weight: normal;
						    }
						    td {
						        padding: 0px 3.76px 0px 3.76px;
						    }
						    #header img,
						    #header p,
						    #header h2 {
						        margin: 0px 18.8px 0px 18.8px;
						    }
						    .data {
						        font-style: italic;
						        color: rgb(0, 112, 192);
						    }
						}
						
						@media screen and (min-width : 801px) {
						    body {
						        font-family: Calibri, sans-serif;
						    }
						    h1 {
						    }
						    h2 {
						        margin: 0px;
						    }
						    table {
						        width: 80%;
						    }
						    th {
						        padding: 0px 3.9px 0px 3.9px;
						
						    }
						    tr {
						        font-weight: normal;
						    }
						    td {
						        padding: 0px 3.9px 0px 3.9px;
						    }
						    #header img,
						    #header p,
						    #header h2 {
						        margin: 0px 19.53px 0px 19.53px;
						    }
						    .data {
						        font-style: italic;
						        color: rgb(0, 112, 192);
						    }
						}
						
						@media screen and (min-width : 1025px) {
						    body {
						        font-family: Calibri, sans-serif;
						    }
						    h1 {
						    }
						    h2 {
						        margin: 0px;
						    }
						    table {
						        width: 80%;
						    }
						    th {
						        padding: 0px 5px 0px 5px;
						
						    }
						    tr {
						        font-weight: normal;
						    }
						    td {
						        padding: 0px 5px 0px 5px;
						    }
						    #header img,
						    #header p,
						    #header h2 {
						        margin: 0px 25px 0px 25px;
						    }
						    .data {
						        font-style: italic;
						        color: rgb(0, 112, 192);
						    }
						}
						
						@media screen and (min-width : 1281px) {
						    body {
						        font-family: Calibri, sans-serif;
						    }
						    h1 {
						    }
						    h2 {
						        margin: 0px;
						    }
						    table {
						        width: 80%;
						    }
						    th {
						        padding: 0px 6.25px 0px 6.25px;
						
						    }
						    tr {
						        font-weight: normal;
						    }
						    td {
						        padding: 0px 6.25px 0px 6.25px;
						    }
						    #header img,
						    #header p,
						    #header h2 {
						        margin: 0px 31.25px 0px 31.25px;
						    }
						    .data {
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
											<xsl:with-param name="address"
												select="n1:custodian//n1:addr"/>
										</xsl:call-template>
										<xsl:for-each
											select="n1:custodian//n1:telecom[@use = 'PUB']">
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
										<xsl:with-param name="date" select="n1:effectiveTime/@value"
										/>
									</xsl:call-template>
								</td>
							</tr>
							<xsl:call-template name="show-patient-name">
								<xsl:with-param name="name"
									select="n1:recordTarget//n1:patient/n1:name"/>
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
							<br/>
							<tr>
								<td>
									<span class="td_label">
										<xsl:text>Adresse</xsl:text>
									</span>
								</td>
								<td>
									<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:addr">
										<xsl:call-template name="show-address-patient">
											<xsl:with-param name="address" select="."/>
										</xsl:call-template>
										<br/>
									</xsl:for-each>
								</td>
							</tr>
							<br/>
							<tr>
								<td>
									<span class="td_label">
										<xsl:text>Telécom</xsl:text>
									</span>
								</td>
								<td>
									<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:telecom">
										<xsl:call-template name="show-telecom">
											<xsl:with-param name="telecom" select="."/>
										</xsl:call-template>
									</xsl:for-each>
								</td>
							</tr>
							<br/>
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
										<xsl:if test="
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
										<xsl:for-each
											select="n1:recordTarget//n1:patient/n1:guardian">
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
							<xsl:value-of
								select="n1:documentationOf/n1:serviceEvent/n1:id/@extension"/>
						</span> prescrite le <xsl:call-template name="printDate">
							<xsl:with-param name="date"
								select="n1:participant[@typeCode = 'REF']/n1:time/n1:high/@value"/>
						</xsl:call-template> par <xsl:call-template name="printNameAndId">
							<xsl:with-param name="ref"
								select="n1:participant[@typeCode = 'REF']/n1:associatedEntity"/>
						</xsl:call-template>
						<br/> Echantillons biologiques prélevés le <xsl:call-template
							name="printDate">
							<xsl:with-param name="date"
								select="n1:participant[@typeCode = 'PRF']/n1:time/n1:high/@value"/>
						</xsl:call-template> par <xsl:call-template name="printNameAndId">
							<xsl:with-param name="ref"
								select="n1:participant[@typeCode = 'PRF']/n1:associatedEntity"/>
						</xsl:call-template>
						<br/> Examens réalisés du <xsl:call-template name="printDate">
							<xsl:with-param name="date"
								select="n1:documentationOf/n1:serviceEvent/n1:effectiveTime/n1:low/@value"
							/>
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
		</xsl:if>
		<xsl:if test="contains($vendor, 'Saxonica')">
			<fo:block xsl:use-attribute-sets="myMargin" keep-together.within-page="always">
				<fo:table>
					<fo:table-column column-number="1" column-width="10%"/>
					<fo:table-column column-number="2" column-width="90%"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:call-template name="printLogo"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="12" font-style="italic"
									color="rgb(0, 112, 192)" font-weight="bold">
									<xsl:value-of select="n1:custodian//n1:name"/>
								</fo:block>
								<fo:block font-style="italic" color="rgb(0, 112, 192)">
									<fo:block line-height="0.1cm">&#160;</fo:block>
									<xsl:call-template name="show-address">
										<xsl:with-param name="address"
											select="n1:custodian//n1:addr"/>
									</xsl:call-template>
									<xsl:for-each select="n1:custodian//n1:telecom[@use = 'PUB']">
										<xsl:call-template name="show-telecom">
											<xsl:with-param name="telecom" select="."/>
										</xsl:call-template>
									</xsl:for-each>
								</fo:block>
								<fo:block>
									<fo:inline font-size="8"> Médecin biologiste responsable:
											<xsl:call-template name="printNameAndId">
											<xsl:with-param name="ref"
												select="n1:legalAuthenticator/n1:assignedEntity"/>
										</xsl:call-template>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			<fo:block line-height="0.5cm">&#160;</fo:block>
			<fo:block font-style="italic" color="rgb(0, 112, 192)" font-weight="bold">
				<xsl:value-of select="n1:title"/>
			</fo:block>
			<fo:block line-height="0.5cm">&#160;</fo:block>
			<fo:block>
				<fo:table>
					<fo:table-column column-number="1" column-width="30%"/>
					<fo:table-column column-number="2" column-width="45%"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8">
									<xsl:text>Produit le</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8" font-style="italic" color="rgb(0, 112, 192)">
									<xsl:call-template name="printDate">
										<xsl:with-param name="date" select="n1:effectiveTime/@value"
										/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8">
									<xsl:call-template name="show-patient-name">
										<xsl:with-param name="name"
											select="n1:recordTarget//n1:patient/n1:name"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8">
									<xsl:call-template name="show-patient-name-field">
										<xsl:with-param name="name"
											select="n1:recordTarget//n1:patient/n1:name"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8" width="20%">
									<xsl:text>Date de naissance</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block width="80%" font-size="8">
									<xsl:call-template name="show-time">
										<xsl:with-param name="datetime"
											select="n1:recordTarget//n1:patient/n1:birthTime"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block width="20%" font-size="8">
									<xsl:text>Sexe</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8">
									<xsl:for-each
										select="n1:recordTarget//n1:patient/n1:administrativeGenderCode">
										<xsl:call-template name="show-gender"/>
									</xsl:for-each>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8">
									<xsl:text>Lieu de naissance</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8">
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
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8">
									<xsl:text>Code INSEE du lieu de naissance</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8">
									<xsl:if
										test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr">
										<xsl:call-template name="show-address-county">
											<xsl:with-param name="address"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr"
											/>
										</xsl:call-template>
									</xsl:if>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block line-height="0.2cm">&#160;</fo:block>
								<fo:block font-size="8">
									<xsl:text>Adresse</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block line-height="0.2cm">&#160;</fo:block>
								<fo:block font-size="8">
									<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:addr">
										<xsl:call-template name="show-address-patient">
											<xsl:with-param name="address" select="."/>
										</xsl:call-template>
										<fo:block line-height="0.1cm">&#160;</fo:block>
									</xsl:for-each>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block line-height="0.2cm">&#160;</fo:block>
								<fo:block font-size="8">
									<xsl:text>Telécom</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block line-height="0.2cm">&#160;</fo:block>
								<fo:block font-size="8">
									<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:telecom">
										<xsl:call-template name="show-telecom">
											<xsl:with-param name="telecom" select="."/>
										</xsl:call-template>
										<fo:block line-height="0.1cm">&#160;</fo:block>
									</xsl:for-each>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block line-height="0.2cm">&#160;</fo:block>
								<fo:block font-size="8">
									<fo:block line-height="0.1cm">&#160;</fo:block>
									<xsl:text>INS</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block line-height="0.2cm">&#160;</fo:block>
								<fo:block font-size="8">
									<fo:block line-height="0.1cm">&#160;</fo:block>
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
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8">
									<xsl:text>IPP</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8">
									<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:id">
										<xsl:if test="
												(@root != '1.2.250.1.213.1.4.8') and (@root != '1.2.250.1.213.1.4.9')
												and (@root != '1.2.250.1.213.1.4.10') and (@root != '1.2.250.1.213.1.4.11')">
											<xsl:call-template name="show-id">
												<xsl:with-param name="id" select="."/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block line-height="0.2cm">&#160;</fo:block>
								<fo:block font-size="8">
									<xsl:text>Représentant du patient</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block line-height="0.2cm">&#160;</fo:block>
								<fo:block font-size="8">
									<xsl:if test="n1:recordTarget//n1:patient/n1:guardian">
										<xsl:for-each
											select="n1:recordTarget//n1:patient/n1:guardian">
											<xsl:call-template name="show-guardian">
												<xsl:with-param name="guardian" select="."/>
											</xsl:call-template>
										</xsl:for-each>
									</xsl:if>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			<fo:block line-height="0.5cm">&#160;</fo:block>
			<fo:block>
				<fo:inline font-size="8"><xsl:text>Demande d'examens </xsl:text>
					<fo:inline font-style="italic" color="rgb(0, 112, 192)"><xsl:value-of
							select="n1:documentationOf/n1:serviceEvent/n1:id/@extension"
						/></fo:inline> prescrite le <fo:inline font-style="italic"
						color="rgb(0, 112, 192)"><xsl:call-template name="printDate">
							<xsl:with-param name="date"
								select="n1:participant[@typeCode = 'REF']/n1:time/n1:high/@value"/>
						</xsl:call-template></fo:inline> par <fo:inline font-style="italic"
						color="rgb(0, 112, 192)"><xsl:call-template name="printNameAndId">
							<xsl:with-param name="ref"
								select="n1:participant[@typeCode = 'REF']/n1:associatedEntity"/>
						</xsl:call-template></fo:inline>
				</fo:inline>
				<fo:block line-height="0.1cm">&#160;</fo:block>
				<fo:inline font-size="8">Echantillons biologiques prélevés le <fo:inline
						font-style="italic" color="rgb(0, 112, 192)"><xsl:call-template
							name="printDate">
							<xsl:with-param name="date"
								select="n1:participant[@typeCode = 'PRF']/n1:time/n1:high/@value"/>
						</xsl:call-template></fo:inline> par <fo:inline font-style="italic"
						color="rgb(0, 112, 192)"><xsl:call-template name="printNameAndId">
							<xsl:with-param name="ref"
								select="n1:participant[@typeCode = 'PRF']/n1:associatedEntity"/>
						</xsl:call-template></fo:inline>
				</fo:inline>
				<fo:block line-height="0.1cm">&#160;</fo:block>
				<fo:inline font-size="8">Examens réalisés du <fo:inline font-style="italic"
						color="rgb(0, 112, 192)"><xsl:call-template name="printDate">
							<xsl:with-param name="date"
								select="n1:documentationOf/n1:serviceEvent/n1:effectiveTime/n1:low/@value"
							/>
						</xsl:call-template></fo:inline> au <fo:inline font-style="italic"
						color="rgb(0, 112, 192)"><xsl:call-template name="printDate">
							<xsl:with-param name="date"
								select="n1:documentationOf/n1:serviceEvent/n1:effectiveTime/n1:high/@value"
							/>
						</xsl:call-template></fo:inline>
				</fo:inline>
			</fo:block>
			<fo:block line-height="0.5cm">&#160;</fo:block>
			<xsl:apply-templates select="n1:component/n1:structuredBody"/>
			<fo:block line-height="0.5cm">&#160;</fo:block>
			<fo:table>
				<fo:table-column column-number="1" column-width="70%"/>
				<fo:table-column column-number="2" column-width="30%"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell xsl:use-attribute-sets="myBlock15">
							<fo:block>
								<xsl:text>Biologistes médicaux ayant participé à l'interprétation du compte
								rendu</xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="myBlock15">
							<fo:block>
								<xsl:text>Date &amp; heure</xsl:text>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<xsl:for-each select="n1:authenticator">
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-style="italic" color="rgb(0, 112, 192)" font-size="7">
									<xsl:call-template name="printNameAndId">
										<xsl:with-param name="ref" select="n1:assignedEntity"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-style="italic" color="rgb(0, 112, 192)" font-size="7">
									<xsl:call-template name="printDateAndTime">
										<xsl:with-param name="date" select="n1:time/@value"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
					<xsl:if test="not(n1:authenticator/n1:assignedEntity)">
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-style="italic" color="rgb(0, 112, 192)" font-size="7">
									<xsl:call-template name="printNameAndId">
										<xsl:with-param name="ref"
											select="n1:legalAuthenticator/n1:assignedEntity"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-style="italic" color="rgb(0, 112, 192)" font-size="7">
									<xsl:call-template name="printDateAndTime">
										<xsl:with-param name="date"
											select="n1:legalAuthenticator/n1:time/@value"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:if>
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:call-template name="directeur_signe"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc/>
		<xd:param name="data"/>
	</xd:doc>
	<xsl:template name="caseDown">
		<xsl:param name="data"/>
		<xsl:if test="$data">
			<xsl:value-of
				select="translate($data, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
			/>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="pre"/>
		<xd:param name="key"/>
		<xd:param name="post"/>
	</xd:doc>
	<xsl:template name="getLocalizedString">
		<xsl:param name="pre" select="''"/>
		<xsl:param name="key"/>
		<xsl:param name="post" select="''"/>


		<xsl:for-each select="$vocMessages">
			<xsl:variable name="translation" select="key('util-i18nkey', $key)"/>
			<xsl:choose>
				<!-- compare 'de-CH' -->
				<xsl:when test="$translation/value[@lang = $textLangLowerCase]">
					<xsl:value-of
						select="concat($pre, $translation/value[@lang = $textLangLowerCase]/text(), $post)"
					/>
				</xsl:when>
				<!-- compare 'de' in 'de-CH' -->
				<xsl:when test="$translation/value[substring(@lang, 1, 2) = $textLangPartLowerCase]">
					<xsl:value-of
						select="concat($pre, $translation/value[substring(@lang, 1, 2) = $textLangPartLowerCase]/text(), $post)"
					/>
				</xsl:when>
				<!-- compare 'en-US' -->
				<xsl:when test="$translation/value[@lang = $textLangDefaultLowerCase]">
					<xsl:value-of
						select="concat($pre, $translation/value[@lang = $textLangDefaultLowerCase]/text(), $post)"
					/>
				</xsl:when>
				<!-- compare 'en' in 'en-US' -->
				<xsl:when
					test="$translation/value[substring(@lang, 1, 2) = $textLangDefaultPartLowerCase]">
					<xsl:value-of
						select="concat($pre, $translation/value[substring(@lang, 1, 2) = $textLangDefaultPartLowerCase]/text(), $post)"
					/>
				</xsl:when>
				<xsl:when test="$translation/value[@lang = 'en-us']">
					<xsl:value-of select="concat($pre, $translation/value/text(), $post)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($pre, $key, $post)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>


	<xd:doc>
		<xd:desc/>
		<xd:param name="ref"/>
	</xd:doc>
	<xsl:template name="printNameAndId">
		<xsl:param name="ref"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<span class="data">
				<xsl:value-of
					select="$ref/n1:assignedPerson/n1:name | $ref/n1:associatedPerson/n1:name"/>
			</span>
			<xsl:text>(</xsl:text>
			<span class="data">
				<xsl:value-of select="$ref//n1:id/@extension"/>
			</span>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:inline font-style="italic" color="rgb(0, 112, 192)">
				<xsl:value-of
					select="$ref/n1:assignedPerson/n1:name | $ref/n1:associatedPerson/n1:name"/>
				<xsl:text>(</xsl:text>
				<xsl:value-of select="$ref//n1:id/@extension"/>
				<xsl:text>)</xsl:text>
			</fo:inline>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="date"/>
	</xd:doc>
	<xsl:template name="printDate">
		<xsl:param name="date"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
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
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:value-of select="substring($date, 7, 2)"/>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="substring($date, 5, 2)"/>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="substring($date, 1, 4)"/>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="date"/>
	</xd:doc>
	<xsl:template name="printDateAndTime">
		<xsl:param name="date"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
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
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:call-template name="printDate">
				<xsl:with-param name="date" select="$date"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring($date, 9, 2)"/>
			<xsl:text>:</xsl:text>
			<xsl:value-of select="substring($date, 11, 2)"/>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="printLogo">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<img src="data:image/jpeg;base64,
			/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQY
			GBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYa
			KCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAAR
			CABqADkDASIAAhEBAxEB/8QAHAAAAgIDAQEAAAAAAAAAAAAAAAcGCAMEBQEC/8QANRAAAgED
			AwMDAgIIBwAAAAAAAQIDBAURABIhBgcxE0FRFCIyQggVI1JhgZGhFjNicXKC4f/EABQBAQAA
			AAAAAAAAAAAAAAAAAAD/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwC1OjRo
			0Bo0a5HVlxa1WCrqonVajaI4Ny7t0jHaoA9ySRoI11p1tNaXppbT6FRSCT0qmRoXkVHJwqko
			dwyfcK3t8g6mtFM9RSRyyQvA7D7o38qfcf8Auq73+pjr1stps8oerqLhT0tR9TKymObcxM5A
			YMp3KCuOCT4zzqxNHFJDSQRTSmeVEVXlIwXIHLY9s+dBmHOjRo0Bo0aNAaXXce9ejckgwFht
			8IqWdlyDUSExwY+dv7Rz/sNMKeWOngkmmcJFGpd2PhQBkk6rz3GuVdUMlG7KslzlMshP5Vcb
			QoGRyIRj43SjxydBrdq7Xb773Es10aQRVKQyV8cUshdpIAPTiBVsgPyGJX93OedWS1X/ALf2
			enuPX9vp1CrLQ0grKuWNAruiygwRuwA/Ou75+wjwdWA0Bo0aNAaNGtK93Ons1qqrhWttp6dC
			7HIGfgc8ZJwP56Dj9c1UAoIrfUS+mlWx9Ug4IhQb5Cf4EDb/ANtIUTSXzrSorhMjrTAovwjF
			svtx8YCHxj0xzzjXd7g9drVXjdSRYmajSlqaOR1kdHYiRAoTJIJZQSu7g8gcZgVRT3D6GKio
			ZGgEdPLNWSKSSvhiQByASRuOFz9uRgkEHb2rNFb+or3FKRHW3EwvGXGPUCR4KqffGC2B8sfn
			TS1V3o67VlytVrkkqxV1VFUR1EjQxrC8kEcmMquRjcF4PHvxwcOvtULlLY2rq6qklpKt3kp4
			5ZmldB6j+WbPttAAYgY40E30aNGg8dlRSzkKoGSScADUepeo+lepvqLZTXW03PdmOSmWdJd3
			yNueddLqK3C8dP3O2M20VtLLTFj7b0K5/vqjz2mt6M6nSw9QCptLpK2KqPY4IwxSZQ5CkDxj
			IyAQPgBOu2vQRvHc+522rt80dBRVhnqvsP0zorZTYcAZf7cKfyFscHVl+pOl7feSlTIopq+G
			Jo46yMAOqHyh/eQ+6/0wedILsx3QNu6jrbRVTQ19jkdppbmImhZJOBltyrxheQwyPlscszrj
			ufaaahqrbT/WxV00oo1aWmZVAYsGcFioICqW8jjkZ2sAC2ounamgSv8ARqzWXe+zLRUzRIwj
			jQ8AqMkgBdzkknxyT5Nj7Pb6e02mit1EuylpIUgiX4VVAH9hpO9nLzHeOu62nkUxyUVuWSNB
			hhukZd53D3AEYA/1t507dAaNGjQGqV92qPqWzdcXKTqr6262wTvNDDVyO1K8LPu2RO/CEADw
			TggDBAObRdyJb7TwUc9lp6yqokEv1kFFIsc7cDYVY84H3cLzyPYY0qrnfkklo4qeOb0KlkWd
			LveG21eSMxeg4IJI3ZOMDBI5wdAprtYV6U6lgNrqqG42p5VqaKIVJnikAJ2rIQfSzvjweAoY
			+wA1JLReE6x6mlo3ommtKUUkkcTO4MWwlysXolVGZMgf8FIB9pj090s13kuEVrsVNNS0imKn
			hrAPtLb4yWcnOMo3GD9gQjyRqd9VdJWix2Oxy01DTrX0UclKk6KVLK0ErOPPOWG7nODoOV+j
			9ZY6GWrrYg0YmttGBEx3bAWmcLuPJ2gqufcKNOXSf7DGdYqZHl3R/qG3sUI8H9pzpwaA0aNG
			gNcXqm3NV2avNBSUktyaF1hM8StliuMfcMeOOePnjXa0aCJdsemW6Y6aSGpXFfUt69T+H7W2
			hVT7eMKiqvHGQSPOvnuU0f6qpkYgyepIyoDyR6EoJx8c/wB9SyeaOCJpZpFjjUZLMcAaSnUE
			sN2udRcoG9OlqDI7PFLhdyIUyT7MQACPfbjQbXY+vSS5JAkbYkslL95QquYiQQM+f80eMjjT
			k1WvthUV1sje9iq+joqNZKUGWLEckW8n8T/lG1eV+PPkadHR3W9B1FbY6gq9M7hmXePtlQHA
			dD8EYIzz/TOglmjWGlqoKpN9NMkq8ZKnOMjPPxrNoD31guE8lNQVM8MD1EsUbOsKfikIGQo/
			ifGs+jQVyvndWvnro6ZbFdq6uXLSUjQPCsBzgBgVOCTwOCfOT8ybp/ovqS/OKu/JQ2uneRZT
			Txw/tGxkruOcj8Rzz8e+dOfRoE1fezVXcpkWj6jegpowXXdB9Ud+0LgrKSNoHtn+mt2j7e9V
			UcYh/wASUVREg2oy0S07EfJCgj+Q402NGgW/b7ovqGwdX3a6XS8RTUNZDHEtJGxcFkzh+VXa
			eW4Gc5/gNMjRo0H/2Q==
			"/>
		</xsl:if>
		<xsl:if test="contains($vendor, 'Saxonica')">
			<fo:external-graphic content-height="scale-to-fit" content-width="50%"
				scaling="non-uniform" src="data:image/jpeg;base64,
				/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQY
				GBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYa
				KCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAAR
				CABqADkDASIAAhEBAxEB/8QAHAAAAgIDAQEAAAAAAAAAAAAAAAcGCAMEBQEC/8QANRAAAgED
				AwMDAgIIBwAAAAAAAQIDBAURABIhBgcxE0FRFCIyQggVI1JhgZGhFjNicXKC4f/EABQBAQAA
				AAAAAAAAAAAAAAAAAAD/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwC1OjRo
				0Bo0a5HVlxa1WCrqonVajaI4Ny7t0jHaoA9ySRoI11p1tNaXppbT6FRSCT0qmRoXkVHJwqko
				dwyfcK3t8g6mtFM9RSRyyQvA7D7o38qfcf8Auq73+pjr1stps8oerqLhT0tR9TKymObcxM5A
				YMp3KCuOCT4zzqxNHFJDSQRTSmeVEVXlIwXIHLY9s+dBmHOjRo0Bo0aNAaXXce9ejckgwFht
				8IqWdlyDUSExwY+dv7Rz/sNMKeWOngkmmcJFGpd2PhQBkk6rz3GuVdUMlG7KslzlMshP5Vcb
				QoGRyIRj43SjxydBrdq7Xb773Es10aQRVKQyV8cUshdpIAPTiBVsgPyGJX93OedWS1X/ALf2
				enuPX9vp1CrLQ0grKuWNAruiygwRuwA/Ou75+wjwdWA0Bo0aNAaNGtK93Ons1qqrhWttp6dC
				7HIGfgc8ZJwP56Dj9c1UAoIrfUS+mlWx9Ug4IhQb5Cf4EDb/ANtIUTSXzrSorhMjrTAovwjF
				svtx8YCHxj0xzzjXd7g9drVXjdSRYmajSlqaOR1kdHYiRAoTJIJZQSu7g8gcZgVRT3D6GKio
				ZGgEdPLNWSKSSvhiQByASRuOFz9uRgkEHb2rNFb+or3FKRHW3EwvGXGPUCR4KqffGC2B8sfn
				TS1V3o67VlytVrkkqxV1VFUR1EjQxrC8kEcmMquRjcF4PHvxwcOvtULlLY2rq6qklpKt3kp4
				5ZmldB6j+WbPttAAYgY40E30aNGg8dlRSzkKoGSScADUepeo+lepvqLZTXW03PdmOSmWdJd3
				yNueddLqK3C8dP3O2M20VtLLTFj7b0K5/vqjz2mt6M6nSw9QCptLpK2KqPY4IwxSZQ5CkDxj
				IyAQPgBOu2vQRvHc+522rt80dBRVhnqvsP0zorZTYcAZf7cKfyFscHVl+pOl7feSlTIopq+G
				Jo46yMAOqHyh/eQ+6/0wedILsx3QNu6jrbRVTQ19jkdppbmImhZJOBltyrxheQwyPlscszrj
				ufaaahqrbT/WxV00oo1aWmZVAYsGcFioICqW8jjkZ2sAC2ounamgSv8ARqzWXe+zLRUzRIwj
				jQ8AqMkgBdzkknxyT5Nj7Pb6e02mit1EuylpIUgiX4VVAH9hpO9nLzHeOu62nkUxyUVuWSNB
				hhukZd53D3AEYA/1t507dAaNGjQGqV92qPqWzdcXKTqr6262wTvNDDVyO1K8LPu2RO/CEADw
				TggDBAObRdyJb7TwUc9lp6yqokEv1kFFIsc7cDYVY84H3cLzyPYY0qrnfkklo4qeOb0KlkWd
				LveG21eSMxeg4IJI3ZOMDBI5wdAprtYV6U6lgNrqqG42p5VqaKIVJnikAJ2rIQfSzvjweAoY
				+wA1JLReE6x6mlo3ommtKUUkkcTO4MWwlysXolVGZMgf8FIB9pj090s13kuEVrsVNNS0imKn
				hrAPtLb4yWcnOMo3GD9gQjyRqd9VdJWix2Oxy01DTrX0UclKk6KVLK0ErOPPOWG7nODoOV+j
				9ZY6GWrrYg0YmttGBEx3bAWmcLuPJ2gqufcKNOXSf7DGdYqZHl3R/qG3sUI8H9pzpwaA0aNG
				gNcXqm3NV2avNBSUktyaF1hM8StliuMfcMeOOePnjXa0aCJdsemW6Y6aSGpXFfUt69T+H7W2
				hVT7eMKiqvHGQSPOvnuU0f6qpkYgyepIyoDyR6EoJx8c/wB9SyeaOCJpZpFjjUZLMcAaSnUE
				sN2udRcoG9OlqDI7PFLhdyIUyT7MQACPfbjQbXY+vSS5JAkbYkslL95QquYiQQM+f80eMjjT
				k1WvthUV1sje9iq+joqNZKUGWLEckW8n8T/lG1eV+PPkadHR3W9B1FbY6gq9M7hmXePtlQHA
				dD8EYIzz/TOglmjWGlqoKpN9NMkq8ZKnOMjPPxrNoD31guE8lNQVM8MD1EsUbOsKfikIGQo/
				ifGs+jQVyvndWvnro6ZbFdq6uXLSUjQPCsBzgBgVOCTwOCfOT8ybp/ovqS/OKu/JQ2uneRZT
				Txw/tGxkruOcj8Rzz8e+dOfRoE1fezVXcpkWj6jegpowXXdB9Ud+0LgrKSNoHtn+mt2j7e9V
				UcYh/wASUVREg2oy0S07EfJCgj+Q402NGgW/b7ovqGwdX3a6XS8RTUNZDHEtJGxcFkzh+VXa
				eW4Gc5/gNMjRo0H/2Q=="/>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="directeur_signe">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<br/>
			<img src="data:image/jpeg;base64,
			iVBORw0KGgoAAAANSUhEUgAAAK8AAACvAQMAAACxXBw2AAAAB3RJTUUH2woPDAQmGYX3JgAAAAlw
			SFlzAAAK8AAACvABQqw0mAAAAAZQTFRFAAAA////pdmf3QAAAShJREFUeNrtl0EOhCAMRcvKJTeC
			mw16M7xRl6xgfkGNmllOITPRpEGfCwv/tyCVT1emB/8TToTLEdloC8t90Me+RiaMHGqoY0cmeXZ2
			BXqRGY1LxJqsnTGE6IarDJi8KH9Xpy+uHkRyEndr6uCttjyTaH8tQCWcTBKzYfp4dZq8Ihbtp1JW
			PDg7Q/8yDGM9kiRHCDhwT1ATxylPWb6PWPhQXhPXWmMDARxdZeiN4yTJwfZkMOZdBk0smTS9nc10
			WRMtDJuJ2WB8U2a78ECcWo810mTsvK+JJm6NRfraVQY9XJupr1OXnSSc+7cWboeFuGVyNNMBWLZR
			uG/bR177BqOPAWF6w92wr+Xt4e95IBYZcFRAclL7XXA7LADDg4ED6+Ov/CA8+NfwG147q3gE6HAP
			AAAAAElFTkSuQmCC
			"/>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block line-height="0.1cm">&#160;</fo:block>
			<fo:external-graphic content-height="scale-to-fit" content-width="50%"
				scaling="non-uniform" src="data:image/jpeg;base64,
				iVBORw0KGgoAAAANSUhEUgAAAK8AAACvAQMAAACxXBw2AAAAB3RJTUUH2woPDAQmGYX3JgAAAAlw
				SFlzAAAK8AAACvABQqw0mAAAAAZQTFRFAAAA////pdmf3QAAAShJREFUeNrtl0EOhCAMRcvKJTeC
				mw16M7xRl6xgfkGNmllOITPRpEGfCwv/tyCVT1emB/8TToTLEdloC8t90Me+RiaMHGqoY0cmeXZ2
				BXqRGY1LxJqsnTGE6IarDJi8KH9Xpy+uHkRyEndr6uCttjyTaH8tQCWcTBKzYfp4dZq8Ihbtp1JW
				PDg7Q/8yDGM9kiRHCDhwT1ATxylPWb6PWPhQXhPXWmMDARxdZeiN4yTJwfZkMOZdBk0smTS9nc10
				WRMtDJuJ2WB8U2a78ECcWo810mTsvK+JJm6NRfraVQY9XJupr1OXnSSc+7cWboeFuGVyNNMBWLZR
				uG/bR177BqOPAWF6w92wr+Xt4e95IBYZcFRAclL7XXA7LADDg4ED6+Ov/CA8+NfwG147q3gE6HAP
				AAAAAElFTkSuQmCC"/>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:component/n1:structuredBody">
		<xsl:for-each select="n1:component/n1:section">
			<xsl:comment>Debut body structure</xsl:comment>
			<xsl:call-template name="section"/>
			<xsl:comment>Fin body structure</xsl:comment>
		</xsl:for-each>
	</xsl:template>


	<xd:doc>
		<xd:desc> top level component/section: display title and text, and process any nested
			component/sections </xd:desc>
	</xd:doc>
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

	<xd:doc>
		<xd:desc> top level section title </xd:desc>
		<xd:param name="title"/>
	</xd:doc>
	<xsl:template name="section-title">
		<xsl:param name="title"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<h3>
				<xsl:value-of select="$title"/>
			</h3>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:if test="not(n1:templateId[@root = '1.2.250.1.213.1.1.2.243'])">
				<fo:block font-size="9" font-weight="bold">
					<xsl:value-of select="$title"/>
				</fo:block>
				<fo:block line-height="0.5cm">&#160;</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> top-level section Text </xd:desc>
	</xd:doc>
	<xsl:template name="section-text">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<div>
				<xsl:apply-templates select="n1:text"/>
			</div>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block>
				<xsl:apply-templates select="n1:text"/>
			</fo:block>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="renderTextB64">
		<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
		<xsl:variable name="node-set" select="function-available('exsl:node-set')"/>
		<xsl:variable name="source" select="string($renderElement/n1:reference/@value)"/>
		<xsl:variable name="renderID">
			<xsl:choose>
				<xsl:when test="@ID">
					<xsl:value-of select="@ID"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat(generate-id(.), '_', local-name(.))"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="renderAltText">
			<xsl:variable name="i18nid">
				<xsl:call-template name="getLocalizedString">
					<xsl:with-param name="key" select="'id'"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:if test="n1:id">
				<xsl:value-of
					select="concat($i18nid, ' = ', n1:id[1]/@root, ' ', n1:id[1]/@extension)"/>
			</xsl:if>
		</xsl:variable>
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
				<xsl:variable name="frameID">
					<xsl:value-of select="concat('iframeId', '_', generate-id(.))"/>
				</xsl:variable>
				<!-- Navigaeur non pris en charge -->
				<div id="{$frameID}">
					<iframe name="{$renderID}" id="{$renderID}" width="100%" height="600"
						title="{$renderAltText}">
						<xsl:if
							test="$renderElement/@mediaType != 'application/pdf' or $limit-pdf = 'yes'">
							<xsl:attribute name="sandbox"/>
						</xsl:if>
						<xsl:attribute name="src">data:<xsl:value-of select="n1:text/@mediaType"
								/>;base64,<xsl:value-of select="n1:text"/>
						</xsl:attribute>
					</iframe>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xd:doc>
		<xd:desc> nested component/section </xd:desc>
		<xd:param name="margin"/>
	</xd:doc>
	<xsl:template name="nestedSection">
		<xsl:param name="margin"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
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
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block margin-left="{$margin}em" font-weight="bold" font-size="8">
				<xsl:value-of select="n1:title"/>
			</fo:block>
			<fo:block line-height="0.3cm">&#160;</fo:block>
			<fo:block margin-left="{$margin}em" font-size="8">
				<xsl:apply-templates select="n1:text"/>
			</fo:block>
			<xsl:for-each select="n1:component/n1:section">
				<xsl:call-template name="nestedSection">
					<xsl:with-param name="margin" select="2 * $margin"/>
				</xsl:call-template>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>
			<xd:p>Handle paragraph or fo:block</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="n1:paragraph">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<p>
				<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
			</p>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block>
				<xsl:apply-templates/>
			</fo:block>
			<fo:block line-height="0.1cm">&#160;</fo:block>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>
			<xd:p>Handle linkHtml or fo:basic-link</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="n1:linkHtml">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:element name="a">
				<xsl:apply-templates select="." mode="handleSectionTextAttributes">
					<xsl:with-param name="class">linkHtml</xsl:with-param>
				</xsl:apply-templates>
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:basic-link external-destination="{@href}" target-presentation-context="_blank">
				<xsl:apply-templates/>
			</fo:basic-link>
			<fo:block line-height="0.1cm">&#160;</fo:block>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>
			<xd:p>Handle pre or fo:block</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="n1:pre">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<pre>
            <xsl:apply-templates/>
        </pre>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>
			<xd:p>Handle content. Content w/ deleted text is hidden</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="n1:content">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<span>
				<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
			</span>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:inline>
				<xsl:apply-templates/>
			</fo:inline>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>
			<xd:p>Handle line break </xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="n1:br">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:element name="br">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block line-height="0.2cm">&#160; <xsl:apply-templates/>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>
			<xd:p>Handle list </xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="n1:list">
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:if test="n1:caption">
				<fo:list-block>
					<fo:list-item>
						<fo:list-item-label>
							<fo:block margin-left="0.3cm" font-weight="bold">*</fo:block>
						</fo:list-item-label>
						<fo:list-item-body>
							<fo:block xsl:use-attribute-sets="myBlock7">
								<xsl:apply-templates select="n1:caption"/>
							</fo:block>
						</fo:list-item-body>
					</fo:list-item>
				</fo:list-block>
			</xsl:if>
			<fo:list-block>
				<fo:list-item>
					<fo:list-item-label>
						<fo:block margin-left="0.3cm" font-weight="bold">*</fo:block>
					</fo:list-item-label>
					<fo:list-item-body>
						<xsl:for-each select="n1:item">
							<fo:block xsl:use-attribute-sets="myBlock6">
								<xsl:apply-templates/>
							</fo:block>
						</xsl:for-each>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<!-- caption -->
			<xsl:if test="n1:caption">
				<div style="font-weight:bold; ">
					<xsl:apply-templates select="n1:caption"/>
				</div>
			</xsl:if>
			<!-- item -->
			<xsl:choose>
				<xsl:when test="@listType = 'ordered'">
					<ol>
						<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
						<xsl:for-each select="n1:item">
							<li>
								<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
								<!--<xsl:if test="@ID">
                                <a name="{@ID}"/>
                            </xsl:if>-->
								<xsl:apply-templates/>
							</li>
						</xsl:for-each>
					</ol>
				</xsl:when>
				<xsl:otherwise>
					<!-- list is unordered -->
					<ul>
						<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
						<xsl:for-each select="n1:item">
							<li>
								<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
								<xsl:apply-templates/>
							</li>
						</xsl:for-each>
					</ul>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>
			<xd:p>Handle caption </xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="n1:caption">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="parent::n1:table">
					<caption>
						<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
						<xsl:apply-templates/>
					</caption>
				</xsl:when>
				<xsl:otherwise>
					<div class="caption">
						<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
						<xsl:apply-templates/>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="parent::n1:table">
					<caption>
						<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
						<xsl:apply-templates/>
					</caption>
				</xsl:when>
				<xsl:otherwise>
					<fo:block>
						<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
						<xsl:apply-templates/>
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>
			<xd:p>Handle footnote </xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="n1:footnote">
		<xsl:variable name="id" select="@ID"/>
		<xsl:variable name="footNoteNum">
			<xsl:for-each select="//n1:footnote">
				<xsl:if test="@ID = $id">
					<xsl:value-of select="position()"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<div>
				<xsl:apply-templates select="." mode="handleSectionTextAttributes">
					<xsl:with-param name="class" select="'narr_footnote'"/>
				</xsl:apply-templates>
				<xsl:text>[</xsl:text>
				<xsl:value-of select="$footNoteNum"/>
				<xsl:text>]. </xsl:text>
				<xsl:apply-templates/>
			</div>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block>
				<xsl:apply-templates select="." mode="handleSectionTextAttributes">
					<xsl:with-param name="class" select="'narr_footnote'"/>
				</xsl:apply-templates>
				<xsl:text>[</xsl:text>
				<xsl:value-of select="$footNoteNum"/>
				<xsl:text>]. </xsl:text>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>
			<xd:p>Handle footnoteRef. Produces a superscript [n] where n is the occurence number of
				this ref in the whole document. Also adds a title with the first 50 characters of th
				footnote on the number so you don't have to navigate to the footnote and just
				continue to read.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="n1:footnoteRef">
		<xsl:variable name="idref" select="@IDREF"/>
		<xsl:variable name="footNoteNum">
			<xsl:for-each select="//n1:footnote">
				<xsl:if test="@ID = $idref">
					<xsl:value-of select="position()"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="footNoteText">
			<xsl:copy-of select="//n1:footnote[@ID = $idref]//text()"/>
		</xsl:variable>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<sup>
				<xsl:text>[</xsl:text>
				<a href="#{$idref}">
					<!-- Render footnoteref with the first 50 characters of the text -->
					<xsl:attribute name="title">
						<xsl:value-of select="substring($footNoteText, 1, 50)"/>
						<xsl:if test="string-length($footNoteText) > 50">
							<xsl:text>...</xsl:text>
						</xsl:if>
					</xsl:attribute>
					<xsl:value-of select="$footNoteNum"/>
				</a>
				<xsl:text>]</xsl:text>
			</sup>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:inline vertical-align="super">
				<xsl:text>[</xsl:text>
				<fo:basic-link internal-destination="#{$idref}">
					<xsl:value-of select="$footNoteNum"/>
				</fo:basic-link>
			</fo:inline>
		</xsl:if>
	</xsl:template>

	<xsl:variable name="table-elem-attrs" select="document('cda_narrativeblock.xml')/tableElems"/>

	<xd:doc>
		<xd:desc>Handle table and constituents of table</xd:desc>
	</xd:doc>
	<xsl:template
		match="n1:table/@* | n1:thead/@* | n1:tfoot/@* | n1:tbody/@* | n1:colgroup/@* | n1:col/@* | n1:tr/@* | n1:th/@* | n1:td/@*">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:copy>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</xsl:copy>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:copy>
				<xsl:apply-templates/>
			</xsl:copy>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>Handle table</xd:desc>
	</xd:doc>
	<xsl:template match="n1:table">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:table width="95%" margin="0.3em 0" xsl:use-attribute-sets="myBorder"
				table-layout="auto">
				<xsl:apply-templates/>
			</fo:table>
			<fo:block line-height="0.2cm">&#160;</fo:block>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<table>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</table>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>Handle thead of table</xd:desc>
	</xd:doc>
	<xsl:template match="n1:thead">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:table-header>
				<xsl:apply-templates/>
			</fo:table-header>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<thead>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</thead>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>Handle tfoot of table</xd:desc>
	</xd:doc>
	<xsl:template match="n1:tfoot">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:apply-templates/>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<tfoot>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</tfoot>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>Handle tbody of table</xd:desc>
	</xd:doc>
	<xsl:template match="n1:tbody">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:table-body line-stacking-strategy="max-height">
				<xsl:apply-templates/>
			</fo:table-body>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<tbody>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</tbody>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>Handle colgroup of table</xd:desc>
	</xd:doc>
	<xsl:template match="n1:colgroup">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:apply-templates/>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<colgroup>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</colgroup>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>Handle column of table</xd:desc>
	</xd:doc>
	<xsl:template match="n1:col">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:apply-templates/>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<col>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</col>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>Handle line of table</xd:desc>
	</xd:doc>
	<xsl:template match="n1:tr">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:table-row border="solid 0.1mm white">
				<xsl:apply-templates/>
			</fo:table-row>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<tr>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</tr>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>Handle line head of table</xd:desc>
	</xd:doc>
	<xsl:template match="n1:th">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="@colspan">
					<xsl:variable name="nb_header" select="@colspan"/>
					<fo:table-cell xsl:use-attribute-sets="myBlock13"
						number-columns-spanned="{$nb_header}">
						<fo:block>
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</xsl:when>
				<xsl:when test="@rowspan">
					<xsl:variable name="nb_header" select="@rowspan"/>
					<fo:table-cell xsl:use-attribute-sets="myBlock13"
						number-rows-spanned="{$nb_header}">
						<fo:block>
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</xsl:when>
				<xsl:otherwise>
					<fo:table-cell xsl:use-attribute-sets="myBlock13">
						<fo:block>
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<th>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</th>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc>Handle column of table</xd:desc>
	</xd:doc>
	<xsl:template match="n1:td">
		<!-- Extension FR : PDF -->
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="@colspan">
					<xsl:variable name="nb_header" select="@colspan"/>
					<fo:table-cell xsl:use-attribute-sets="myBlock14"
						number-columns-spanned="{$nb_header}">
						<fo:block>
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</xsl:when>
				<xsl:when test="@rowspan">
					<xsl:variable name="nb_header" select="@rowspan"/>
					<fo:table-cell xsl:use-attribute-sets="myBlock14"
						number-rows-spanned="{$nb_header}">
						<fo:block>
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</xsl:when>
				<xsl:otherwise>
					<fo:table-cell xsl:use-attribute-sets="myBlock14">
						<fo:block>
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<td>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</td>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>Handle caption of table</xd:desc>
	</xd:doc>
	<xsl:template match="n1:table/n1:caption">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block font-weight="bold">
				<xsl:apply-templates/>
			</fo:block>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<span style="font-weight:bold; ">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>Security measure. Only process images on the image whitelist</xd:desc>
		<xd:param name="current-whitelist"/>
		<xd:param name="image-uri"/>
		<xd:param name="altTitleText"/>
	</xd:doc>
	<xsl:template name="check-external-image-whitelist">
		<xsl:param name="current-whitelist"/>
		<xsl:param name="image-uri"/>
		<xsl:param name="altTitleText"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="string-length($current-whitelist) &gt; 0">
					<xsl:variable name="whitelist-item">
						<xsl:choose>
							<xsl:when test="contains($current-whitelist, '|')">
								<xsl:value-of select="substring-before($current-whitelist, '|')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$current-whitelist"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="starts-with($image-uri, $whitelist-item)">
							<br/>
							<img src="{$image-uri}" alt="{$altTitleText}" title="{$altTitleText}"/>
							<xsl:message>
								<xsl:value-of select="$image-uri"/>
								<xsl:call-template name="getLocalizedString">
									<xsl:with-param name="key" select="'is-in-the-whitelist'"/>
								</xsl:call-template>
							</xsl:message>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="check-external-image-whitelist">
								<xsl:with-param name="current-whitelist"
									select="substring-after($current-whitelist, '|')"/>
								<xsl:with-param name="image-uri" select="$image-uri"/>
								<xsl:with-param name="altTitleText" select="$altTitleText"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>

				</xsl:when>
				<xsl:otherwise>
					<p>
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="'non-local-image-found-1'"/>
						</xsl:call-template>
						<xsl:value-of select="$image-uri"/>
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="'non-local-image-found-2'"/>
						</xsl:call-template>
					</p>
					<xsl:message>
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="'non-local-image-found-1'"/>
						</xsl:call-template>
						<xsl:value-of select="$image-uri"/>
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="'non-local-image-found-2'"/>
						</xsl:call-template>
					</xsl:message>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="string-length($current-whitelist) &gt; 0">
					<xsl:variable name="whitelist-item">
						<xsl:choose>
							<xsl:when test="contains($current-whitelist, '|')">
								<xsl:value-of select="substring-before($current-whitelist, '|')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$current-whitelist"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="starts-with($image-uri, $whitelist-item)">
							<fo:block line-height="0.1cm">&#160;</fo:block>
							<fo:external-graphic content-height="scale-to-fit" content-width="100%"
								scaling="non-uniform" src="{$image-uri}"/>
							<xsl:message>
								<xsl:value-of select="$image-uri"/>
								<xsl:call-template name="getLocalizedString">
									<xsl:with-param name="key" select="'is-in-the-whitelist'"/>
								</xsl:call-template>
							</xsl:message>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="check-external-image-whitelist">
								<xsl:with-param name="current-whitelist"
									select="substring-after($current-whitelist, '|')"/>
								<xsl:with-param name="image-uri" select="$image-uri"/>
								<xsl:with-param name="altTitleText" select="$altTitleText"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<fo:block>
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="'non-local-image-found-1'"/>
						</xsl:call-template>
						<xsl:value-of select="$image-uri"/>
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="'non-local-image-found-2'"/>
						</xsl:call-template>
					</fo:block>
					<xsl:message>
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="'non-local-image-found-1'"/>
						</xsl:call-template>
						<xsl:value-of select="$image-uri"/>
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="'non-local-image-found-2'"/>
						</xsl:call-template>
					</xsl:message>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>

	</xsl:template>

	<xd:doc>
		<xd:desc>
			<xd:p>Handle RenderMultiMedia. This currently only handles GIF's and JPEG's. It could,
				however, be extended by including other image MIME types in the predicate and/or by
				generating &lt;object&gt; or &lt;applet&gt; tag with the correct params depending on
				the media type @ID =$imageRef referencedObject </xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="n1:renderMultiMedia">
		<xsl:variable name="imageRefs" select="@referencedObject"/>
		<xsl:variable name="referencedObjects"
			select="ancestor::n1:ClinicalDocument//n1:regionOfInterest[@ID = $imageRefs] | ancestor::n1:ClinicalDocument//n1:observationMedia[@ID = $imageRefs]"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<div>
				<xsl:apply-templates select="n1:caption"/>
				<xsl:for-each select="$referencedObjects">
					<xsl:choose>
						<xsl:when test="self::n1:regionOfInterest">
							<!-- What we actually would want is an svg with fallback to just the image that renders the ROI on top of image
                            The only example (in the CDA standard itself) that we've seen so far has unusable coordinates. That for now
                            is not very encouraging to put in the effort, so we just render the images for now
                        -->
							<xsl:apply-templates select=".//n1:observationMedia"
							> </xsl:apply-templates>
						</xsl:when>
						<!-- Here is where the direct MultiMedia image referencing goes -->
						<xsl:when test="self::n1:observationMedia">
							<xsl:apply-templates select="."/>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block>
				<xsl:apply-templates select="n1:caption"/>
				<xsl:for-each select="$referencedObjects">
					<xsl:choose>
						<xsl:when test="self::n1:regionOfInterest">
							<!-- What we actually would want is an svg with fallback to just the image that renders the ROI on top of image
                            The only example (in the CDA standard itself) that we've seen so far has unusable coordinates. That for now
                            is not very encouraging to put in the effort, so we just render the images for now
                        -->
							<xsl:apply-templates select=".//n1:observationMedia"
							> </xsl:apply-templates>
						</xsl:when>
						<!-- Here is where the direct MultiMedia image referencing goes -->
						<xsl:when test="self::n1:observationMedia">
							<xsl:apply-templates select="."/>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>
			<xd:p>Handle superscript</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="n1:sup">
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:inline vertical-align="sup" xsl:use-attribute-sets="myBlock3">
				<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
			</fo:inline>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<sup>
				<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
			</sup>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>
			<xd:p>Handle subscript</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="n1:sub">
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:inline vertical-align="sub" xsl:use-attribute-sets="myBlock3">
				<xsl:apply-templates/>
			</fo:inline>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<sub>
				<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
			</sub>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc> RenderMultiMedia this currently only handles GIF's and JPEG's. It could, however,
			be extended by including other image MIME types in the predicate and/or by generating
			&lt;object&gt; or &lt;applet&gt; tag with the correct params depending on the media type
			@ID =$imageRef referencedObject </xd:desc>
	</xd:doc>
	<xsl:template match="n1:renderMultiMedia">
		<xsl:variable name="imageRef" select="@referencedObject"/>
		<xsl:choose>
			<xsl:when test="//n1:regionOfInterest[@ID = $imageRef]">
				<!-- Here is where the Region of Interest image referencing goes -->
				<xsl:if test="
						//n1:regionOfInterest[@ID = $imageRef]//n1:observationMedia/n1:value[@mediaType = 'image/gif' or
						@mediaType = 'image/jpeg' or @mediaType = 'image/png']">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<br clear="all"/>
						<xsl:element name="img">
							<xsl:attribute name="src">
								<xsl:value-of
									select="//n1:regionOfInterest[@ID = $imageRef]//n1:observationMedia/n1:value/n1:reference/@value"
								/>
							</xsl:attribute>
						</xsl:element>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<xsl:variable name="path"
							select="//n1:regionOfInterest[@ID = $imageRef]//n1:observationMedia/n1:value/n1:reference/@value"/>
						<fo:external-graphic content-height="scale-to-fit" content-width="100%"
							scaling="non-uniform" src="{$path}"/>
					</xsl:if>
				</xsl:if>
				<!-- Here is where the Region of Interest image referencing goes -->
				<xsl:if
					test="//n1:regionOfInterest[@ID = $imageRef]//n1:observationMedia/n1:value[@mediaType = 'text/xml' or @mediaType = 'application/pdf']">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<br clear="all"/>
						<xsl:element name="p">
							<xsl:value-of
								select="//n1:regionOfInterest[@ID = $imageRef]//n1:observationMedia/n1:value/n1:reference/@value"
							/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:block>
							<xsl:value-of
								select="//n1:regionOfInterest[@ID = $imageRef]//n1:observationMedia/n1:value/n1:reference/@value"
							/>
						</fo:block>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
				<xsl:variable name="node-set" select="function-available('exsl:node-set')"/>
				<!-- Here is where the direct MultiMedia image referencing goes -->
				<xsl:if
					test="//n1:observationMedia[@ID = $imageRef]/n1:value[@mediaType = 'image/gif' or @mediaType = 'image/jpeg' or @mediaType = 'image/png']">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
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
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<xsl:variable name="mediaType"
							select="//n1:observationMedia[@ID = $imageRef]/n1:value/@mediaType"/>
						<xsl:variable name="value"
							select="//n1:observationMedia[@ID = $imageRef]/n1:value"/>
						<xsl:variable name="path"
							select="translate(normalize-space(concat('data:', $mediaType, ';base64,', $value)), ' ', '')"/>
						<fo:external-graphic content-height="scale-to-fit" content-width="50%"
							id="{$imageRef}" scaling="non-uniform" src="{$path}"/>
					</xsl:if>
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
							<xsl:if test="not(contains($vendor, 'Saxonica'))">
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
											select="//n1:observationMedia[@ID = $imageRef]/n1:value"
										/>
									</xsl:attribute>
								</xsl:element>
							</xsl:if>
							<xsl:if test="(contains($vendor, 'Saxonica'))">
								<xsl:if
									test="not(preceding::n1:templateId[@root = '1.2.250.1.213.1.1.2.243'])">
									<fo:block xsl:use-attribute-sets="myBlock5">
										<xsl:text> Voir PDF en bas de page</xsl:text>
									</fo:block>
								</xsl:if>
							</xsl:if>
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
							<xsl:variable name="renderID">
								<xsl:choose>
									<xsl:when test="@ID">
										<xsl:value-of select="@ID"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(generate-id(.), '_', local-name(.))"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="renderAltText">
								<xsl:variable name="i18nid">
									<xsl:call-template name="getLocalizedString">
										<xsl:with-param name="key" select="'id'"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:if test="n1:id">
									<xsl:value-of
										select="concat($i18nid, ' = ', n1:id[1]/@root, ' ', n1:id[1]/@extension)"
									/>
								</xsl:if>
							</xsl:variable>
							<xsl:variable name="frameID">
								<xsl:value-of select="concat('iframeId', '_', generate-id(.))"/>
							</xsl:variable>
							<xsl:variable name="source"
								select="string($renderElement/n1:reference/@value)"/>
							<xsl:if test="not(contains($vendor, 'Saxonica'))">
								<div id="{$frameID}">
									<iframe name="{$renderID}" id="{$renderID}" width="100%"
										height="600" title="{$renderAltText}">
										<xsl:if
											test="$renderElement/@mediaType != 'application/pdf' or $limit-pdf = 'yes'">
											<xsl:attribute name="sandbox"/>
										</xsl:if>
										<xsl:attribute name="src">
											<xsl:value-of select="
													translate(normalize-space(concat('data:', //n1:observationMedia[@ID = $imageRef]/n1:value/@mediaType, ';base64,', //n1:observationMedia[@ID =
													$imageRef]/n1:value)), ' ', '')"/>
										</xsl:attribute>
									</iframe>
								</div>
							</xsl:if>
							<xsl:if test="(contains($vendor, 'Saxonica'))">
								<xsl:if
									test="not(preceding::n1:templateId[@root = '1.2.250.1.213.1.1.2.243'])">
									<fo:block xsl:use-attribute-sets="myBlock5">
										<xsl:text> Voir PDF en bas de page</xsl:text>
									</fo:block>
								</xsl:if>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="string"/>
		<xd:param name="prefix"/>
		<xd:param name="localize"/>
	</xd:doc>
	<xsl:template name="_tokenize-characters">
		<xsl:param name="string"/>
		<xsl:param name="prefix"/>
		<xsl:param name="localize" select="true()"/>
		<xsl:if test="$string">
			<xsl:choose>
				<xsl:when test="$localize">
					<xsl:call-template name="getLocalizedString">
						<xsl:with-param name="key"
							select="concat($prefix, substring($string, 1, 1))"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="substring($string, 1, 1)"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:call-template name="_tokenize-characters">
				<xsl:with-param name="string" select="substring($string, 2)"/>
				<xsl:with-param name="prefix" select="$prefix"/>
				<xsl:with-param name="localize" select="$localize"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="string"/>
		<xd:param name="delimiters"/>
		<xd:param name="prefix"/>
		<xd:param name="localize"/>
	</xd:doc>
	<xsl:template name="_tokenize-delimiters">
		<xsl:param name="string"/>
		<xsl:param name="delimiters"/>
		<xsl:param name="prefix"/>
		<xsl:param name="localize" select="true()"/>

		<xsl:variable name="delimiter" select="substring($delimiters, 1, 1)"/>
		<xsl:choose>
			<xsl:when test="not($delimiter)">
				<xsl:choose>
					<xsl:when test="$localize">
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="concat($prefix, $string)"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$string"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="contains($string, $delimiter)">
				<xsl:if test="not(starts-with($string, $delimiter))">
					<xsl:call-template name="_tokenize-delimiters">
						<xsl:with-param name="string" select="substring-before($string, $delimiter)"/>
						<xsl:with-param name="delimiters" select="substring($delimiters, 2)"/>
						<xsl:with-param name="prefix" select="$prefix"/>
						<xsl:with-param name="localize" select="$localize"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:text> </xsl:text>
				<xsl:call-template name="_tokenize-delimiters">
					<xsl:with-param name="string" select="substring-after($string, $delimiter)"/>
					<xsl:with-param name="delimiters" select="$delimiters"/>
					<xsl:with-param name="prefix" select="$prefix"/>
					<xsl:with-param name="localize" select="$localize"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="_tokenize-delimiters">
					<xsl:with-param name="string" select="$string"/>
					<xsl:with-param name="delimiters" select="substring($delimiters, 2)"/>
					<xsl:with-param name="prefix" select="$prefix"/>
					<xsl:with-param name="localize" select="$localize"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="string"/>
		<xd:param name="delimiters"/>
		<xd:param name="prefix"/>
		<xd:param name="localize"/>
	</xd:doc>
	<xsl:template name="tokenize">
		<xsl:param name="string" select="''"/>
		<xsl:param name="delimiters" select="' '"/>
		<xsl:param name="prefix"/>
		<xsl:param name="localize" select="true()"/>
		<xsl:choose>
			<xsl:when test="not($string)"/>
			<xsl:when test="not($delimiters)">
				<xsl:call-template name="_tokenize-characters">
					<xsl:with-param name="string" select="$string"/>
					<xsl:with-param name="prefix" select="$prefix"/>
					<xsl:with-param name="localize" select="$localize"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="_tokenize-delimiters">
					<xsl:with-param name="string" select="$string"/>
					<xsl:with-param name="delimiters" select="$delimiters"/>
					<xsl:with-param name="prefix" select="$prefix"/>
					<xsl:with-param name="localize" select="$localize"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="in"/>
	</xd:doc>
	<xsl:template name="show-nullFlavor">
		<xsl:param name="in"/>
		<xsl:if test="string-length($in) > 0">
			<xsl:call-template name="getLocalizedString">
				<xsl:with-param name="key" select="concat('nullFlavor_', $in)"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="in"/>
	</xd:doc>
	<xsl:template name="show-address">
		<xsl:param name="in"/>
		<xsl:if test="$in">
			<xsl:if test="$in/@use">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span style="color: black;">
						<xsl:call-template name="tokenize">
							<xsl:with-param name="prefix" select="'addressUse_'"/>
							<xsl:with-param name="string" select="$in/@use"/>
							<xsl:with-param name="delimiters" select="' '"/>
						</xsl:call-template>
						<xsl:text>: </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline color="black">
						<xsl:call-template name="tokenize">
							<xsl:with-param name="prefix" select="'addressUse_'"/>
							<xsl:with-param name="string" select="$in/@use"/>
							<xsl:with-param name="delimiters" select="' '"/>
						</xsl:call-template>
						<xsl:text>: </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:if>
			<xsl:if test="$in[@use][@nullFlavor]">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:call-template name="show-nullFlavor">
				<xsl:with-param name="in" select="$in/@nullFlavor"/>
			</xsl:call-template>
			<xsl:for-each select="$in/text() | $in/*">
				<xsl:choose>
					<xsl:when test="self::n1:useablePeriod"/>
					<!-- DTr1 only if not streetAddressLine -->
					<xsl:when test="self::n1:streetName">
						<xsl:if test="not(../n1:streetAddressLine)">
							<xsl:variable name="additionalLocator" select="
									following-sibling::n1:*[1][local-name() = 'additionalLocator'] |
									following-sibling::n1:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber' or local-name() = 'buildingNumberSuffix']/following-sibling::n1:*[1][local-name() = 'additionalLocator'] |
									following-sibling::n1:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber']/following-sibling::n1:*[1][local-name() = 'buildingNumberSuffix']/following-sibling::n1:*[1][local-name() = 'additionalLocator']"/>
							<xsl:variable name="houseNumber" select="
									following-sibling::n1:*[1][local-name() = 'houseNumberNumeric'] |
									following-sibling::n1:*[1][local-name() = 'houseNumber']"/>
							<xsl:variable name="buildingNumberSuffix" select="
									following-sibling::n1:*[1][local-name() = 'buildingNumberSuffix'] |
									following-sibling::n1:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber']/following-sibling::n1:*[1][local-name() = 'buildingNumberSuffix']"/>
							<xsl:value-of select="."/>
							<xsl:choose>
								<xsl:when test="string-length($houseNumber) > 0">
									<xsl:text>&#160;</xsl:text>
									<xsl:value-of select="$houseNumber"/>
									<xsl:if test="string-length($buildingNumberSuffix) > 0">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="$buildingNumberSuffix"/>
									</xsl:if>
								</xsl:when>
								<xsl:when test="string-length($buildingNumberSuffix) > 0">
									<xsl:text>&#160;</xsl:text>
									<xsl:value-of select="$buildingNumberSuffix"/>
								</xsl:when>
							</xsl:choose>
							<xsl:if test="string-length($additionalLocator) > 0">
								<xsl:text>&#160;</xsl:text>
								<xsl:value-of select="$additionalLocator"/>
								<xsl:variable name="houseNumber2" select="
										$additionalLocator/following-sibling::n1:*[1][local-name() = 'houseNumberNumeric'] |
										$additionalLocator/following-sibling::n1:*[1][local-name() = 'houseNumber']"/>
								<xsl:variable name="buildingNumberSuffix2" select="
										$additionalLocator/following-sibling::n1:*[1][local-name() = 'buildingNumberSuffix'] |
										$additionalLocator/following-sibling::n1:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber']/following-sibling::n1:*[1][local-name() = 'buildingNumberSuffix']"/>
								<xsl:choose>
									<xsl:when test="string-length($houseNumber2) > 0">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="$houseNumber2"/>
										<xsl:if test="string-length($buildingNumberSuffix2) > 0">
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="$buildingNumberSuffix2"/>
										</xsl:if>
									</xsl:when>
									<xsl:when test="string-length($buildingNumberSuffix2) > 0">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="$buildingNumberSuffix2"/>
									</xsl:when>
								</xsl:choose>
							</xsl:if>
							<xsl:if
								test="following-sibling::*[not(local-name() = 'houseNumber' or local-name() = 'houseNumberNumeric' or local-name() = 'buildingNumberSuffix' or local-name() = 'additionalLocator')][string-length(.) > 0 or @code]">
								<xsl:if test="not(contains($vendor, 'Saxonica'))">
									<br/>
								</xsl:if>
								<xsl:if test="(contains($vendor, 'Saxonica'))">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:if>
						</xsl:if>
					</xsl:when>
					<!-- DTr2 only if not streetAddressLine -->
					<xsl:when test="self::n1:part[@type = 'STR']">
						<xsl:if test="not(../n1:part[@type = 'SAL'])">
							<xsl:variable name="additionalLocator" select="
									following-sibling::n1:part[1][@type = 'ADL'] |
									following-sibling::n1:part[1][@type = 'BNN' or @type = 'BNR' or @type = 'BNS']/following-sibling::n1:part[1][@type = 'ADL'] |
									following-sibling::n1:part[1][@type = 'BNN' or @type = 'BNR' or @type = 'BNS']/following-sibling::n1:part[1][@type = 'BNS']/following-sibling::n1:part[1][@type = 'ADL']"/>
							<xsl:variable name="houseNumber" select="
									following-sibling::n1:part[1][@type = 'BNN'] |
									following-sibling::n1:part[1][@type = 'BNR']"/>
							<xsl:variable name="buildingNumberSuffix" select="
									following-sibling::n1:part[1][@type = 'BNS'] |
									following-sibling::n1:part[1][@type = 'BNN' or @type = 'BNR']/following-sibling::n1:part[1][@type = 'BNS']"/>
							<xsl:value-of select="."/>
							<xsl:choose>
								<xsl:when test="string-length($houseNumber) > 0">
									<xsl:text>&#160;</xsl:text>
									<xsl:value-of select="$houseNumber"/>
									<xsl:if test="string-length($buildingNumberSuffix) > 0">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="$buildingNumberSuffix"/>
									</xsl:if>
								</xsl:when>
								<xsl:when test="string-length($buildingNumberSuffix) > 0">
									<xsl:text>&#160;</xsl:text>
									<xsl:value-of select="$buildingNumberSuffix"/>
								</xsl:when>
							</xsl:choose>
							<xsl:if test="string-length($additionalLocator) > 0">
								<xsl:text>&#160;</xsl:text>
								<xsl:value-of select="$additionalLocator"/>

								<xsl:variable name="houseNumber2" select="
										$additionalLocator/following-sibling::n1:part[1][@type = 'BNN'] |
										$additionalLocator/following-sibling::n1:part[1][@type = 'BNR']"/>
								<xsl:variable name="buildingNumberSuffix2" select="
										$additionalLocator/following-sibling::n1:part[1][@type = 'BNS'] |
										$additionalLocator/following-sibling::n1:part[1][@type = 'BNN' or @type = 'BNR']/following-sibling::n1:part[1][@type = 'BNS']"/>

								<xsl:choose>
									<xsl:when test="string-length($houseNumber2) > 0">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="$houseNumber2"/>
										<xsl:if test="string-length($buildingNumberSuffix2) > 0">
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="$buildingNumberSuffix2"/>
										</xsl:if>
									</xsl:when>
									<xsl:when test="string-length($buildingNumberSuffix2) > 0">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="$buildingNumberSuffix2"/>
									</xsl:when>
								</xsl:choose>
							</xsl:if>
							<xsl:if
								test="following-sibling::*[not(@type = 'BNR' or local-name() = 'houseNumberNumeric' or @type = 'BNS' or @type = 'ADL')][string-length(.) > 0 or @code]">
								<xsl:if test="not(contains($vendor, 'Saxonica'))">
									<br/>
								</xsl:if>
								<xsl:if test="(contains($vendor, 'Saxonica'))">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:if>
						</xsl:if>
					</xsl:when>
					<!-- DTr1 only if not streetAddressLine -->
					<xsl:when
						test="self::n1:houseNumber or self::n1:houseNumberNumeric or self::n1:buildingNumberSuffix">
						<xsl:if test="not(../n1:streetAddressLine)">
							<xsl:if
								test="not(preceding-sibling::n1:*[1][local-name() = 'streetName' or local-name() = 'additionalLocator'])">
								<xsl:if
									test="not(self::n1:buildingNumberSuffix and preceding-sibling::n1:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber'])">
									<xsl:value-of select="."/>
									<xsl:if
										test="following-sibling::n1:*[1][string-length(.) > 0 or @code]">
										<xsl:text> </xsl:text>
									</xsl:if>
								</xsl:if>
							</xsl:if>
						</xsl:if>
					</xsl:when>
					<!-- DTr2 only if not streetAddressLine -->
					<xsl:when test="self::n1:part[@type = 'BNN' or @type = 'BNR' or @type = 'BNS']">
						<xsl:if test="not(../n1:part[@type = 'SAL'])">
							<xsl:if
								test="not(preceding-sibling::n1:*[1][n1:part[@type = 'STR' or @type = 'ADL']])">
								<xsl:if
									test="not(self::n1:part[@type = 'BNS'] and preceding-sibling::n1:*[1][@type = 'BNN' or @type = 'BNR'])">
									<xsl:value-of select="@value"/>
									<xsl:if
										test="following-sibling::n1:part[1][string-length(@value) > 0 or @code]">
										<xsl:text> </xsl:text>
									</xsl:if>
								</xsl:if>
							</xsl:if>
						</xsl:if>
					</xsl:when>
					<!-- DTr1 -->
					<xsl:when test="self::n1:additionalLocator">
						<xsl:if
							test="not(preceding-sibling::n1:*[1][local-name() = 'houseNumber' or local-name() = 'houseNumberNumeric' or local-name() = 'buildingNumberSuffix'])">
							<xsl:value-of select="."/>
							<xsl:if
								test="following-sibling::n1:*[1][local-name() = 'houseNumberNumeric']">
								<xsl:text>&#160;</xsl:text>
								<xsl:value-of
									select="following-sibling::n1:*[1][local-name() = 'houseNumberNumeric']"
								/>
							</xsl:if>
							<xsl:if test="following-sibling::n1:*[1][local-name() = 'houseNumber']">
								<xsl:text>&#160;</xsl:text>
								<xsl:value-of
									select="following-sibling::n1:*[1][local-name() = 'houseNumber']"
								/>
							</xsl:if>
							<xsl:if
								test="following-sibling::n1:*[1][local-name() = 'buildingNumberSuffix']">
								<xsl:text>&#160;</xsl:text>
								<xsl:value-of
									select="following-sibling::n1:*[1][local-name() = 'buildingNumberSuffix']"
								/>
							</xsl:if>
							<xsl:if test="following-sibling::n1:*[1][string-length(.) > 0 or @code]">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:if>
					</xsl:when>
					<!-- DTr2 -->
					<xsl:when test="self::n1:part[@type = 'ADL']">
						<xsl:if
							test="not(preceding-sibling::n1:*[1][@type = 'BNN' or @type = 'BNR' or @type = 'BNS'])">
							<xsl:value-of select="@value"/>
							<xsl:if test="following-sibling::n1:*[1][@type = 'BNN']">
								<xsl:text>&#160;</xsl:text>
								<xsl:value-of
									select="following-sibling::n1:*[1][@type = 'BNN']/@value"/>
							</xsl:if>
							<xsl:if test="following-sibling::n1:*[1][@type = 'BNR']">
								<xsl:text>&#160;</xsl:text>
								<xsl:value-of
									select="following-sibling::n1:*[1][@type = 'BNR']/@value"/>
							</xsl:if>
							<xsl:if test="following-sibling::n1:*[1][@type = 'BNS']">
								<xsl:text>&#160;</xsl:text>
								<xsl:value-of
									select="following-sibling::n1:*[1][@type = 'BNS']/@value"/>
							</xsl:if>
							<xsl:if
								test="following-sibling::n1:part[1][string-length(@value) > 0 or @code]">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:if>
					</xsl:when>
					<!-- DTr1 -->
					<xsl:when test="self::n1:postBox">
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="'Postbox'"/>
							<xsl:with-param name="post" select="' '"/>
						</xsl:call-template>
						<xsl:value-of select="."/>
						<xsl:if test="following-sibling::n1:*[1][string-length(.) > 0 or @code]">
							<xsl:text> </xsl:text>
						</xsl:if>
					</xsl:when>
					<!-- DTr2 -->
					<xsl:when test="self::n1:part[@type = 'POB']">
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="'Postbox'"/>
							<xsl:with-param name="post" select="' '"/>
						</xsl:call-template>
						<xsl:value-of select="@value"/>
						<xsl:if
							test="following-sibling::n1:part[1][string-length(@value) > 0 or @code]">
							<xsl:text> </xsl:text>
						</xsl:if>
					</xsl:when>
					<!-- DTr1 ZIP CITY, STATE or CITY, STATE ZIP depending on addr part contents -->
					<xsl:when test="self::n1:city">
						<xsl:if
							test="preceding-sibling::n1:postalCode[1][string-length(.) > 0 or @code]">
							<xsl:choose>
								<xsl:when
									test="preceding-sibling::n1:postalCode[1][string-length(.) > 0]">
									<xsl:value-of
										select="preceding-sibling::n1:postalCode[1][string-length(.) > 0]"
									/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="preceding-sibling::n1:postalCode[1][@code]/@code"/>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:value-of select="."/>
						<xsl:if test="../n1:state[string-length(.) > 0]">
							<xsl:text>, </xsl:text>
							<xsl:value-of select="../n1:state"/>
						</xsl:if>
						<xsl:if
							test="following-sibling::n1:postalCode[1][string-length(.) > 0 or @code]">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when
									test="following-sibling::n1:postalCode[1][string-length(.) > 0]">
									<xsl:value-of
										select="following-sibling::n1:postalCode[1][string-length(.) > 0]"
									/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="following-sibling::n1:postalCode[1][@code]/@code"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<xsl:if test="following-sibling::n1:*[1][string-length(.) > 0 or @code]">
							<xsl:text> </xsl:text>
						</xsl:if>
					</xsl:when>
					<!-- DTr2 ZIP CITY, STATE or CITY, STATE ZIP depending on addr part contents -->
					<xsl:when test="self::n1:part[@type = 'CTY']">
						<xsl:if
							test="preceding-sibling::n1:part[@type = 'ZIP'][1][string-length(@value) > 0 or @code]">
							<xsl:choose>
								<xsl:when
									test="preceding-sibling::n1:postalCode[1][string-length(@value) > 0]">
									<xsl:value-of
										select="preceding-sibling::n1:postalCode[1][string-length(@value) > 0]/@value"
									/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="preceding-sibling::n1:postalCode[1][@code]/@code"/>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:value-of select="@value"/>
						<xsl:if test="../n1:part[@type = 'STA'][string-length(@value) > 0]">
							<xsl:text>, </xsl:text>
							<xsl:value-of select="../n1:part[@type = 'STA']/@value"/>
						</xsl:if>
						<xsl:if
							test="following-sibling::n1:part[@type = 'ZIP'][1][string-length(@value) > 0 or @code]">
							<xsl:choose>
								<xsl:when
									test="following-sibling::n1:postalCode[1][string-length(@value) > 0]">
									<xsl:value-of
										select="following-sibling::n1:postalCode[1][string-length(@value) > 0]/@value"
									/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="following-sibling::n1:postalCode[1][@code]/@code"/>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if
							test="following-sibling::n1:part[1][string-length(@value) > 0 or @code]">
							<xsl:if test="not(contains($vendor, 'Saxonica'))">
								<br/>
							</xsl:if>
							<xsl:if test="(contains($vendor, 'Saxonica'))">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:if>
					</xsl:when>
					<!-- DTr1 -->
					<xsl:when test="self::n1:postalCode and ../n1:city"/>
					<!-- DTr2 -->
					<xsl:when test="self::n1:part[@type = 'ZIP'] and ../n1:part[@type = 'CTY']"/>
					<!-- DTr1 -->
					<xsl:when test="self::n1:state">
						<xsl:if test="not(../n1:city)">
							<xsl:if
								test="(string-length(preceding-sibling::n1:*[1]) > 0 or preceding-sibling::*/@code)">
								<xsl:if test="not(contains($vendor, 'Saxonica'))">
									<br/>
								</xsl:if>
								<xsl:if test="(contains($vendor, 'Saxonica'))">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:if>
							<xsl:value-of select="."/>
							<xsl:if
								test="(string-length(following-sibling::n1:*[1]) > 0 or following-sibling::*/@code)">
								<xsl:if test="not(contains($vendor, 'Saxonica'))">
									<br/>
								</xsl:if>
								<xsl:if test="(contains($vendor, 'Saxonica'))">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:if>
						</xsl:if>
					</xsl:when>
					<!-- DTr2 -->
					<xsl:when test="self::n1:part[@type = 'STA']">
						<xsl:if test="not(../n1:part[@type = 'CTY'])">
							<xsl:if
								test="(string-length(preceding-sibling::n1:*[1]/@value) > 0 or preceding-sibling::n1:*/@code)">
								<xsl:if test="not(contains($vendor, 'Saxonica'))">
									<br/>
								</xsl:if>
								<xsl:if test="(contains($vendor, 'Saxonica'))">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:if>
							<xsl:value-of select="@value"/>
							<xsl:if
								test="(string-length(following-sibling::n1:*[1]/@value) > 0 or following-sibling::n1:*/@code)">
								<xsl:if test="not(contains($vendor, 'Saxonica'))">
									<br/>
								</xsl:if>
								<xsl:if test="(contains($vendor, 'Saxonica'))">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:if>
						</xsl:if>
					</xsl:when>
					<!-- DTr1 -->
					<xsl:when test="string-length(text()) > 0">
						<xsl:value-of select="."/>
						<xsl:if
							test="(string-length(following-sibling::n1:*[1]) > 0 or following-sibling::n1:*/@code)">
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if test="string(number(following-sibling::n1:*[1])) != 'NaN'">
							<xsl:if
								test="number(following-sibling::n1:*[1]) = following-sibling::n1:*[1]">
								<xsl:if test="not(contains($vendor, 'Saxonica'))">
									<br/>
								</xsl:if>
								<xsl:if test="(contains($vendor, 'Saxonica'))">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:if>
						</xsl:if>
					</xsl:when>
					<!-- DTr2 -->
					<xsl:when test="string-length(@value) > 0">
						<xsl:value-of select="@value"/>
						<xsl:if
							test="(string-length(following-sibling::n1:*[1]/@value) > 0 or following-sibling::n1:*/@code)">
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if test="string(number(following-sibling::n1:*[1]/@value)) != 'NaN'">
							<xsl:if
								test="number(following-sibling::n1:*[1]/@value) = following-sibling::n1:*[1]/@value">
								<xsl:if test="not(contains($vendor, 'Saxonica'))">
									<br/>
								</xsl:if>
								<xsl:if test="(contains($vendor, 'Saxonica'))">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:if>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise> </xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="$in/n1:useablePeriod">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<div>
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="'Period'"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:call-template name="show-ivlts">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</div>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:block>
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="key" select="'Period'"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:call-template name="show-ivlts">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</fo:block>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="in"/>
	</xd:doc>
	<xsl:template name="show-ivlts">
		<xsl:param name="in"/>
		<xsl:if test="$in">
			<xsl:variable name="fromDate">
				<xsl:call-template name="show-timestamp">
					<xsl:with-param name="in" select="$in/n1:low"/>
					<xsl:with-param name="part" select="'date'"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="toDate">
				<xsl:call-template name="show-timestamp">
					<xsl:with-param name="in" select="$in/n1:high"/>
					<xsl:with-param name="part" select="'date'"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="fromTime">
				<xsl:call-template name="show-timestamp">
					<xsl:with-param name="in" select="$in/n1:low"/>
					<xsl:with-param name="part" select="'time'"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="toTime">
				<xsl:call-template name="show-timestamp">
					<xsl:with-param name="in" select="$in/n1:high"/>
					<xsl:with-param name="part" select="'time'"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:choose>
				<xsl:when test="$in/@value">
					<xsl:call-template name="getLocalizedString">
						<xsl:with-param name="key" select="'at'"/>
						<xsl:with-param name="post" select="'&#160;'"/>
					</xsl:call-template>
					<xsl:call-template name="show-timestamp">
						<xsl:with-param name="in" select="$in"/>
					</xsl:call-template>
				</xsl:when>
				<!-- Same day, different times -->
				<xsl:when test="$fromDate = $toDate">
					<xsl:call-template name="show-timestamp">
						<xsl:with-param name="in" select="$in/n1:low"/>
						<xsl:with-param name="part" select="'date'"/>
					</xsl:call-template>

					<xsl:if test="string-length(normalize-space($fromTime)) > 0">
						<xsl:text> </xsl:text>
						<xsl:value-of select="normalize-space($fromTime)"/>

						<xsl:if test="string-length(normalize-space($toTime)) > 0">
							<xsl:text> - </xsl:text>
							<xsl:value-of select="normalize-space($toTime)"/>
						</xsl:if>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$in/n1:low">
					<xsl:call-template name="getLocalizedString">
						<xsl:with-param name="key" select="'from'"/>
						<xsl:with-param name="post" select="'&#160;'"/>
					</xsl:call-template>
					<xsl:call-template name="show-timestamp">
						<xsl:with-param name="in" select="$in/n1:low"/>
					</xsl:call-template>
					<xsl:if test="$in/n1:high">
						<xsl:call-template name="getLocalizedString">
							<xsl:with-param name="pre" select="' '"/>
							<xsl:with-param name="key" select="'to'"/>
							<xsl:with-param name="post" select="'&#160;'"/>
						</xsl:call-template>
						<xsl:call-template name="show-timestamp">
							<xsl:with-param name="in" select="$in/n1:high"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$in/n1:high">
					<xsl:call-template name="getLocalizedString">
						<xsl:with-param name="key" select="'to'"/>
						<xsl:with-param name="post" select="'&#160;'"/>
					</xsl:call-template>
					<xsl:call-template name="show-timestamp">
						<xsl:with-param name="in" select="$in/n1:high"/>
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="in"/>
		<xd:param name="part"/>
	</xd:doc>
	<xsl:template name="show-timestamp">
		<xsl:param name="in"/>
		<xsl:param name="part" select="'datetime'"/>

		<xsl:call-template name="formatDateTime">
			<xsl:with-param name="date" select="$in/@value"/>
			<xsl:with-param name="part" select="$part"/>
		</xsl:call-template>
	</xsl:template>




	<xd:doc>
		<xd:desc/>
		<xd:param name="telecom"/>
	</xd:doc>
	<xsl:template name="show-telecom">
		<xsl:param name="telecom"/>
		<xsl:choose>
			<xsl:when test="$telecom">
				<xsl:variable name="type" select="substring-before($telecom/@value, ':')"/>
				<xsl:variable name="value" select="substring-after($telecom/@value, ':')"/>
				<xsl:if test="$type">
					<xsl:if test="not(@use) or ($type = 'mailto')">
						<xsl:call-template name="translateTelecomCode">
							<xsl:with-param name="code" select="$type"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="@use">
						<xsl:text> </xsl:text>
						<xsl:if test="($type != 'mailto')">
							<xsl:call-template name="translateTelecomCode">
								<xsl:with-param name="code" select="@use"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="($type = 'mailto')">
							<xsl:text>(</xsl:text>
							<xsl:call-template name="translateTelecomCode">
								<xsl:with-param name="code" select="@use"/>
							</xsl:call-template>
							<xsl:text>)</xsl:text>
						</xsl:if>
					</xsl:if>
					<xsl:text>: </xsl:text>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$value"/>
				</xsl:if>
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Coordonnées téléphoniques non renseignées</xsl:text>
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<br/>
		</xsl:if>
		<xsl:if test="contains($vendor, 'Saxonica')">
			<fo:block line-height="0.1cm">&#160;</fo:block>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="code"/>
	</xd:doc>
	<xsl:template name="translateTelecomCode">
		<xsl:param name="code"/>
		<xsl:choose>
			<!-- lookup table Telecom URI -->
			<xsl:when test="$code = 'tel'">
				<xsl:text>Tel</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'fax'">
				<xsl:text>Fax</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'http'">
				<xsl:text>Page Web</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'mailto'">
				<xsl:text>Adresse de messagerie</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'H'">
				<xsl:text>Domicile</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'TMP'">
				<xsl:text>Adresse temporaire</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'HV'">
				<xsl:text>Domicile de vacances</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'HP'">
				<xsl:text>Domicile principal</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'WP'">
				<xsl:text>Travail</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'PUB'">
				<xsl:text>Numéro Public</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'DIR'">
				<xsl:text>Numéro direct</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'EC'">
				<xsl:text>Urgence</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'MC'">
				<xsl:text>Mobile</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'PG'">
				<xsl:text>Pager</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>{$code='</xsl:text>
				<xsl:value-of select="$code"/>
				<xsl:text>'?}</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xd:doc>
		<xd:desc> formatDateTime </xd:desc>
		<xd:param name="date"/>
	</xd:doc>
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


	<xd:doc>
		<xd:desc> show-name </xd:desc>
		<xd:param name="name"/>
	</xd:doc>
	<xsl:template name="show-name">
		<xsl:param name="name"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
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
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="$name/n1:family">
					<xsl:choose>
						<xsl:when test="$name/n1:suffix">
							<xsl:for-each select="$name/n1:suffix">
								<fo:block font-weight="bold">
									<xsl:value-of select="."/>
								</fo:block>
								<xsl:text> </xsl:text>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="$name/n1:prefix">
								<fo:block font-weight="bold">
									<xsl:value-of select="."/>
								</fo:block>
								<xsl:text> </xsl:text>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:for-each select="$name/n1:given">
						<fo:block font-weight="bold">
							<xsl:value-of select="."/>
							<xsl:text> </xsl:text>
						</fo:block>
					</xsl:for-each>
					<xsl:for-each select="$name/n1:family">
						<fo:block font-weight="bold">
							<xsl:value-of select="."/>
						</fo:block>
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
					<fo:block font-weight="bold">
						<xsl:value-of select="$name"/>
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-gender </xd:desc>
	</xd:doc>
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


	<xd:doc>
		<xd:desc> show-address-city </xd:desc>
		<xd:param name="address"/>
	</xd:doc>
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
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<br/>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:block line-height="0.1cm">&#160;</fo:block>
					</xsl:if>
				</xsl:if>
				<xsl:if test="string-length($address/n1:city) > 0">
					<xsl:text> </xsl:text>
					<xsl:value-of select="$address/n1:city"/>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-address-county </xd:desc>
		<xd:param name="address"/>
	</xd:doc>
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
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<br/>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:block line-height="0.1cm">&#160;</fo:block>
					</xsl:if>
				</xsl:if>
				<xsl:if test="string-length($address/n1:county) > 0">
					<xsl:text> </xsl:text>
					<xsl:value-of select="$address/n1:county"/>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-identifiant </xd:desc>
		<xd:param name="id"/>
	</xd:doc>
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


	<xd:doc>
		<xd:desc> show-id </xd:desc>
		<xd:param name="id"/>
	</xd:doc>
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


	<xd:doc>
		<xd:desc> show-guardian </xd:desc>
		<xd:param name="guardian"/>
	</xd:doc>
	<xsl:template name="show-guardian">
		<xsl:param name="guardian"/>
		<br/>
		<xsl:for-each select="$guardian/n1:guardianPerson">
			<xsl:call-template name="show-name">
				<xsl:with-param name="name" select="."/>
			</xsl:call-template>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<br/>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:if>
			<xsl:for-each select="$guardian/n1:addr">
				<xsl:call-template name="show-address-patient">
					<xsl:with-param name="address" select="."/>
				</xsl:call-template>
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<br/>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:block line-height="0.1cm">&#160;</fo:block>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<br/>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:if>
			<xsl:for-each select="$guardian/n1:telecom">
				<xsl:call-template name="show-telecom">
					<xsl:with-param name="telecom" select="."/>
				</xsl:call-template>
			</xsl:for-each>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<br/>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="$guardian/n1:guardianOrganization">
			<xsl:call-template name="show-name">
				<xsl:with-param name="name" select="."/>
			</xsl:call-template>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<br/>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:if>
			<xsl:for-each select="$guardian/n1:addr">
				<xsl:call-template name="show-address-patient">
					<xsl:with-param name="address" select="."/>
				</xsl:call-template>
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<br/>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:block line-height="0.1cm">&#160;</fo:block>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<br/>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:if>
			<xsl:for-each select="$guardian/n1:telecom">
				<xsl:call-template name="show-telecom">
					<xsl:with-param name="telecom" select="."/>
				</xsl:call-template>
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<br/>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:block line-height="0.1cm">&#160;</fo:block>
				</xsl:if>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc> show-address-patient </xd:desc>
		<xd:param name="address"/>
	</xd:doc>
	<xsl:template name="show-address-patient">
		<xsl:param name="address"/>
		<xsl:choose>
			<xsl:when test="$address">
				<xsl:if test="$address/@use">
					<xsl:text> </xsl:text>
					<xsl:call-template name="translateTelecomCode">
						<xsl:with-param name="code" select="$address/@use"/>
					</xsl:call-template>
					<xsl:text>:</xsl:text>
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<br/>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:block line-height="0.1cm">&#160;</fo:block>
					</xsl:if>
				</xsl:if>
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

	<xd:doc>
		<xd:desc> show-patient-name </xd:desc>
		<xd:param name="name"/>
	</xd:doc>
	<xsl:template name="show-patient-name">
		<xsl:param name="name"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
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
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:if test="$name/n1:prefix">
				<xsl:text>Civilité</xsl:text>
				<xsl:for-each select="$name/n1:prefix">
					<fo:block line-height="0.1cm">&#160;</fo:block>
				</xsl:for-each>
			</xsl:if>
			<xsl:for-each select="$name/n1:family">
				<xsl:choose>
					<xsl:when test="@qualifier">
						<xsl:choose>
							<xsl:when test="@qualifier = &apos;BR&apos;">
								<xsl:text>Nom de naissance </xsl:text>
								<!--<xsl:value-of select="."/>-->
								<fo:block line-height="0.1cm">&#160;</fo:block>
								<xsl:text>Prénom(s) </xsl:text>
								<fo:block line-height="0.1cm">&#160;</fo:block>
							</xsl:when>
							<xsl:when test="@qualifier = &apos;SP&apos;">
								<xsl:text>Nom d'usage </xsl:text>
								<fo:block line-height="0.1cm">&#160;</fo:block>
							</xsl:when>
							<xsl:when test="@qualifier = &apos;CL&apos;">
								<xsl:text>Nom et prénom utilisés </xsl:text>
								<xsl:text>&#160;</xsl:text>
								<fo:block line-height="0.1cm">&#160;</fo:block>
							</xsl:when>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Nom </xsl:text>
						<fo:block line-height="0.1cm">&#160;</fo:block>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc/>
		<xd:param name="name"/>
	</xd:doc>
	<xsl:template name="show-patient-name-field">
		<xsl:param name="name"/>
		<xsl:if test="$name/n1:prefix">
			<xsl:for-each select="$name/n1:prefix">
				<xsl:value-of select="."/>
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:for-each>
		</xsl:if>
		<xsl:for-each select="$name/n1:family">
			<xsl:choose>
				<xsl:when test="@qualifier">
					<xsl:choose>
						<xsl:when test="@qualifier = &apos;BR&apos;">
							<fo:block font-weight="bold">
								<xsl:value-of select="."/>
							</fo:block>
							<fo:block line-height="0.1cm">&#160;</fo:block>
							<xsl:variable name="count" select="count($name/n1:given)"/>
							<xsl:for-each select="$name/n1:given">
								<xsl:choose>
									<xsl:when test="@qualifier = &apos;BR&apos;">
										<xsl:value-of select="."/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="."/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="$count > 1">
									<xsl:if test="(position() != last()) and (position() > 1)">
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
							<fo:block line-height="0.1cm">&#160;</fo:block>
						</xsl:when>
						<xsl:when test="@qualifier = &apos;SP&apos;">
							<xsl:value-of select="."/>
							<fo:block line-height="0.1cm">&#160;</fo:block>
						</xsl:when>
						<xsl:when test="@qualifier = &apos;CL&apos;">
							<fo:block font-weight="bold">
								<xsl:value-of select="."/>
								<xsl:text>&#160;</xsl:text>
								<xsl:for-each select="$name/n1:given">
									<xsl:if test="@qualifier = &apos;CL&apos;">
										<xsl:value-of select="."/>
									</xsl:if>
									<xsl:text>&#160;</xsl:text>
								</xsl:for-each>
							</fo:block>
							<fo:block line-height="0.1cm">&#160;</fo:block>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
					<fo:block line-height="0.1cm">&#160;</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>


	<xd:doc>
		<xd:desc> show time </xd:desc>
		<xd:param name="datetime"/>
	</xd:doc>
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
