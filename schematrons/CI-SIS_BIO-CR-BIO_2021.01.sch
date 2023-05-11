<?xml version="1.0" encoding="UTF-8"?>

<!-- 
   CI-SIS_BIO-CR-BIO_2021.01.sch 
   auteur : ANS
   ......................................................................................................................................................    
   Historique :
   13/10/2022 : Création
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_BIO-CR-BIO_2021.01"
	xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_BIO-CR-BIO_2021.01.sch">
	
	<title>Vérification de conformité du document au modèle BIO-CR-BIO_2021.01</title>
	<ns prefix="cda" uri="urn:hl7-org:v3"/>
	<ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<ns prefix="jdv" uri="http://esante.gouv.fr"/>
	<ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
	
	<!-- Abstract patterns -->	
	<include href="abstract/dansJeuDeValeurs.sch"/>
	<include href="abstract/IVL_TS.sch"/>   
	
	<!-- Entête du volet CR-BIO -->	
	<include href="include/specificationsVolets/BIO-CR-BIO_2021.01/Entete/Entete_CR-BIO.sch"/>
	
	<!-- Sections relatives au volet CR-BIO -->
	<include href="include/specificationsVolets/BIO-CR-BIO_2021.01/Sections/S_FR-Resultats-de-laboratoire-de-biologie-de-seconde-intention.sch"/>
	
	<!-- Entrées relatives au volet CR-BIO -->
	<include href="include/specificationsVolets/BIO-CR-BIO_2021.01/Entrees/E_FR-Resultats-examens-de-biologie-medicale.sch"/>
	<include href="include/specificationsVolets/BIO-CR-BIO_2021.01/Entrees/E_FR-Batterie-examens-de-biologie-medicale.sch"/>
	<include href="include/specificationsVolets/BIO-CR-BIO_2021.01/Entrees/E_FR-Isolat-microbiologique.sch"/>
	<include href="include/specificationsVolets/BIO-CR-BIO_2021.01/Entrees/E_FR-Laboratoire-executant.sch"/>
	<include href="include/specificationsVolets/BIO-CR-BIO_2021.01/Entrees/E_FR-Prelevement.sch"/>
	<include href="include/specificationsVolets/BIO-CR-BIO_2021.01/Entrees/E_FR-Resultat-examens-de-biologie-element-clinique-pertinent.sch"/>
	
	<!-- JDV relatives au volet CR-BIO -->
	<include href="include/jeuxDeValeurs/BIO-CR-BIO_2021.01/JDV_HL7_ObservationInterpretation-CISIS.sch"/>
	
	<phase id="CI-SIS_BIO-CR-BIO_2021.01">
		<active pattern="variables"/>
		
		<!-- Activation de l'en-tête  -->
		<active pattern="Entete_CR-BIO"/>
		
		<!-- activation des sections -->
		<active pattern="S_FR-Resultats-de-laboratoire-de-biologie-de-seconde-intention"/>
		
		<!-- Activation des entrées  -->
		<active pattern="E_FR-Resultats-examens-de-biologie-medicale"/>
		<active pattern="E_FR-Batterie-examens-de-biologie-medicale"/>
		<active pattern="E_FR-Isolat-microbiologique"/>
		<active pattern="E_FR-Laboratoire-executant"/>
		<active pattern="E_FR-Prelevement"/>
		<active pattern="E_FR-Resultat-examens-de-biologie-element-clinique-pertinent"/>
		
		<!-- Activation des JDVs  -->
		<active pattern="JDV_HL7_ObservationInterpretation-CISIS"/>
	</phase>	
	
	<!-- ::::::::::::::::::::::::::::::::::::: -->
	<!--           Variables globales          -->
	<!-- ::::::::::::::::::::::::::::::::::::: -->
	
	<pattern id="variables">
		
		<!-- chemins relatifs des fichiers jeux de valeurs -->
		<let name="JDV_HL7_ObservationInterpretation-CISIS" value="'../jeuxDeValeurs/JDV_HL7_ObservationInterpretation-CISIS.xml'"/>
		
		<!-- présence des sections obligatoires -->        
		<rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">            
			<assert test="count(cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.3.2.1'])&gt; 0"> 
				[CI-SIS_BIO-CR-BIO] Erreur de conformité au modèle : La section FR-CR-BIO-Chapitre (1.3.6.1.4.1.19376.1.3.3.2.1) doit être présente.
			</assert>
		</rule>
	</pattern>
	
</schema>
