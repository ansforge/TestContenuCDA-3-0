<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Schématron du BIO-ATTEST-DEPIST : CI-SIS_BIO-ATTEST-DEPIST_2024.01.sch
    ANS
    Vérification de la conformité de l'attestation de dépistage - BIO-ATTEST-DEPIST du CI-SIS.
    ......................................................................................................................................................
    Historique :
        20/12/2023 : Création
    ......................................................................................................................................................               
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_BIO-ATTEST-DEPIST_2024.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_BIO-ATTEST-DEPIST_2024.01.sch">
    <title>Vérification de conformité du document aux spécifications du modèle CI-SIS_BIO-ATTEST-DEPIST_2024.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!-- Entete -->    
    <include href="include/specificationsVolets/BIO-ATTEST-DEPIST_2024.01/Entete/Entete_BIO-ATTEST-DEPIST.sch"/>
    
    <!-- Sections spécifiques au volet -->    
    <include href="include/specificationsVolets/BIO-ATTEST-DEPIST_2024.01/Sections/S_laboratorySpecialty_BIO-ATTEST-DEPIST.sch"/>    
    
    
    
    <!-- Entrées spécifiques au volet -->    
    <include href="include/specificationsVolets/BIO-ATTEST-DEPIST_2024.01/Entrees/E_laboratoryReportDataProcessing_BIO-ATTEST-DEPIST.sch"/>
    
    
    <!-- JDV -->    
      <include href="include/jeuxDeValeurs/BIO-ATTEST-DEPIST_2024.01/JDV_ResultatDepistage_CISIS.sch"/>   
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <phase id="CI-SIS_BIO-ATTEST-DEPIST_2024.01">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        
        <!-- Entete -->        
        <active pattern="Entete_BIO-ATTEST-DEPIST"/>
        
        <!-- Sections spécifiques -->        
        <active pattern="S_laboratorySpecialty_BIO-ATTEST-DEPIST"/>
        
        <!-- Entrées spécifiques -->        
        <active pattern="E_laboratoryReportDataProcessing_BIO-ATTEST-DEPIST"/>
       
        
        <!-- JDV -->        
        <active pattern="JDV_ResultatDepistage_CISIS"/>
        
    </phase>
    
    <!-- Variables globales -->
    
    <pattern id="variables">
        
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="JDV_ResultatDepistage_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistage_CISIS.xml'"/>
        
        <!-- présence des sections obligatoires -->        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">            
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.3.2.1'])&gt; 0"> 
                [CI-SIS_BIO-ATTEST-DEPIST] Erreur de conformité au modèle : La section FR-CR-BIO-Chapitre (1.3.6.1.4.1.19376.1.3.3.2.1) doit être présente.
            </assert>
        </rule>
    </pattern>
</schema>
