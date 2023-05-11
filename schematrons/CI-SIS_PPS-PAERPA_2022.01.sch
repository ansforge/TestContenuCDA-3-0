<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_PPS-PAERPA_2022.01.sch
    ANS   
    ......................................................................................................................................................    
    Historique :
    24/08/2021 : Création    
    26/10/2021 : Suppression du test de présence de la section FR-Education-et-consentement-du-patient
    21/04/2022 : Migration des terminologies et JDVs en SNOMED-CT
    ......................................................................................................................................................    
      
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_PPS-PAERPA_2022.01.sch">
    
    <title>Rapport de conformité du document aux spécifications du modèle PPS-PAERPA_2022.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>
    
    <!-- JDV --> 
    <include href="include/jeuxDeValeurs/PPS-PAERPA_2022.01/JDV_ProblemePPSPAERPA-CISIS.sch"/>
        
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_PPS-PAERPA_2022.01">
        
        <active pattern="variables"/>
        
        <!-- JDV -->
        <active pattern="JDV_ProblemePPSPAERPA-CISIS"/>
        
    </phase>
    
    <pattern id="variables">
        <let name="JDV_ProblemePPSPAERPA-CISIS" value="'../jeuxDeValeurs/JDV_ProblemePPSPAERPA-CISIS.xml'"/>        
        
        <!-- présence des sections obligatoires -->        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">            
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.44'])=1"> 
                [CI-SIS_PPS-PAERPA_2022.01] Erreur de conformité au modèle : La section "FR-Dispositions-medico-sociales" (1.2.250.1.213.1.1.2.44) est obligatoire [1..1].
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.35'])=1"> 
                [CI-SIS_PPS-PAERPA_2022.01] Erreur de conformité au modèle : La section "FR-Statut-du-document" (1.2.250.1.213.1.1.2.35) est obligatoire [1..1].
            </assert>
        </rule>
    </pattern>
</schema>