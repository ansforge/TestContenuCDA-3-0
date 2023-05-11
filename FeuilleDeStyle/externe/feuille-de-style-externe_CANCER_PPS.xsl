<?xml version="1.0" encoding="utf-8"?>
<!--
  Title : cda_asip_CANCER_PPS.xsl
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
	xmlns:n1="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:data="urn:asip-sante:ci-sis" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:fox="http://xmlgraphics.apache.org/fop/extensions"
	xmlns:xad="http://uri.etsi.org/01903/v1.2.2#" exclude-result-prefixes="n1 xsi data ds xad">
	<xsl:output method="html" indent="yes" version="4.01" encoding="utf-8"
		doctype-system="http://www.w3.org/TR/html4/strict.dtd"
		doctype-public="-//W3C//DTD HTML 4.01//EN"/>


	<!-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: -->
	<!--         Feuille de style XSLT de l'INCa pour PPS EN CANCEROLOGIE           -->
	<!-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: -->
	<xsl:template match="xsl:stylesheet">
		<xsl:apply-templates select="n1:ClinicalDocument"/>
	</xsl:template>
	<xsl:template match="n1:ClinicalDocument">
		<html>
			<head>
				<script>
          window.onload = function() 
          {
            document.getElementById("progression-id").style.fontWeight="bold";
            document.getElementById("progression-id").style.color="black";
            var element = document.getElementById("diagnostic-table");
            element.classList.add("data");
            var phase = document.getElementById("phase-clinique");
            phase.classList.add("data");
            var cancer = document.getElementById("cancer-decouverte");
            cancer.classList.add("depistage");
            var programme = document.getElementById("programme-therapeutique");
            programme.classList.add("prog-terap");
            var programme1 = document.getElementById("proposition-therapeutique");
            programme1.classList.add("prog-terap");
            var prevention = document.getElementById("prevention-gestion");
            prevention.classList.add("prog-terap");
            var suivi = document.getElementById("suivi-phase-active");
            suivi.classList.add("prog-terap");
            var arret = document.getElementById("arret-traitements-id");
            arret.classList.add("table3col");
            var mesure = document.getElementById("mesure-associe");
            mesure.classList.add("table3col");
            var support = document.getElementById("synthese-soins");
            support.classList.add("support");
            var support1 = document.getElementById("soins-oncologiques");
            support1.classList.add("support");
            var accompagnement = document.getElementById("accompagnement");
            accompagnement.classList.add("support");
          }
        </script>
				<title>
					<xsl:value-of select="n1:title"/>
				</title>
				<style>
					body {
					    color: #003366;
					    font-family: Calibri, sans-serif;
					    font-size: 10px;
					}
					h1 {
					}
					h2 {
					    margin: 0px;
					}
					h3 {
					    color: black;
					}
					table {
					    table-layout: auto;
					    border-collapse: collapse;
					    width: 100%;
					}
					.depistage td:nth-child(1) {
					    width: 350px;
					}
					.depistage {
					    color: #003366;
					    font-family: Verdana, Tahoma, sans-serif;
					    font-size: 10px;
					    font-weight: normal;
					}
					.synthese td:nth-child(1) {
					    width: 80px;
					}
					.synthese td:nth-child(2) {
					    width: 80px;
					}
					.synthese td:nth-child(3) {
					    width: 200px;
					}
					.synthese {
					    color: #003366;
					    font-family: Verdana, Tahoma, sans-serif;
					    font-size: 10px;
					    font-weight: normal;
					}
					.prog-terap {
					    color: #003366;
					    font-family: Verdana, Tahoma, sans-serif;
					    font-size: 10px;
					    font-weight: normal;
					}
					.prog-terap td:nth-child(1) {
					    width: 90px;
					}
					.prog-terap td:nth-child(2) {
					    width: 80px;
					}
					.prog-terap td:nth-child(3) {
					    width: 80px;
					}
					.prog-terap td:nth-child(4) {
					    width: 80px;
					}
					.prog-terap td:nth-child(5) {
					    width: 130px;
					}
					.prog-terap td:nth-child(6) {
					    width: 130px;
					}
					.prog-terap td:nth-child(7) {
					    width: 130px;
					}
					.prog-terap td:nth-child(8) {
					    width: 130px;
					}
					.prog-terap td:nth-child(9) {
					    width: 130px;
					}
					.prog-terap td:nth-child(10) {
					    width: 200px;
					}
					.table3col {
					    color: #003366;
					    font-family: Verdana, Tahoma, sans-serif;
					    font-size: 10px;
					    font-weight: normal;
					}
					.support {
					    color: #003366;
					    font-family: Verdana, Tahoma, sans-serif;
					    font-size: 10px;
					    font-weight: normal;
					}
					.table3col td:nth-child(1) {
					    width: 300px;
					}
					.table3col td:nth-child(2) {
					    width: 300px;
					}
					.support td:nth-child(1) {
					    width: 90px;
					}
					.support td:nth-child(2) {
					    width: 80px;
					}
					.support td:nth-child(3) {
					    width: 80px;
					}
					.support td:nth-child(4) {
					    width: 80px;
					}
					.support td:nth-child(5) {
					    width: 150px;
					}
					.support td:nth-child(6) {
					    width: 150px;
					}
					.support td:nth-child(7) {
					    width: 150px;
					}
					
					th {
					    padding: 0px 5px 0px 5px;
					    text-align: left;
					    background-color: lightsteelblue;
					    color: black;
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
					b {
					    color: black;
					    font-size: 10px;
					    font-weight: bold;
					    overflow: hidden;
					    display: block;
					    line-height: 11px;
					}
					.data {
					    color: #003366;
					    font-family: Verdana, Tahoma, sans-serif;
					    font-size: 10px;
					    font-weight: normal;
					}
					.title {
					    font-size: 18pt;
					    font-weight: bold;
					    text-align: center;
					    width: 80%;
					}
					.header_table {
					    border: 1pt solid #00008b;
					    border-collapse: separate;
					}
					.td_label {
					    color: black;
					    font-family: Verdana, Tahoma, sans-serif;
					    font-size: 10px;
					}
					tbody:before {
					    content: "-";
					    display: block;
					    line-height: 1em;
					    color: transparent;
					}
					tbody:after {
					    content: "-";
					    display: block;
					    line-height: 1em;
					    color: transparent;
					}
					tr.border-bottom td {
					    border-bottom: 1px solid black;
					    font-weight: normal;
					    padding-top: 5px;
					    padding-bottom: 5px;
					}
					.contact {
					    background-color: silver;
					    font-size: 12pt;
					    font-weight: bold;
					    width: 100%;
					    color: black;
					}
					.watermark {
					    position: absolute; /* or fixed */
					    top: 0;
					    bottom: 0;
					    left: 0;
					    right: 0;
					    z-index: -1;
					    color: #0d745e;
					    font-size: 100px;
					    display: grid;
					    justify-content: center;
					    align-content: center;
					    opacity: 0.2;
					    transform: rotate(-45deg);
					}</style>
			</head>
			<body type="text/javascript">
				<!-- Nom du 3C / titre du document / Nom du RRC -->
				<!-- filigrane avec texte -->
				<div class="watermark">FILIGRANE</div>
				<table id="header" width="100%">
					<tr>
						<td width="15%">
							<!-- 
              <xsl:call-template name="printLogo"/>
              <br/> -->
							<p>
								<span class="data">
									<xsl:call-template name="show-name">
										<xsl:with-param name="name"
											select="n1:participant[n1:functionCode/n1:translation/@code = 'ORG-190']/n1:associatedEntity/n1:scopingOrganization/n1:name"
										/>
									</xsl:call-template>
									<br/>
								</span>
							</p>
							<br/>
						</td>
						<td width="70%">
							<h1 class="title">
								<xsl:value-of select="//n1:title"/>
							</h1>
						</td>
						<td width="15%">
							<!-- 
              <xsl:call-template name="printLogoInstitut"/>
              <br/> -->
							<p>
								<span class="data">
									<xsl:call-template name="show-name">
										<xsl:with-param name="name"
											select="n1:participant[n1:functionCode/n1:translation/@code = 'ORG-191']/n1:associatedEntity/n1:scopingOrganization/n1:name"
										/>
									</xsl:call-template>
									<br/>
								</span>
							</p>
						</td>
					</tr>
				</table>

				<!-- Entête : Patient et Document -->
				<div style="overflow: hidden;width:100%">
					<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
					<!-- Informations sur le patient -->
					<div style="width: 100%;">
						<span style="font-weight:bold;">Patient</span>
						<table class="header_table">
							<tbody>
								<!-- Nom du patient -->
								<xsl:call-template name="show-patient-name">
									<xsl:with-param name="name"
										select="n1:recordTarget//n1:patient/n1:name"/>
								</xsl:call-template>
								<!-- Date de naissance -->
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
								<!-- Sexe -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Sexe</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:for-each
											select="n1:recordTarget//n1:patient/n1:administrativeGenderCode">
											<xsl:call-template name="show-gender"/>
										</xsl:for-each>
									</td>
								</tr>
								<!-- Lieu de naissance -->
								<xsl:if test="n1:recordTarget//n1:patient/n1:birthplace/n1:place">
									<tr>
										<td width="20%">
											<span class="td_label">
												<xsl:text>Lieu de naissance</xsl:text>
											</span>
										</td>
										<td width="80%">
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
									<!-- Code INSEE du Lieu de naissance -->
									<tr>
										<td width="20%">
											<xsl:if
												test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr/n1:county">
												<span class="td_label">
												<xsl:text>Code INSEE</xsl:text>
												</span>
											</xsl:if>
										</td>
										<td width="80%">
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
								<!-- Médecin traitant -->
								<xsl:if test="n1:participant/@typeCode = 'INF'">
									<xsl:if test="n1:participant[n1:functionCode/@code = 'PCP']">
										<br/>
										<tr>
											<td width="20%">
												<xsl:if
												test="n1:participant[n1:functionCode/@code = 'PCP']/n1:associatedEntity/n1:associatedPerson/n1:name">
												<span class="td_label">
												<xsl:text>Médecin traitant</xsl:text>
												</span>
												</xsl:if>
											</td>
											<td width="80%">
												<xsl:if
												test="n1:participant[n1:functionCode/@code = 'PCP']/n1:associatedEntity/n1:associatedPerson/n1:name">
												<xsl:call-template name="show-name-not-bold">
												<xsl:with-param name="name"
												select="n1:participant[n1:functionCode/@code = 'PCP']/n1:associatedEntity/n1:associatedPerson/n1:name"
												/>
												</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Informations sur le document -->
					<div style="width: 100%; padding-top: 10px">
						<span style="font-weight:bold;">Document</span>
						<table class="header_table">
							<tbody>
								<!-- Version du document -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Version et statut du document</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:call-template name="show-version">
											<xsl:with-param name="version" select="n1:versionNumber"
											/>
										</xsl:call-template>
										<xsl:text>&#160;-&#160;&#160;</xsl:text>
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-statut-document">
												<xsl:with-param name="statut_document"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-065']/n1:value/@displayName"
												/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<br/>
								<!-- Motif de mise à jour -->
								<tr>
									<td width="20%" style="vertical-align: top;">
										<span class="td_label">
											<xsl:text>Motif de mise à jour</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-motif-update">
												<xsl:with-param name="motif"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-037']/n1:value/@displayName"
												/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="show-commentaire-motif">
												<xsl:with-param name="commentaire-motif"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:text"
												/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<br/>
								<!-- Date de remise au patient -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Date de remise du document au patient</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-date-remise-document">
												<xsl:with-param name="remise"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-178']/n1:effectiveTime/@value"
												/>
											</xsl:call-template>
										</xsl:if>
										<span class="td_label">
											<xsl:text> par le </xsl:text>
										</span>
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-name-not-bold">
												<xsl:with-param name="name"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-178']/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name"
												/>
											</xsl:call-template>
										</xsl:if>
										<span class="td_label">
											<xsl:text>&#160;(</xsl:text>
										</span>
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-name-not-bold">
												<xsl:with-param name="name"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-178']/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name"
												/>
											</xsl:call-template>
										</xsl:if>
										<span class="td_label">
											<xsl:text>)</xsl:text>
										</span>
									</td>
								</tr>
								<br/>
								<!-- Commentaire sur le document -->
								<tr>
									<td width="20%" style="vertical-align: top;">
										<span class="td_label">
											<xsl:text>Commentaire sur le document</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-commentaire-document">
												<xsl:with-param name="commentaire-document"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:text"
												/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- Corps du document -->
				<xsl:apply-templates select="n1:component/n1:structuredBody"/>

				<!-- Contacts utiles -->
				<div>
					<xsl:call-template name="participant"/>
				</div>

				<!-- Informations du patient -->
				<div style="width: 100%;">
					<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
					<p class="contact">
						<xsl:text>PATIENT</xsl:text>
					</p>
					<table>
						<tbody>
							<!-- Nom du patient -->
							<xsl:call-template name="show-patient-name">
								<xsl:with-param name="name"
									select="n1:recordTarget//n1:patient/n1:name"/>
							</xsl:call-template>
							<!-- Date de naissance -->
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
							<!-- Sexe -->
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Sexe</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:for-each
										select="n1:recordTarget//n1:patient/n1:administrativeGenderCode">
										<xsl:call-template name="show-gender"/>
									</xsl:for-each>
								</td>
							</tr>
							<!-- Lieu de naissance -->
							<xsl:if test="n1:recordTarget//n1:patient/n1:birthplace/n1:place">
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Lieu de naissance</xsl:text>
										</span>
									</td>
									<td width="80%">
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
								<!-- Code INSEE du Lieu de naissance -->
								<tr>
									<td width="20%">
										<xsl:if
											test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr/n1:county">
											<span class="td_label">
												<xsl:text>Code INSEE</xsl:text>
											</span>
										</xsl:if>
									</td>
									<td width="80%">
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
							<!-- Adresse -->
							<tr>
								<td width="20%" style="vertical-align: top;">
									<span class="td_label">
										<xsl:text>Adresse</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:call-template name="show-address-patient">
										<xsl:with-param name="address"
											select="n1:recordTarget/n1:patientRole/n1:addr"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Telécom(s) -->
							<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:telecom">
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Telécom</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:call-template name="show-telecom">
											<xsl:with-param name="telecom" select="."/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
							<br/>
							<!-- INS -->
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>INS</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:id">
										<xsl:choose>
											<xsl:when test="@root = '1.2.250.1.213.1.4.8'">
												<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
												<span class="data">
												<xsl:text>[NIR]</xsl:text>
												</span>
											</xsl:when>
											<xsl:when test="@root = '1.2.250.1.213.1.4.9'">
												<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
												<span class="data">
												<xsl:text>[NIA]</xsl:text>
												</span>
											</xsl:when>
											<xsl:when test="@root = '1.2.250.1.213.1.4.10'">
												<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
												<span class="data">
												<xsl:text>[TEST]</xsl:text>
												</span>
											</xsl:when>
											<xsl:when test="@root = '1.2.250.1.213.1.4.11'">
												<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
												<span class="data">
												<xsl:text>[DEMO]</xsl:text>
												</span>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>&#160;</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</td>
							</tr>
							<!-- IPP -->
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>IPP</xsl:text>
									</span>
								</td>
								<td width="80%">
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
							<br/>
							<!-- Représentant du patient (guardian) -->
							<tr>
								<td width="20%" style="vertical-align: top;">
									<span class="td_label">
										<xsl:text>Représentant du patient</xsl:text>
									</span>
								</td>
								<td width="80%">
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
							<br/>
							<!-- Personne de confiance / Contact en cas d'urgence (informant) -->
							<xsl:for-each select="n1:informant">
								<xsl:if test="n1:relatedEntity">
									<tr>
										<td width="20%" style="vertical-align: top;">
											<span class="td_label">
												<xsl:call-template name="show-relatedEntityClass">
												<xsl:with-param name="clsCode"
												select="n1:relatedEntity/@classCode"/>
												</xsl:call-template>
											</span>
										</td>
										<td width="80%">
											<xsl:if test="n1:relatedEntity">
												<xsl:call-template name="show-relatedEntity">
												<xsl:with-param name="relatedEntity"
												select="n1:relatedEntity"/>
												</xsl:call-template>
												<xsl:if test="n1:relatedEntity/n1:addr">
												<xsl:call-template name="show-address">
												<xsl:with-param name="address"
												select="n1:relatedEntity/n1:addr"/>
												</xsl:call-template>
												</xsl:if>
												<xsl:if test="n1:relatedEntity/n1:telecom">
												<br/>
												<xsl:for-each select="n1:relatedEntity/n1:telecom">
												<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
												</xsl:call-template>
												</xsl:for-each>
												</xsl:if>
											</xsl:if>
										</td>
									</tr>
								</xsl:if>
								<br/>
							</xsl:for-each>
							<!-- Commentaire sur le patient -->
							<tr>
								<td width="20%" style="vertical-align: top;">
									<span class="td_label">
										<xsl:text>Commentaire sur le patient</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:if
										test="(n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.4.1.2.16']/n1:code[n1:translation/@code = 'GEN-293'])">
										<xsl:call-template name="show-comm-patient">
											<xsl:with-param name="commentaire"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.4.1.2.16']/n1:text"
											/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<br/>
							<!-- Pédiatrie -->
							<tr>
								<td width="20%" style="vertical-align: top;">
									<span class="td_label">
										<xsl:text>Pédiatrie</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:if
										test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.3.1')">
										<xsl:call-template name="show-pediatrie">
											<xsl:with-param name="pediatrie"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.3.1']/n1:text"
											/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<br/>
							<!-- Commentaire sur pédiatrie -->
							<tr>
								<td width="20%" style="vertical-align: top;">
									<span class="td_label">
										<xsl:text>Commentaire sur pédiatrie</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:if
										test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.3.1')">
										<xsl:call-template name="show-commentaire-pediatrie">
											<xsl:with-param name="commentaire-pediatrie"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.3.1']/n1:text"
											/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<br/>
						</tbody>
					</table>
				</div>

				<!-- Section FR-Diagnostic-du-cancer : TUMEUR -->
				<xsl:for-each select="n1:component/n1:structuredBody/n1:component/n1:section">
					<xsl:if test="n1:templateId/@root = '2.16.840.1.113883.10.20.1.11'">
						<p
							style="background-color: silver;font-size: 12pt;font-weight: bold;width:100%;color: black;">
							<xsl:text>DIAGNOSTIC</xsl:text>
						</p>
						<xsl:call-template name="corpsSection"/>
					</xsl:if>
					<!-- Section FR-Resultats-evenements : MODE DE DÉCOUVERTE DU CANCER -->
					<xsl:if test="n1:templateId/@root = '1.3.6.1.4.1.19376.1.7.3.1.1.13.7'">
						<br/>
						<xsl:call-template name="corpsSection"/>
					</xsl:if>

					<!-- Section FR-Note-de-progression : PHASE ET PROGRESSION DU CANCER -->
					<xsl:if test="n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.1.13.2.7'">
						<br/>
						<xsl:call-template name="corpsSection"/>
					</xsl:if>
				</xsl:for-each>

				<!-- Informations sur le document -->
				<div style="width: 100%">
					<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
					<p class="contact">
						<xsl:text>DOCUMENT</xsl:text>
					</p>
					<!-- <table class="header_table"> -->
					<table>
						<tbody>
							<!-- Identifiant du document -->
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Identifiant</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:call-template name="show-id">
										<xsl:with-param name="id" select="n1:id"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Version du document -->
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Version</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:call-template name="show-version">
										<xsl:with-param name="version" select="n1:versionNumber"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Lot de versions -->
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Lot de versions</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:call-template name="show-lot-version">
										<xsl:with-param name="lot" select="n1:setId"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Date du document -->
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Date du document</xsl:text>
									</span>
								</td>
								<td width="80%" id="date_document">
									<xsl:call-template name="show-creation">
										<xsl:with-param name="creation" select="n1:effectiveTime"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Date de la RCP -->
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Date de la RCP</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:if
										test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
										<xsl:call-template name="show-date-rcp">
											<xsl:with-param name="date_rcp"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'ORG-189']/n1:effectiveTime/@value"
											/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<!-- Date de la consultation d'annonce -->
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Date consultation d'annonce</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:if
										test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
										<xsl:call-template name="show-date-consultation-annonce">
											<xsl:with-param name="consult"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-178']/n1:value/@value"
											/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<!-- Documents référencés -->
							<tr>
								<td width="20%">
									<span class="td_label">
										<xsl:text>Autres documents référencés :</xsl:text>
									</span>
								</td>
							</tr>
							<!-- Référence FRCP -->
							<tr>
								<td width="20%" style="padding-left:40px">
									<span class="td_label">
										<xsl:text>FRCP n°</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:if
										test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.55')">
										<xsl:call-template name="show-id">
											<xsl:with-param name="id"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.55']/n1:entry/n1:act[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.4' and n1:code/@nullFlavor = 'NA']/n1:reference/n1:externalDocument/n1:id[@root = '1.2.3.4.567.8.9.10']"
											/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<!-- Référence CR-GM -->
							<tr>
								<td width="20%" style="padding-left:40px">
									<span class="td_label">
										<xsl:text>CR-GM n°</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:if
										test="n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.55'">
										<xsl:call-template name="show-id">
											<xsl:with-param name="id"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.55']/n1:entry/n1:act[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.4' and n1:code/@nullFlavor = 'NA']/n1:reference/n1:externalDocument/n1:id[@root = '1.2.250.1.213.1.1.9']"
											/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<!-- Référence PPS Précédent -->
							<tr>
								<td width="20%" style="padding-left:40px">
									<span class="td_label">
										<xsl:text>PPS Cancérologie n°</xsl:text>
									</span>
								</td>
								<td width="80%">
									<xsl:if
										test="n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.55'">
										<xsl:call-template name="show-id">
											<xsl:with-param name="id"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.55']/n1:entry/n1:act[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.4' and n1:code/@nullFlavor = 'NA']/n1:reference/n1:externalDocument/n1:id[@root = '1.2.250.1.213.1.1.10']"
											/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- Informations sur les données personnelles vous concernant -->
				<p class="contact">
					<xsl:text>INFORMATION SUR LES DONNÉES PERSONNELLES VOUS CONCERNANT</xsl:text>
				</p>
				<table width="100%">
					<tr>
						<td width="100%">
							<xsl:if
								test="(n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.4.1.2.16']/n1:code[n1:translation/@code = 'GEN-294'])">
								<xsl:for-each
									select="//n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.4.1.2.16' and n1:code/n1:translation/@code = 'GEN-294']/n1:text/n1:table/n1:tbody/n1:tr/n1:td">
									<div class="data">
										<xsl:value-of select="current()"/>
									</div>
									<br/>
								</xsl:for-each>
							</xsl:if>
							<br/>
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>

	<!-- Corps du document -->
	<xsl:template match="n1:component/n1:structuredBody">
		<xsl:for-each select="n1:component/n1:section">
			<xsl:choose>
				<!-- Sections FR-Plan-de-soins -->
				<xsl:when test="n1:templateId/@root = '2.16.840.1.113883.10.20.1.10'">
					<br/>
					<!-- Section FR-Plan-de-soins : PROGRAMME THERAPEUTIQUE ET DE SUIVI (MED-566) -->
					<xsl:if test="n1:code/n1:translation/@code = 'MED-566'">
						<p
							style="background-color: silver;font-size: 12pt;font-weight: bold;width:100%;color: black;">
							<xsl:text>PROGRAMME THÉRAPEUTIQUE ET DE SUIVI</xsl:text>
						</p>
					</xsl:if>
					<!-- Section FR-Plan-de-soins : SOINS ONCOLOGIQUES DE SUPPORT, ACCOMPAGNEMENT SOCIAL ET SOCIOPROFESSIONNEL (MED-567) -->
					<xsl:if test="n1:code/n1:translation/@code = 'MED-567'">
						<p
							style="background-color: silver;font-size: 12pt;font-weight: bold;width:100%;color: black;">
							<xsl:text>SOINS ONCOLOGIQUES DE SUPPORT, ACCOMPAGNEMENT SOCIAL ET SOCIOPROFESSIONNEL</xsl:text>
						</p>
					</xsl:if>
					<xsl:call-template name="corpsSection"/>
				</xsl:when>
				<xsl:otherwise> </xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<!-- Affichage du contenu d'une section -->
	<xsl:template name="corpsSection">
		<xsl:call-template name="section-text"/>
		<xsl:for-each select="n1:component/n1:section">
			<xsl:call-template name="nestedSection">
				<xsl:with-param name="margin" select="2"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>

	<!-- Affichage du <text> d'une section -->
	<xsl:template name="section-text">
		<div>
			<xsl:apply-templates select="n1:text"/>
		</div>
	</xsl:template>

	<!-- Affichage section imbriquée -->
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

	<!-- paragraph -->
	<xsl:template match="n1:paragraph">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<!-- pre format -->
	<xsl:template match="n1:pre">
		<pre>
	    <xsl:apply-templates/>
	  </pre>
	</xsl:template>
	<!-- Content w/ deleted text is hidden -->
	<xsl:template match="n1:content[@revised = 'delete']"/>
	<!-- content  -->
	<xsl:template match="n1:content">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- line break -->
	<xsl:template match="n1:br">
		<xsl:element name="br">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<!-- list  -->
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
	<!-- caption  -->
	<xsl:template match="n1:caption">
		<xsl:apply-templates/>
		<xsl:text>: </xsl:text>
	</xsl:template>
	<!-- Tables   -->
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
		<xsl:if
			test="(../../../../n1:templateId/@root = '2.16.840.1.113883.10.20.1.10' or ../../../../n1:templateId/@root = '2.16.840.1.113883.10.20.1.11' or ../../../../n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.1.13.2.7' or ../../../../n1:templateId/@root = '1.3.6.1.4.1.19376.1.7.3.1.1.13.7')">
			<tr class="border-bottom">
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</tr>
		</xsl:if>
		<xsl:if
			test="not(../../../../n1:templateId/@root = '2.16.840.1.113883.10.20.1.10' or ../../../../n1:templateId/@root = '2.16.840.1.113883.10.20.1.11' or ../../../../n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.1.13.2.7' or ../../../../n1:templateId/@root = '1.3.6.1.4.1.19376.1.7.3.1.1.13.7')">
			<tr class="tr">
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</tr>
		</xsl:if>
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
	<xsl:template match="n1:td/content">
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
		<span style="font-weight:bold; " class="data">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<!-- ******* -->
	<!-- PATIENT -->
	<!-- ******* -->

	<!-- show-patient-name	-->
	<xsl:template name="show-patient-name">
		<xsl:param name="name"/>
		<xsl:if test="$name/n1:prefix">
			<tr>
				<td>
					<span class="td_label">
						<xsl:text>Civilité</xsl:text>
					</span>
				</td>
				<td>
					<xsl:for-each select="$name/n1:prefix">
						<span class="data">
							<xsl:value-of select="."/>
						</span>
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
								<td>
									<span class="td_label">
										<xsl:text>Nom de naissance</xsl:text>
									</span>
								</td>
								<td>
									<span style="font-weight:bold;" class="data">
										<xsl:value-of select="."/>
									</span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="td_label">
										<xsl:text>Prénom(s)</xsl:text>
									</span>
								</td>
								<td>
									<xsl:variable name="count" select="count($name/n1:given)"/>
									<xsl:for-each select="$name/n1:given">
										<xsl:choose>
											<xsl:when test="@qualifier = &apos;BR&apos;">
												<span style="font-weight:bold; " class="data">
												<xsl:value-of select="."/>
												</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="data">
												<xsl:value-of select="."/>
												</span>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="$count > 1">
											<xsl:if
												test="(position() != last()) and (position() > 1)">
												<span class="data">
												<xsl:text>, </xsl:text>
												</span>
											</xsl:if>
											<xsl:if test="position() = 1">
												<span class="data">
												<xsl:text> [</xsl:text>
												</span>
											</xsl:if>
											<xsl:if test="position() = last()">
												<span class="data">
												<xsl:text>]</xsl:text>
												</span>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="@qualifier = &apos;SP&apos;">
							<tr>
								<td>
									<span class="td_label">
										<xsl:text>Nom d'usage</xsl:text>
									</span>
								</td>
								<td>
									<span class="data">
										<xsl:value-of select="."/>
									</span>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="@qualifier = &apos;CL&apos;">
							<tr>
								<td>
									<span class="td_label">
										<xsl:text>Nom et prénom utilisés</xsl:text>
									</span>
								</td>
								<td>
									<span style="font-weight:bold; " class="data">
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
						<td>
							<span class="td_label">
								<xsl:text>Nom</xsl:text>
							</span>
						</td>
						<td>
							<span class="data">
								<xsl:value-of select="."/>
							</span>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<!-- show-gender	-->
	<xsl:template name="show-gender">
		<xsl:choose>
			<xsl:when test="@code = &apos;M&apos;">
				<span class="data">
					<xsl:text>Masculin</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="@code = &apos;F&apos;">
				<span class="data">
					<xsl:text>Féminin</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="@code = &apos;U&apos;">
				<span class="data">
					<xsl:text>Inconnu</xsl:text>
				</span>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- show-address-patient -->
	<xsl:template name="show-address-patient">
		<xsl:param name="address"/>
		<xsl:choose>
			<xsl:when test="$address">
				<xsl:for-each select="$address/n1:streetAddressLine">
					<span class="data">
						<xsl:value-of select="."/>
					</span>
				</xsl:for-each>
				<xsl:if test="$address/n1:streetName">
					<span class="data">
						<xsl:value-of select="$address/n1:houseNumber"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$address/n1:streetNameType"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$address/n1:streetName"/>
					</span>
				</xsl:if>
				<xsl:if test="string-length($address/n1:postalCode) > 0">
					<br/>
					<span class="data">
						<xsl:value-of select="$address/n1:postalCode"/>
					</span>
				</xsl:if>
				<xsl:if test="string-length($address/n1:city) > 0">
					<xsl:text>,&#160;</xsl:text>
					<span class="data">
						<xsl:value-of select="$address/n1:city"/>
					</span>
				</xsl:if>
				<xsl:if test="string-length($address/n1:state) > 0">
					<xsl:text>,&#160;</xsl:text>
					<span class="data">
						<xsl:value-of select="$address/n1:state"/>
					</span>
				</xsl:if>
				<xsl:if test="string-length($address/n1:country) > 0">
					<xsl:text>,&#160;</xsl:text>
					<span class="data">
						<xsl:value-of select="$address/n1:country"/>
					</span>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<span class="data">
					<xsl:text>addresse non renseignée</xsl:text>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show-guardian	-->
	<xsl:template name="show-guardian">
		<xsl:param name="guardian"/>
		<xsl:for-each select="$guardian/n1:guardianPerson">
			<xsl:call-template name="show-name-not-bold">
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
			<xsl:call-template name="show-name-not-bold">
				<xsl:with-param name="name" select="."/>
			</xsl:call-template>
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
	</xsl:template>

	<!-- informant : show relatedEntity -->
	<xsl:template name="show-relatedEntity">
		<xsl:param name="relatedEntity"/>
		<xsl:if test="$relatedEntity/n1:code">
			<xsl:call-template name="translate-related-code">
				<xsl:with-param name="code" select="$relatedEntity/n1:code/@code"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="$relatedEntity/n1:relatedPerson/n1:name">
			<xsl:call-template name="show-name-not-bold">
				<xsl:with-param name="name" select="$relatedEntity/n1:relatedPerson/n1:name"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!-- informant : Correspondance relatedEntity/code@code et libellé affiché -->
	<xsl:template name="translate-related-code">
		<xsl:param name="code"/>
		<xsl:choose>
			<xsl:when test="$code = 'FAMMEMB'">
				<span class="data">
					<xsl:text>(Membre de la famille) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'CHILD'">
				<span class="data">
					<xsl:text>(Enfant) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'DAU'">
				<span class="data">
					<xsl:text>(Fille) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'SON'">
				<span class="data">
					<xsl:text>(Fils) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'GRNDDAU'">
				<span class="data">
					<xsl:text>(Petite-fille) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'GRNDSON'">
				<span class="data">
					<xsl:text>(Petit-fils) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'FTH'">
				<span class="data">
					<xsl:text>(Père) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'MTH'">
				<span class="data">
					<xsl:text>(Mère) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'NFTH'">
				<span class="data">
					<xsl:text>(Père naturel) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'NMTH'">
				<span class="data">
					<xsl:text>(Mère naturelle) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'GRFTH'">
				<span class="data">
					<xsl:text>(Grand-père) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'GRMTH'">
				<span class="data">
					<xsl:text>(Grand-mère) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'BRO'">
				<span class="data">
					<xsl:text>(Frère) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'SIS'">
				<span class="data">
					<xsl:text>(Soeur) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'HUSB'">
				<span class="data">
					<xsl:text>(Mari) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'WIFE'">
				<span class="data">
					<xsl:text>(Epouse) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'DOMPART'">
				<span class="data">
					<xsl:text>(Partenaire PACS) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'ROOM'">
				<span class="data">
					<xsl:text>(Personne vivant sous le même toit) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'FRND'">
				<span class="data">
					<xsl:text>(Ami) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'NBOR'">
				<span class="data">
					<xsl:text>(Voisin) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'TUTEUR'">
				<span class="data">
					<xsl:text>(Relation de tuteur légal) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'SIGOTHR'">
				<span class="data">
					<xsl:text>(Autre relation) : </xsl:text>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<span class="data">
					<xsl:text>{$code='</xsl:text>
					<xsl:value-of select="$code"/>
					<xsl:text>'?}</xsl:text>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- informant : Correspondance relatedEntity/classCode et libellé affiché -->
	<xsl:template name="show-relatedEntityClass">
		<xsl:param name="clsCode"/>
		<xsl:choose>
			<xsl:when test="$clsCode = 'ECON'">
				<span class="td_label">
					<xsl:text>Contact en cas d'urgence</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$clsCode = 'NOK'">
				<span class="td_label">
					<xsl:text>Personne de confiance</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$clsCode = 'CON'">
				<span class="td_label">
					<xsl:text>Informateur</xsl:text>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<span class="td_label">
					<xsl:value-of select="$clsCode"/>
					<xsl:text>  </xsl:text>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show-comm-patient -->
	<xsl:template name="show-comm-patient">
		<xsl:param name="commentaire"/>
		<span class="data">
			<xsl:value-of select="$commentaire"/>
		</span>
	</xsl:template>

	<!-- show-pédiatrie -->
	<xsl:template name="show-pediatrie">
		<xsl:param name="pediatrie"/>
		<xsl:if test="$pediatrie/n1:paragraph/n1:content/@ID">
			<xsl:variable name="ped" select="$pediatrie/n1:paragraph/n1:content[@ID = 'pediatrie']"/>
			<span class="data">
				<xsl:value-of select="$ped"/>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- show-commentaire-pediatrie -->
	<xsl:template name="show-commentaire-pediatrie">
		<xsl:param name="commentaire-pediatrie"/>
		<xsl:if test="$commentaire-pediatrie/n1:paragraph/n1:content/@ID">
			<xsl:variable name="comm"
				select="$commentaire-pediatrie/n1:paragraph/n1:content[@ID = 'commentaire-pediatrie']"/>
			<span class="data">
				<xsl:value-of select="$comm"/>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- ******** -->
	<!-- DOCUMENT -->
	<!-- ******** -->

	<!-- show-creation (du document) -->
	<xsl:template name="show-creation">
		<xsl:param name="creation"/>
		<xsl:choose>
			<xsl:when test="not($creation)">
				<xsl:if test="not(@nullFlavor)">
					<xsl:if test="@value">
						<xsl:call-template name="formatDateTime">
							<xsl:with-param name="date" select="@value"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not($creation/@nullFlavor)">
					<xsl:if test="$creation/@value">
						<xsl:call-template name="formatDateTime">
							<xsl:with-param name="date" select="$creation/@value"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show-lot-version (du document) -->
	<xsl:template name="show-lot-version">
		<xsl:param name="lot"/>
		<xsl:choose>
			<xsl:when test="not($lot)">
				<xsl:if test="not(@nullFlavor)">
					<xsl:if test="@extension">
						<span class="data">
							<xsl:value-of select="@extension"/>
						</span>
					</xsl:if>
					<xsl:if test="@root">
						<span class="data">
							<xsl:text> [</xsl:text>
							<xsl:value-of select="@root"/>
							<xsl:text>]</xsl:text>
						</span>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not($lot/@nullFlavor)">
					<xsl:if test="$lot/@extension">
						<span class="data">
							<xsl:value-of select="$lot/@extension"/>
						</span>
					</xsl:if>
					<xsl:if test="$lot/@root">
						<span class="data">
							<xsl:text> [</xsl:text>
							<xsl:value-of select="$lot/@root"/>
							<xsl:text>]</xsl:text>
						</span>
					</xsl:if>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show-version (du document) -->
	<xsl:template name="show-version">
		<xsl:param name="version"/>
		<xsl:choose>
			<xsl:when test="not($version)">
				<xsl:if test="not(@nullFlavor)">
					<xsl:if test="@value">
						<span class="data">
							<xsl:value-of select="@value"/>
						</span>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not($version/@nullFlavor)">
					<xsl:if test="$version/@value">
						<span class="data">
							<xsl:value-of select="$version/@value"/>
						</span>
					</xsl:if>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>&#160;&#160;</xsl:text>
	</xsl:template>

	<!-- show-id (du document) -->
	<xsl:template name="show-id">
		<xsl:param name="id"/>
		<xsl:choose>
			<xsl:when test="not($id)">
				<xsl:if test="not(@nullFlavor)">
					<xsl:if test="@extension">
						<span class="data">
							<xsl:value-of select="@extension"/>
						</span>
					</xsl:if>
					<xsl:if test="@root">
						<span class="data">
							<xsl:text> [</xsl:text>
							<xsl:value-of select="@root"/>
							<xsl:text>]</xsl:text>
						</span>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not($id/@nullFlavor)">
					<xsl:if test="$id/@extension">
						<span class="data">
							<xsl:value-of select="$id/@extension"/>
						</span>
					</xsl:if>
					<xsl:if test="$id/@root">
						<span class="data">
							<xsl:text> [</xsl:text>
							<xsl:value-of select="$id/@root"/>
							<xsl:text>]</xsl:text>
						</span>
					</xsl:if>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show-commentaire-document -->
	<xsl:template name="show-commentaire-document">
		<xsl:param name="commentaire-document"/>
		<xsl:if
			test="$commentaire-document/n1:table/n1:tbody/n1:tr/n1:td/n1:content[@ID = 'commentaire-document']">
			<xsl:variable name="comm"
				select="$commentaire-document/n1:table/n1:tbody/n1:tr/n1:td/n1:content[@ID = 'commentaire-document']"/>
			<span class="data">
				<xsl:value-of select="$comm"/>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- show-commentaire-motif -->
	<xsl:template name="show-commentaire-motif">
		<xsl:param name="commentaire-motif"/>
		<xsl:if
			test="$commentaire-motif/n1:table/n1:tbody/n1:tr/n1:td/n1:content[@ID = 'motif-maj-précision']">
			<xsl:variable name="comm"
				select="$commentaire-motif/n1:table/n1:tbody/n1:tr/n1:td/n1:content[@ID = 'motif-maj-précision']"/>
			<span class="data">
				<xsl:value-of select="$comm"/>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- show-date-remise-document -->
	<xsl:template name="show-date-remise-document">
		<xsl:param name="remise"/>
		<xsl:if test="$remise">
			<xsl:variable name="ped" select="$remise"/>
			<xsl:variable name="year" select="substring($ped, 1, 4)"/>
			<xsl:variable name="month" select="substring($ped, 5, 2)"/>
			<xsl:variable name="day" select="substring($ped, 7, 2)"/>
			<span class="data">
				<xsl:value-of select="$day"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="$month"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="$year"/>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- show-date-consultation-annonce -->
	<xsl:template name="show-date-consultation-annonce">
		<xsl:param name="consult"/>
		<xsl:if test="$consult">
			<xsl:variable name="ped" select="$consult"/>
			<xsl:variable name="year" select="substring($ped, 1, 4)"/>
			<xsl:variable name="month" select="substring($ped, 5, 2)"/>
			<xsl:variable name="day" select="substring($ped, 7, 2)"/>
			<span class="data">
				<xsl:value-of select="$day"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="$month"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="$year"/>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- show-motif-update -->
	<xsl:template name="show-motif-update">
		<xsl:param name="motif"/>
		<xsl:if test="$motif">
			<xsl:variable name="ped" select="$motif"/>
			<span class="data">
				<xsl:value-of select="$ped"/>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- show-motif-update-prec -->
	<xsl:template name="show-motif-update-prec">
		<xsl:param name="motif-prec"/>
		<xsl:if
			test="$motif-prec/n1:table/n1:tbody/n1:tr/n1:td/n1:content[@ID = 'motif-maj-précision']">
			<xsl:variable name="prec"
				select="$motif-prec/n1:table/n1:tbody/n1:tr/n1:td/n1:content[@ID = 'motif-maj-précision']"/>
			<span class="data">
				<xsl:value-of select="$prec"/>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- show-statut-document -->
	<xsl:template name="show-statut-document">
		<xsl:param name="statut_document"/>
		<xsl:if test="$statut_document">
			<span class="data">
				<xsl:value-of select="$statut_document"/>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- show-date-rcp -->
	<xsl:template name="show-date-rcp">
		<xsl:param name="date_rcp"/>
		<xsl:if test="$date_rcp">
			<xsl:variable name="ped" select="$date_rcp"/>
			<xsl:variable name="year" select="substring($ped, 1, 4)"/>
			<xsl:variable name="month" select="substring($ped, 5, 2)"/>
			<xsl:variable name="day" select="substring($ped, 7, 2)"/>
			<span class="data">
				<xsl:value-of select="$day"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="$month"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="$year"/>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- *************** -->
	<!-- CONTACTS UTILES -->
	<!-- *************** -->

	<!-- participant : Correspondance code et libellé affiché -->
	<xsl:template name="participant">
		<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
		<xsl:if test="n1:participant">
			<p class="contact">
				<xsl:text>CONTACTS UTILES</xsl:text>
			</p>
			<table border="0" width="100%" class="data">
				<tbody>
					<xsl:for-each select="n1:participant">
						<tr width="100%" class="border-bottom">
							<td width="20%">
								<xsl:variable name="participtRole">
									<xsl:call-template name="translateRoleAssoCode">
										<xsl:with-param name="code"
											select="n1:associatedEntity/@classCode"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="$participtRole">
										<span class="td_label">
											<xsl:choose>
												<xsl:when test="@typeCode = 'RESP'">
												<xsl:if test="n1:functionCode">
												<xsl:if test="n1:functionCode/@nullFlavor = 'NA'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-177'">
												<span style="font-weight:bold;">
												<xsl:text>Établissements de référence</xsl:text>
												</span>
												</xsl:if>
												</xsl:if>
												</xsl:if>
												</xsl:when>
												<xsl:when test="@typeCode = 'REF'">
												<span style="font-weight:bold;">
												<xsl:text>Prescripteur</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@typeCode = 'REFB'">
												<span style="font-weight:bold;">
												<xsl:text>Praticien adresseur</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@typeCode = 'INF'">
												<xsl:if test="n1:functionCode">
												<xsl:choose>
												<xsl:when test="n1:functionCode/@code = 'PCP'">
												<span style="font-weight:bold;">
												<xsl:text>Médecin traitant</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="n1:functionCode/@code = 'CORRE'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-180'">
												<span style="font-weight:bold;">
												<xsl:text>Organismes sociaux et de maintien dans l'emploi</xsl:text>
												</span>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-181'">
												<span style="font-weight:bold;">
												<xsl:text>Structure de soutien et d'information</xsl:text>
												</span>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-188'">
												<span style="font-weight:bold;">
												<xsl:text>Structures et professionnels de proximité impliqués dans les soins</xsl:text>
												</span>
												</xsl:if>
												</xsl:when>
												<xsl:otherwise>
												<span style="font-weight:bold;">
												<xsl:text>Informateur</xsl:text>
												</span>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:if>
												</xsl:when>
												<xsl:when test="@typeCode = 'PRF'">
												<xsl:if test="n1:functionCode">
												<xsl:choose>
												<xsl:when test="n1:functionCode/@code = 'ATTPHYS'">
												<span style="font-weight:bold;">
												<xsl:text>Responsable de l'équipe de soins</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="n1:functionCode/@code = '353'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-177'">
												<span style="font-weight:bold;">
												<xsl:text>Membre de l'équipe de soins</xsl:text>
												</span>
												</xsl:if>
												</xsl:when>
												<xsl:when test="n1:functionCode/@code = 'CORRE'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-177'">
												<span style="font-weight:bold;">
												<xsl:text>Centre d'hébergement</xsl:text>
												</span>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-178'">
												<span style="font-weight:bold;">
												<xsl:text>Structures et professionnels de proximité impliqués dans les soins</xsl:text>
												</span>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-190'">
												<span style="font-weight:bold;">
												<xsl:text>Structures et professionnels de proximité impliqués dans les soins</xsl:text>
												</span>
												</xsl:if>
												</xsl:when>
												<xsl:when test="n1:functionCode/@code = 'PRELV'">
												<span style="font-weight:bold;">
												<xsl:text>Préleveur</xsl:text>
												</span>
												</xsl:when>
												<xsl:otherwise>
												<span style="font-weight:bold;">
												<xsl:text>Exécutant</xsl:text>
												</span>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:if>
												</xsl:when>
												<xsl:when test="@typeCode = 'CON'">
												<xsl:if test="n1:functionCode">
												<xsl:choose>
												<xsl:when test="n1:functionCode/@code = 'CORRE'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-179'">
												<span style="font-weight:bold;">
												<xsl:text>Structure de coordination ou d'interface ville-hôpital</xsl:text>
												</span>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-191'">
												<span style="font-weight:bold;">
												<xsl:text>Structure de coordination ou d'interface ville-hôpital</xsl:text>
												</span>
												</xsl:if>
												</xsl:when>
												<xsl:otherwise>
												<span style="font-weight:bold;">
												<xsl:text>Consultant</xsl:text>
												</span>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:if>
												</xsl:when>
												<xsl:when test="@typeCode = 'VRF'">
												<span style="font-weight:bold;">
												<xsl:text>Vérificateur</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@typeCode = 'ADM'">
												<span style="font-weight:bold;">
												<xsl:text>Responsable de l'admission</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@typeCode = 'DIS'">
												<span style="font-weight:bold;">
												<xsl:text>Responsable de la sortie</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@typeCode = 'AUTHEN'">
												<span style="font-weight:bold;">
												<xsl:text>Valideur des résultats</xsl:text>
												</span>
												</xsl:when>
												<xsl:otherwise>
												<span style="font-weight:bold;">
												<xsl:text>Participant</xsl:text>
												</span>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span style="font-weight:bold;">
											<xsl:text>Participant</xsl:text>
										</span>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td width="40%">
								<xsl:if test="n1:associatedEntity/n1:associatedPerson">
									<xsl:if test="n1:associatedEntity/n1:code">
										<xsl:call-template name="show-profession">
											<xsl:with-param name="code"
												select="n1:associatedEntity/n1:code"/>
										</xsl:call-template>
										<br/>
									</xsl:if>
									<xsl:call-template name="show-contact-name">
										<xsl:with-param name="name"
											select="n1:associatedEntity/n1:associatedPerson/n1:name"
										/>
									</xsl:call-template>
									<br/>

									<xsl:if test="n1:associatedEntity/n1:addr">
										<xsl:call-template name="show-address">
											<xsl:with-param name="address"
												select="n1:associatedEntity/n1:addr"/>
										</xsl:call-template>
										<br/>
									</xsl:if>
									<xsl:if test="n1:associatedEntity/n1:telecom">
										<xsl:for-each select="n1:associatedEntity/n1:telecom">
											<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
											</xsl:call-template>
											<br/>
										</xsl:for-each>
									</xsl:if>
								</xsl:if>
								<br/>
								<xsl:if test="n1:associatedEntity/n1:scopingOrganization">
									<xsl:if
										test="n1:associatedEntity/n1:scopingOrganization/n1:name">
										<xsl:call-template name="show-contact-name">
											<xsl:with-param name="name"
												select="n1:associatedEntity/n1:scopingOrganization/n1:name"
											/>
										</xsl:call-template>
										<br/>
									</xsl:if>
									<xsl:choose>
										<xsl:when
											test="n1:associatedEntity/n1:scopingOrganization/n1:addr">
											<xsl:call-template name="show-address">
												<xsl:with-param name="address"
												select="n1:associatedEntity/n1:scopingOrganization/n1:addr"
												/>
											</xsl:call-template>
											<br/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if
												test="not(n1:associatedEntity/n1:associatedPerson)">
												<xsl:call-template name="show-address">
												<xsl:with-param name="address"
												select="n1:associatedEntity/n1:addr"/>
												</xsl:call-template>
												<br/>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when
											test="n1:associatedEntity/n1:scopingOrganization/n1:telecom">
											<xsl:for-each
												select="n1:associatedEntity/n1:scopingOrganization/n1:telecom">
												<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
												</xsl:call-template>
												<br/>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if
												test="not(n1:associatedEntity/n1:associatedPerson)">
												<xsl:for-each
												select="n1:associatedEntity/n1:telecom">
												<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
												</xsl:call-template>
												<br/>
												</xsl:for-each>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
									<br/>
								</xsl:if>
							</td>
							<td width="40%">
								<xsl:value-of select="n1:functionCode/n1:originalText"/>
							</td>
						</tr>
						<tr/>
						<xsl:if test="$vendor = 'Transformiix'">
							<br/>
						</xsl:if>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>

	<!-- participant : Correspondance associatedEntity/@classCode et libellé affiché -->
	<xsl:template name="translateRoleAssoCode">
		<xsl:param name="code"/>
		<xsl:choose>
			<xsl:when test="$code = 'AGNT'">
				<xsl:text>non PS</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'PROV'">
				<xsl:text>PS</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>code='</xsl:text>
				<xsl:value-of select="$code"/>
				<xsl:text>'</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show-contact-name	-->
	<xsl:template name="show-contact-name">
		<xsl:param name="name"/>
		<xsl:choose>
			<xsl:when test="$name/n1:family">
				<xsl:choose>
					<xsl:when test="$name/n1:suffix">
						<xsl:for-each select="$name/n1:suffix">
							<span style="font-weight:bold; " class="data">
								<xsl:value-of select="."/>
							</span>
							<xsl:text> </xsl:text>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="$name/n1:prefix">
							<span style="font-weight:bold; " class="data">
								<xsl:value-of select="."/>
							</span>
							<xsl:text> </xsl:text>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="$name/n1:given">
					<span style="font-weight:bold; " class="data">
						<xsl:value-of select="."/>
						<xsl:text> </xsl:text>
					</span>
				</xsl:for-each>
				<xsl:for-each select="$name/n1:family">
					<span style="font-weight:bold; " class="data">
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
								<span class="data">
									<xsl:value-of select="@qualifier"/>
								</span>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<span style="font-weight:bold;" class="data">
					<xsl:value-of select="$name"/>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show code (profession) -->
	<xsl:template name="show-profession">
		<xsl:param name="code"/>
		<xsl:choose>
			<xsl:when test="$code/@displayName">
				<xsl:text> </xsl:text>
				<span style="font-weight:bold; ">
					<xsl:value-of select="$code/@displayName"/>
				</span>
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="$code/n1:originalText">
				<xsl:text> </xsl:text>
				<xsl:value-of select="$code/n1:originalText"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- **************************************** -->
	<!-- INFORMATION SUR LES DONNEES PERSONNELLES -->
	<!-- **************************************** -->

	<!-- show-information-donnees -->
	<xsl:template name="show-information-donnees">
		<xsl:param name="commentaire"/>
		<span class="data">
			<xsl:value-of select="$commentaire"/>
		</span>
	</xsl:template>

	<!-- ******* -->
	<!-- COMMUNS -->
	<!-- ******* -->

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

	<!-- formatDateTime -->
	<xsl:template name="formatDateTime">
		<xsl:param name="date"/>
		<!-- day -->
		<xsl:choose>
			<xsl:when test="substring($date, 7, 1) = &quot;0&quot;">
				<span class="data">
					<xsl:value-of select="substring($date, 8, 1)"/>
					<xsl:text> </xsl:text>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<span class="data">
					<xsl:value-of select="substring($date, 7, 2)"/>
					<xsl:text> </xsl:text>
				</span>
			</xsl:otherwise>
		</xsl:choose>
		<!-- month -->
		<xsl:variable name="month" select="substring($date, 5, 2)"/>
		<xsl:choose>
			<xsl:when test="$month = '01'">
				<span class="data">
					<xsl:text>Janvier </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$month = '02'">
				<span class="data">
					<xsl:text>Février </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$month = '03'">
				<span class="data">
					<xsl:text>Mars </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$month = '04'">
				<span class="data">
					<xsl:text>Avril </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$month = '05'">
				<span class="data">
					<xsl:text>Mai </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$month = '06'">
				<span class="data">
					<xsl:text>Juin </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$month = '07'">
				<span class="data">
					<xsl:text>Juillet </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$month = '08'">
				<span class="data">
					<xsl:text>Août </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$month = '09'">
				<span class="data">
					<xsl:text>Septembre </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$month = '10'">
				<span class="data">
					<xsl:text>Octobre </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$month = '11'">
				<span class="data">
					<xsl:text>Novembre </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$month = '12'">
				<span class="data">
					<xsl:text>Décembre </xsl:text>
				</span>
			</xsl:when>
		</xsl:choose>
		<!-- year -->
		<span class="data">
			<xsl:value-of select="substring($date, 1, 4)"/>
		</span>
		<!-- time and US timezone -->
		<xsl:if test="string-length($date) > 8">
			<span class="data">
				<xsl:text>, </xsl:text>
			</span>
			<!-- time -->
			<xsl:variable name="time">
				<span class="data">
					<xsl:value-of select="substring($date, 9, 6)"/>
				</span>
			</xsl:variable>
			<xsl:variable name="hh">
				<span class="data">
					<xsl:value-of select="substring($time, 1, 2)"/>
				</span>
			</xsl:variable>
			<xsl:variable name="mm">
				<span class="data">
					<xsl:value-of select="substring($time, 3, 2)"/>
				</span>
			</xsl:variable>
			<xsl:variable name="ss">
				<span class="data">
					<xsl:value-of select="substring($time, 5, 2)"/>
				</span>
			</xsl:variable>
			<xsl:if test="string-length($hh) &gt; 1">
				<span class="data">
					<xsl:value-of select="$hh"/>
				</span>
				<xsl:if
					test="string-length($mm) &gt; 1 and not(contains($mm, '-')) and not(contains($mm, '+'))">
					<span class="data">
						<xsl:text>:</xsl:text>
						<xsl:value-of select="$mm"/>
					</span>
					<xsl:if
						test="string-length($ss) &gt; 1 and not(contains($ss, '-')) and not(contains($ss, '+'))">
						<span class="data">
							<xsl:text>:</xsl:text>
							<xsl:value-of select="$ss"/>
						</span>
					</xsl:if>
				</xsl:if>
			</xsl:if>
			<!-- time zone -->
			<xsl:variable name="tzon">
				<xsl:choose>
					<xsl:when test="contains($date, '+')">
						<span class="data">
							<xsl:text>+</xsl:text>
							<xsl:value-of select="substring-after($date, '+')"/>
						</span>
					</xsl:when>
					<xsl:when test="contains($date, '-')">
						<span class="data">
							<xsl:text>-</xsl:text>
							<xsl:value-of select="substring-after($date, '-')"/>
						</span>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<!-- reference: http://www.timeanddate.com/library/abbreviations/timezones/na/ -->
				<xsl:when test="$tzon = '-0500'">
					<span class="data">
						<xsl:text>, EST</xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$tzon = '-0600'">
					<span class="data">
						<xsl:text>, CST</xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$tzon = '-0700'">
					<span class="data">
						<xsl:text>, MST</xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$tzon = '-0800'">
					<span class="data">
						<xsl:text>, PST</xsl:text>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> </xsl:text>
					<span class="data">
						<xsl:value-of select="$tzon"/>
					</span>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<!-- show-name (Nom en gras)	-->
	<xsl:template name="show-name">
		<xsl:param name="name"/>
		<xsl:choose>
			<xsl:when test="$name/n1:family">
				<xsl:choose>
					<xsl:when test="$name/n1:suffix">
						<xsl:for-each select="$name/n1:suffix">
							<span style="font-weight:bold; " class="data">
								<xsl:value-of select="."/>
							</span>
							<xsl:text> </xsl:text>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="$name/n1:prefix">
							<span style="font-weight:bold; " class="data">
								<xsl:value-of select="."/>
							</span>
							<xsl:text> </xsl:text>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="$name/n1:given">
					<span style="font-weight:bold; " class="data">
						<xsl:value-of select="."/>
						<xsl:text> </xsl:text>
					</span>
				</xsl:for-each>
				<xsl:for-each select="$name/n1:family">
					<span style="font-weight:bold; " class="data">
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
								<span class="data">
									<xsl:value-of select="@qualifier"/>
								</span>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<span style="font-weight:bold; " class="data">
					<xsl:value-of select="$name"/>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show-name-not-bold (Nom pas en gras)	-->
	<xsl:template name="show-name-not-bold">
		<xsl:param name="name"/>
		<xsl:choose>
			<xsl:when test="$name/n1:family">
				<xsl:choose>
					<xsl:when test="$name/n1:suffix">
						<xsl:for-each select="$name/n1:suffix">
							<span class="data">
								<xsl:value-of select="."/>
							</span>
							<xsl:text> </xsl:text>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="$name/n1:prefix">
							<span class="data">
								<xsl:value-of select="."/>
							</span>
							<xsl:text> </xsl:text>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="$name/n1:given">
					<span class="data">
						<xsl:value-of select="."/>
						<xsl:text> </xsl:text>
					</span>
				</xsl:for-each>
				<xsl:for-each select="$name/n1:family">
					<span class="data">
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
								<span class="data">
									<xsl:value-of select="@qualifier"/>
								</span>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<span class="data">
					<xsl:value-of select="$name"/>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show-address -->
	<xsl:template name="show-address">
		<xsl:param name="address"/>
		<xsl:choose>
			<xsl:when test="$address">
				<xsl:for-each select="$address/n1:streetAddressLine">
					<span class="data">
						<xsl:value-of select="."/>
					</span>
				</xsl:for-each>
				<xsl:if test="$address/n1:streetName">
					<span class="data">
						<xsl:if test="$address/n1:additionalLocator">
							<xsl:value-of select="$address/n1:additionalLocator"/>
							<br/>
						</xsl:if>
						<xsl:value-of select="$address/n1:houseNumber"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$address/n1:streetNameType"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$address/n1:streetName"/>
					</span>
				</xsl:if>
				<xsl:if test="string-length($address/n1:postalCode) > 0">
					<br/>
					<span class="data">
						<xsl:value-of select="$address/n1:postalCode"/>
					</span>
				</xsl:if>
				<xsl:if test="string-length($address/n1:city) > 0">
					<xsl:text>,&#160;</xsl:text>
					<span class="data">
						<xsl:value-of select="$address/n1:city"/>
					</span>
				</xsl:if>
				<xsl:if test="string-length($address/n1:state) > 0">
					<xsl:text>,&#160;</xsl:text>
					<span class="data">
						<xsl:value-of select="$address/n1:state"/>
					</span>
				</xsl:if>
				<xsl:if test="string-length($address/n1:country) > 0">
					<xsl:text>,&#160;</xsl:text>
					<span class="data">
						<xsl:value-of select="$address/n1:country"/>
					</span>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<span class="data">
					<xsl:text>addresse non renseignée</xsl:text>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- show-telecom -->
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
					<span class="data">
						<xsl:text>: </xsl:text>
						<xsl:value-of select="$value"/>
					</span>
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
				<span class="data">
					<xsl:text>Tél</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'fax'">
				<span class="data">
					<xsl:text>Fax</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'http'">
				<span class="data">
					<xsl:text>Page Web</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$code = 'mailto'">
				<span class="data">
					<xsl:text>E-mail</xsl:text>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<span class="data">
					<xsl:text>{$code='</xsl:text>
					<xsl:value-of select="$code"/>
					<xsl:text>'?}</xsl:text>
				</span>
			</xsl:otherwise>
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
					<span class="data">
						<xsl:value-of select="$address/n1:city"/>
					</span>
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
					<span class="data">
						<xsl:text>:</xsl:text>
					</span>
					<br/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:county) > 0">
					<xsl:text> </xsl:text>
					<span class="data">
						<xsl:value-of select="$address/n1:county"/>
					</span>
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
						<span class="data">
							<xsl:value-of select="@extension"/>
						</span>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not($id/@nullFlavor)">
					<xsl:if test="$id/@extension">
						<span class="data">
							<xsl:value-of select="$id/@extension"/>
						</span>
					</xsl:if>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Logo Gestionnaire RCP encodé en B64 -->
	<xsl:template name="printLogo">
		<img
			src="data:image/png;base64,/9j/4AAQSkZJRgABAQEA3ADcAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/
      2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCABPAQ0DASIAAhEBAxEB/
      8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q
      0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/
      8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKj
      U2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/
      9oADAMBAAIRAxEAPwD9U6Q0zftzk8VmXnibSrKTy7jUra3cdVkmVT+RNUouWyMqlWnS1nKxrLQ1VLHVLXUIw9tcR3Cf3o3DD8xVljUu8dyozjNc0XdAzYX2rz7WPiFeapqU2keEbNdTvI8rPeSHbbW592/
      iPsKk8fX19rN9b+FtIuDbXF0vm3d0pOYYB1x6MegrwH9p79qLTP2Z9Ei8GeDbaCfxbLDvZpPmSzU9JZP7znqFP1PFVhac8dV9jQV2cOKrqkm5u0V1/wAj2TVvC9rZ2pvPHfjcxB/4DdLZW4HcAEjP8653w18Z/
      gZ4I1CePTvGujQXc2EkJvGfdg8cnIr8n/GXjrxB8RNWk1PxNrN5rd7J96S7lLAewHRQPQCsRbV2h8xbeQxEZDiI7fzxivuKXC8IxTq1LM+UecJS5qdP5s/drw74w0HxZCZdF1mx1WPGS1ncpLge+0nH41
      srkV+DnhfxTq/gzVYNU0DVLrSL+E5juLOYxn9Ov41+kP7HP7aD/Fq4i8HeM5IoPFaofsl8qhEv1A5BHQSAc8cHH4V5eYZFVwcPa03zRX4Hs4LOKeJl7Oa5ZH2H2PFef/H7/kifjX/sFzf+g16Cv3RXn3x//
      wCSJ+Nf+wXN/wCg183D40e/U+FnV+Ev+RT0X/ryh/8ARa1sVj+Ev+RT0X/ryh/9FrWrvC9TxSZUdh9FM81fX6UCQc80ih9FM8wHGDQ0g9aAH0VHvz0NHmDHWgB9LUfmK3Q0jSbcZOPrQBLRTDIAOtIZB6+
      1K4ElFM8xe5xSbx60wJKKj3hRnPFL5goAdS1H5qscA0vmDsaAH0Uzf70eYAMk0APopnmD1pysGpAeAftUfGDUPh/o1npOjSeRqmpK5Nwv3oIlwCy++SBXyToHgbxN8Rrq6m0ywutbmi+aeaRg2CecFmPU+
      lfSH7TnwW8WeOfGNjrGiWqahZi1Fu0XmBHjIYnPPUHP6V337Nfw41f4d+Bbi112CO3vbi7afy433kLtCjJ9eK/QsHjsNlmWxqUeWVV73Pw3Mspx+f59OlieaFCK0fT+mz468H+NvEfwp8SedYy3NncW0my
      50+YkRvjqjqen1FfoX4M8UW3jHwtputWrf6PeQLMP9nIyQfoc/lXwZ+0C6N8YvE3lMuPtCjj12LmvrD9m9JIfgHpTOCCYJ2X6b3I/TFZ8Swp1MDSxyjaTX6XDgevXw2Z4jLeZypxvb5Oxk618RH8J6B4s8
      SwhbjVGS4uQZPu29tApAJ/Lgdya/JTxN4k1Dxh4i1LW9WuGu9SvpmuLiZzksxOfyHQfSv0o+MVibD9kH4h6orMLm7iWHd3EYmQbR7HJ/OvzDYERt/e2nmvI4Fo8uEniZ7tn3OfVJSnCmfdP7GP7JPhzVPB
      cfxN+IltFeWEymXTtPuP9Qsan/XSD+LJB2r0xg96+tbXxb4dkss23gWVtExxcLpsYi2f3guOlU/7JtbX4M+ANDgTytPmjsYDEhxlAgbHHbivX47VY4REqqsYXaFxwB2FeBjswrY3E1Fzar7vI+hwmEVGnG
      MOyvpuz4b/ay/Y98N+J/BV38QPhpYR2moW8bXN3ptkuIbuPq7Kn8Mi8nA64xXxR8G/Cfizxl8Q9Fh8F2l1d61b3UVwktqCPs4VxmR26Ko96/YCazv8A4f6rdS2VlJqPh67bzJLW3G6S2c/eKr3U+lVvC9/
      4b0W8eLwv4OkspbybddSWunLarycl3bAzj+tdeB4onh8PLDYhXlsjmxGT061aNWLt3seiWvmfZYhMQZQg3lem7HOPxrhfj9/yRPxr/wBgub/0GvQFGVGK8/8Aj9/yRPxr/wBgub/0GvOhrNM9yekGvI6vwl/
      yKei/9eUP/ota479obx1qPw1+CfjHxNpQj/tHTrFpbfzhlQ5IUE/TOfwrsfCX/Ip6L/15Q/8AotayfipY+GtS+Huv2vjCSOHwxNaOmoSTMVVYj1ORyMcfjWkLKom11Jkm6bt2PmrxTL8UPhX8LPFetv8AEW
      TXrWbwn/acL3xjW+s74lctEoX/AFO045zg1kSfFLxj4T/Z98QeIrfX/GE2t3T6fZQ3Hi3To7dbdpyoeW2wB5g+Y4J9q0vDHw6+DOu+BfGt9/wtG88V2aaJ/Y91ql5dhpdL04EMqKu0HGQPmIOa6HwN8PfA
      3xm8C6t4T034r6z45062lspWEkik2PktujVPkXAbbg9eBXsOdJK7XXXS2h5EY1G2lLp3uZ2j/wDCcDxN8S/hzP8AEfWp/wCxNNtdasteMcQvULKzPCTt2lCR6ZFcXc+NPHnh39kix+IE/wARNbutV1y5skZ
      3SMmxQzlJPKwuSWX1z0Fe1rq3wrsPjt4pgbxrbL4z8RWEWjXGktMMRhFIAU4wHOfuk59qwb7RPhE3hbQvgRP47RL/AEm8t2it/OAuWljk8xY2bG3cTxtzmpjUjdXhpo9ultSpU9NJa6rc8b1D48+Nh8FPEN
      3pvjHVdQt7XxrZ6Rp+t/ZlTUprRx+9Rotow+7IUEDPFfSnw51PV7H4G+I9Sm1fxRe6hFBeTwT+LLNLW9hKxfKAijG0EZB75NeefErwL8HW8UeIfCusfEFtC8R+JdetNfNvHcKslvdRIEiCnaVXOAcMck1
      20fizwL8ObW9+G/iv4pzatrWsbot2tXCm4jEybAm5FCpkcgN3NKrKnOK5I21vt008gpc9OTU5La2/U8N+HHxU+Ieh+HfBGo6j41vfEKeMvCV/qskd9FGGsrmGEurROqj5fY5r0r9jbxV4h8Z6eNV17XvGWq
      TXOnRyumvWCQ6fvLctbSAZc/0riLHwR8MfhH8R9I8GX3jdtRmttKm0NF1q/bztNjnULHFbQpHt3PuyXY8CvQ/gjffD74V+Lv8AhCLP4vXmvX1sn9mweHdTnTZbuhztTCD5h0xk1pXdOVOSitXrt0IoKaqJy
      lovPqYWq6t8SfiH8QviZd6B48Xwwvg7UbazsNLmCLYXClQ0huWKk/MCQMdKw/ip8QfiFea98WNa0vxlPoEHw/iszaaTZQo1tdyMqvKZ9wywOSBgjAroPH3gP4PeLvjNqOh3HxAudK1jX7iBtY8K2d2Fh1Ke
      LBjDnadr8DKhgT3FdBq3wB+H3xn17xHq2j+KNSgsLmVNN8R6XpNzttrx7fGI5QRlSuACVPI4rNVKas5LS3b0/M05Kkr2fXueWfET4r/EDUx8UvF+l+MLnQ4fAdnptzaaLaxI1reGaBJZBNkbiCWIGDwKxfjV
      +0F4v0L4o6/9g8Zalo09taaLNpOiw2yyWVxLcIhmSZivyLzkEkda9JvPh38GvjV8RNX0rQ/Hs4lvFiTXPDek3e2DUhbgKgYlckKFAOw9BWhfeF/g38VvGfj7w5YeNo5da8QWlnZXWnWkozbrZfd8kkYYj
      HOCelbRqUYtOUL/AC9P+CYclaSsp2+ZwfxR+JnxC0/xp8Xda0/xneaZF4Jg066ttEjjjezn8wL5iPkZwSTyCK3/ABH8dvF+h6f+0HqUGpb30K10ttJilUNHZvPbguVHf5ju59BTPHXgv4J319ceMdb
      +Jl9aeHfEcqWF3Yx3JS11GSzAQxvhCx2lRkZFelWfwL8EfFPwx441LSNaurnR/iBHamW4tmG2NLdPLTysjjIXnNZSqUYxV49unpf9TWMK0m4qWvqeP3nxa8efBq68b6NP4puvFxj8Fx+I7O81ZE821u
      WZVKjaACmX3YP90UnwL+J2uePvHl74FsfijqviC01bw0moPrLQotzpd8GXzFiygBXBxgggV7r4y/Zd8PeNdU1W+ur++hl1Dw8vhx1iZcLArKwcZH3sqPatzQ/gVo3h/wCIel+L7a4nF9p+iLoUcJ2iNolxh
      2wPvcVl7ehyNW1/W3+ZrHD1lJXeiPmPT/E3xA0f4L/FvxZN8R9b1C+0HULnR7KOdYti+XLGFnyFzvwSOuOav+PviF8Qte1b4i3+meNbvw/b+A9C0++t7K0iRkvppIhJIbjcCSD0wMV7xJ+zXocvw68Z
      +DzqF6LHxRqE2o3U2V8yKSRlYhOMYG0dayfGn7I/h3xlrU9+Na1nSE1Gyt9P1m10+4CRapBCAI1kyCVOBgleoqliKLk3Jfh6f8EX1eskkvz6nkvjT4kePPHviTxGNL8XXXhO28NeDLTxDFBpsSMLq6l
      Quwl3A5TjG0Yr6c+D3ii68b/C3wr4gvti3upabBdTBOF3sgJwPrXNy/s66A2ueLNRiubq3/4SHRItBlgjI2QQRqVUx8fewe/pXb+A/B9v4B8F6J4bs5ZJ7XSrSO0ikm5dlRcAnHfiuStUpzilBdvy1/
      E6cPSqQleZt7TtO4Aj0r4q+L37RXjbRfiJ4g0iy1RNPs7W4aCGJYU3BQBzlgeT1zX2sx/Kua1jwD4a166kutR0Wyu7hxtaaWBWY47E4rpy3FUMJUc8RT50eJxBluMzKhGng63s5J3fmfnHZsniTXo21X
      U2shdzbrnUrgGQruPLt61+jXhrSbDQ/ANrYaY6y2FvYiOGRTkMoTg5756/jXwx8f8AwjZeCvinq2m6dGkFg8UdwkKj5Y94OQB6ZB/OvqX9mXU5tQ+Bdqk0jSNbJPAu487VJ2j8AQPwr6vie2Ky+liqbt
      G2x+X8C/7Dm2JwNZXnr73oziP2g4hH+xH4mI/itUb87hK/KqT/AFb/AENfqx+0N/yZH4i/68o//ShK/Kh/9Wx61y8I6Zc7f1ofoGefx4eh+vi6xJqVj4Cs7c+Za6fDZ/aJB081kXC/UD+de9r0rxLQNBh0
      D4X+AYkO+aWazmmk7u5Qfy6fhXtatgCvzOhGccXXdR6t3PtKPwL0QrCjb7Vj+JPF+l+FLcTandLbIxwinJZz6Ko5J+lc9Y/GTw9dXKwzPc6fvbCPeW7RI/oQxGPzr0PdKlVhGXK3qd12rz74/wD/ACRPxr/
      2C5v/AEGu+jmWWNWUhlYZDKcg1wPx+/5In41/7Bc3/oNbU/jQ56wfodX4T/5FPRf+vKH/ANFrXnP7V1vNefs5/ECGGJ55m0uQLHGpZmOR0A616L4R/wCRU0X/AK8oP/Ra1evJobe3kkuHRIUBLtJjaB75r
      SMuWafZkTSdNpu2h+eXiO6tfHGgeM9X8MabdPptl8MotKvrlbB4Ve9EinyxlQXYAdQDjFfSf7JXiaLW/Dd1aDxiniq5tbe13RLog042Q8sDyyQB5vII3Hnj3r1jSfG/hXVtLu72w1fT7jT7UlbiWGVDHG
      f9rHA/GtN9Y0nTWlVrq1tfLh+0SDcq7YufnP8As8da9CviZVocnI0eXRp0oy9oppnxV4T1fwtoTa/4G8U+EL/XPGd18RJNQtdNigkjm8tpleK7EwABjVQW64PTvXE+JvDvjB/Cviq9jtdNfQf+FkCU/
      wChy/2p53noA6vjGzn+fNfohDeabcajEqS273skPmpgr5hjz94d9uSPzq29tCsbFkQJnd90Yz601jHB6R3/AK0K+qKor8239anwp8QNBN18P/2pZ20xprv/AISO3aCQ25aQ7VgwUOMnHPT3p+qa54Y8L6/
      8WtC8a+FL7xJqfiO80ybSdJit5BLqC+UgVo5gPlCNyTkYwa+yNJ8ZeGdeub2107VbC+mtT/pMcMiOUx3YfhV231nRtU+xTw3VpcG4VjayKysXUDJ2Hvj2oWKlGLjKD/q3+RkqVGVnGon939dT40XWf+EV/
      au8W/aPE7eD7e5k0kLZz6H9vF8ojUGISkHyyPu7ge+e1cTqfh/W4/Eup6pqFr9p8GR/FOP7RY29oyah5xkHlypNg/ugxXKjqAeea+99P8XeGtZ1q402z1LT7vU7fmWCORGlTHXI68U218ZeHL7W59Eg1Sx
      m1SH53s1kQyKR32+tafW5xvaHRL/gmfsaFl+9W7t/kfDXiby5JvFXgUaZdt48v/ibHqlnALNzI1r5sbeeJduAm1W5z/OvQvgJ8RtF8OyfFLwVez3Fn4o1nxLqX9n2rWso84up2EPt2jODyTX1HB4x8N3
      PiKTSItUsJNcjBDWyyKZgO4x1oj8WeHJvEh0VNTsW1wDc1oHTz+menXOKmWIco8soPv8A15aFwp04yUo1V2/4HqfDnwd8vX734I+G9H026g8TeGrfVU11DZvC1oWVwokcqB8zEEc89ai+Bd5cSeJPg/
      4Wg0eGfU9CvNROr2dxpk0V3p0haXdOZwwQq6lQAQc4zX6ELaxK7uiKrv8AeZVAJ9MnvQtpEsjSLGqyMPmcKAW+pqXjtGuXf/g/5nR9Rd78x+bKi70PwH8KLuS9n8Mpb+MNed9Tm0xrsWoJYBzCQdwPTn1z
      X358JdUh1r4e6FeQauNeR7cD+0ls/sguGBIL+SANmSOldS1jDIu1okZc5A2DAqWOFYwAqhVHQAYFc9fE+2io22v+J0YfDexk5XvclooorhO8KKKKACiiigD5y/aU+PWt/DPVbDR9ChjiubiE3L3d1GXXa
      DgKozyfX04pvgL9r/w7qGjqniffpWqxx5cpEzxTn1TGSM+h/OvVPid8JdB+KmkpaatAwmiybe6hbbJCSOoP9DxXztq37EutR3ROm+JLOS3P/P5CyuP++civr8FLKK+GVLFe5Nbvufk+bx4nwePniMv/
      AHlOWy7fkeP/ABg8eRfEbx5qWvwxNBZSRpDAsgw+xQRk+hOTxX2J+y/oFxo3wf0mO9gMUl0HuDG452uxK5+q4rhPh/8Asaafo+oQXviXU11gxEOLKKPZAWB43Z5Ye1fSdvax20aRxKqIq7VVRgAVpn
      WZYath4YLCaxj1I4S4fx+GxtXM8y0nPp6nkv7VPhJ9d/Zv8c6Vp0SxsunNPHFGuAfLIkKgD1Cn86/GggNEVP8AEOtfvffWcV/ZTW06CSGZDHIhGdykYI/Kvxt/ag+BN/8AAX4mX2mNbv8A8I/
      eSNPpN0QSrwk58vd/eTofwPetOGcRCHPh3o3sfVZ9Ql7laKvbQ/SL4WeJR8XP2cvB+t6SUm1C1t4GaFCDieEbZI/Y8H8xXoUPxY0CSx3yzSQ3gGGsWibzQ/8AdxjrX5Rfs8/tQ+Kf2d9TuP7LWPVNDvG
      DXek3LFUdgMb0YfcbHfvxmvriL/gpp4FksVnm8Gawmo7c+UDCw3f7+a+fzLh3HQxUquE1Uv6/A7sFm1CdJKpK0lufQ91qFh4Z0fVviH42KWUFrE00SXGMWsK9AM/xt/WvC/hz/wAFAPAHxW1+fw14r0Nv
      DVjdyFLO6v5FkglB4USHA8tj69Oeor5J/aO/a88T/tCeXp0kC6H4YhcSJpdu5YyuOjSt/ER2HQe9cX8BPgzqnxy+I+neHdPicWqus+oXgXKWtuD8zE+pxgDuTXs4Lh2nhcFKeMfvd+x51fNpVsQqeGV1103
      P1g0/7T8MfE+nadHPJeeF9UfyrdZG3NaS4yAG7oa0Pj82fgn40/7Bc3/oNUPEsUV94q8KeFdOG9NMKXk75z5UUa7UB9z71f8Aj7/yRPxp/wBgub/0Gvj6VlNJdz6WndRnHojq/CP/ACKui/8AXlB/6LWuT
      +PGk3uufCfxDZ6dBJc3ckGVhi++4DAso9cqDXWeEf8AkVdF/wCvKD/0WtaxiVuozWsZck1LszStR+sUZUm91Y+c/El5o/ir4T+L4/C3h25t7n+z4YZpl09ofPcZxGoIBcpznjv1qhqXgzxVJN4ptb6aTWbq
      58JCG2aO08oBtzfuuOC2fxr6aW3jUYCgCl8pR25rvjjnBWjH+tP8j5qfD/tXGU6mqVtFZdenzPCfhZqDeKviNYaha2N9DZafoC2U0l3bPEFmLqTGNwGSApzjjpXrvjBXbwnqyxqzyG1l2qnUnaenvWwkKR5
      2jH0p20GuWrX9pUU0tj2MJgHh8NKhKd3K+vqfKvgP4f694d1jwjdyr50cvh64RkhsPI8klUYJIw6nn+LnOaj+GfhDxH4b8SeC9Oe1uv7Ilsri/gklRv8ARJpICskLcfL853DPqRX1b5SjoMUeSnHFd39p
      T1vFar/M8CPC9KLi41GuV3/K/wCR8t/Ctb+38VeFNKtdHMF1ZQ3cWsNcaaUkgfLESCcjneSvAJyOavfBu1j0vxVLpms6fcXWsx3t3LF/xKtn2PLsTK1wfvhwRg5PXHavpXyEDEhQDR9nj5+Qc8HionjuZS
      XLua0uHvZOD9rflbe3T+up8l+FfBHiO21DwfrN7byS2z+IrhpLb7FsuYSXkCyySjkr654wVret2l8O/FpI9Ctby8nutaaS80/UdL5hR1w9xFc44XpjnvivpfyVxjHFJ5Cbs45+lOWYObfNHpYVPhyNGKVOo
      9Gncev3RS0lLXkn2YUUUUAFFFFABRRRQAUUUUAM2j60bRTsUUgGY9qd7YpaWmA0g9K474pfCjw18X/Cs2geKNOS+sZPmRs4khfs8bdVYe1dligjNVCTptSi7NESjGacZK6Z+Z3xQ/4JreM9Cu5J/
      BOp2viTTixKW124t7lBngZPyNgd8j6V5M37Ffxojuvs/wDwhFyz5x5izxGP/vrdiv2JVAKxPEcWtsIf7HltYjk+YblSfpjFfQ/6yYyhTvJKVvLX8D5+pkWGlLmjdH5tfDn/AIJvfELxFfI3iy6sfCunAjf
      5cgubhh32qvyj8T+dfangLwN4R/Z98OL4V8C6f9t1m45ldiJJpn/56TP2A9Og7Yrs28H+ItaP/E38RNHB3h02Pyt3sWOT+VdD4e8J6b4ZtzHYW6xE/fkPLufUseTXzuOzjMM192XuQ/rp/md+Fy+jhdYLXu
      9zL8C+DT4Zhurm8k+2axfv5t3ct1J7KP8AZFZXx+/5In40/wCwZN/KvQQuK5X4m+Gbnxp8P/EOgWckcNzqFnJbRyS/cVmGATjtUU/dav0O/kUYOMTT8I/8iro3/XlB/wCi1rZrO0KyfTdF0+0kIZ7e3jhZh
      0JVQCR+VaNW9y47BRRRSKCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/2Q==
      "/>
	</xsl:template>

	<!-- Logo INCa encodé en B64 -->
	<xsl:template name="printLogoInstitut">
		<img
			src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJkAAABKCAMAAACfKAYJAAADAFBMVEVMaXEkNXUkNXUkN
      XUkNXWEHV0kNXWEHV2EHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEH
      V0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV0kNXUkNXUkNXWEHV0kNX
      UkNXUkNXWEHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV0kNXUkNXWEHV2EHV2EHV2EHV2
      EHV0kNXUkNXUkNXUkNXUkNXWEHV0kNXUkNXUkNXUkNXUkNXWEHV2EHV0kNXUkNXUkNXWEHV0kNXUkNXWEHV2EHV2EHV2EHV2E
      HV0kNXUkNXUkNXWEHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV2EHV0kNXWEHV2EHV2EHV2EHV2EHV0kNXUkNXUkNXUkNXUkNX
      UkNXUkNXWEHV0kNXWEHV0kNXWEHV2EHV0kNXWEHV2EHV2EHV2EHV2EHV2EHV2EHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWE
      HV0kNXUkNXWEHV2EHV2EHV2EHV0kNXWEHV2EHV2EHV2EHV2EHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV2EHV2EHV
      2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV0kNXWEHV2EH
      V2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV0kNXWEHV0kNXWEHV0kNXUkNXUkNXUkNXWEHV0kNXUkNXUkNXUk
      NXWEHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV0kNXUkNXWEHV2EHV2EHV2EHV2EHV2EHV2EHV2
      EHV2EHV2EHV2EHV0kNXUkNXUkNXWEHV21GfObAAAA/nRSTlMACiL+7QU1Qbnw/SYGx/vSDRVI9+oYomQZEfYB+fNRAxwB6A+VDsJ
      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
      "/>
	</xsl:template>
</xsl:stylesheet>
