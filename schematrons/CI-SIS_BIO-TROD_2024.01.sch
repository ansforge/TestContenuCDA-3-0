<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Schématron du BIO-TROD : CI-SIS_BIO-TROD_2024.01.sch
    ANS
    Vérification de la conformité de l'attestation de dépistage - BIO-TROD du CI-SIS.
    ......................................................................................................................................................
    Historique :
        20/12/2023 : Création
        03/06/2024 : MAJ : 
                    - Ajout des schematrons des JDVs
                    - MAJ des schematrons des entrées 
      17/06/2024 : Suppression du sch JDV_ResultatDepistageTcPO2_CISIS.sch
      01/08/2024 : renommage du document en BIO-TROD 
    ......................................................................................................................................................               
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_BIO-TROD_2024.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_BIO-TROD_2024.01.sch">
    <title>Vérification de conformité du document aux spécifications du modèle CI-SIS_BIO-TROD_2024.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!-- Entete -->    
    <include href="include/specificationsVolets/BIO-TROD_2024.01/Entete/Entete_BIO-TROD.sch"/>
    
    <!-- Sections spécifiques au volet -->    
    <include href="include/specificationsVolets/BIO-TROD_2024.01/Sections/S_laboratorySpecialty_BIO-TROD.sch"/>    
    
    
    
    <!-- Entrées spécifiques au volet -->    
    <include href="include/specificationsVolets/BIO-TROD_2024.01/Entrees/E_laboratoryReportDataProcessing_BIO-TROD.sch"/>
    <include href="include/specificationsVolets/BIO-TROD_2024.01/Entrees/E_resultatExamensBiologieElementCliniquePertinent.sch"/>
    
    
    <!-- JDV -->    
      <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistage_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageGlycemie_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageCetonemie_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageCholesterol_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageCRP_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageRuptureMembranePH_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageBilirubinemie_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageProteinurie_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageCorpsCetoniques_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageGlucose_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageBilirubinurie_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageUrobilinogenurie_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageNitriturie_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageHematurie_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageLeucocyturie_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageAcideAscorbique_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageNitriturieCystite_CISIS.sch"/>
    <include href="include/jeuxDeValeurs/BIO-TROD_2024.01/JDV_ResultatDepistageLeucocyturieCystite_CISIS.sch"/>
    
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_BIO-TROD_2024.01">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        
        <!-- Entete -->        
        <active pattern="Entete_BIO-TROD"/>
        
        <!-- Sections spécifiques -->        
        <active pattern="S_laboratorySpecialty_BIO-TROD"/>
        
        <!-- Entrées spécifiques -->        
        <active pattern="E_laboratoryReportDataProcessing_BIO-TROD"/>
        <active pattern="E_resultatExamensBiologieElementCliniquePertinent_BIO-TROD"/>
       
        
        <!-- JDV -->        
        <active pattern="JDV_ResultatDepistage_CISIS"/>
        <active pattern="JDV_ResultatDepistageGlycemie_CISIS"/>
        <active pattern="JDV_ResultatDepistageCetonemie_CISIS"/>
        <active pattern="JDV_ResultatDepistageCholesterol_CISIS"/>
        <active pattern="JDV_ResultatDepistageCRP_CISIS"/>
        <active pattern="JDV_ResultatDepistageRuptureMembranePH_CISIS"/>
        <active pattern="JDV_ResultatDepistageBilirubinemie_CISIS"/>
        <active pattern="JDV_ResultatDepistageProteinurie_CISIS"/>
        <active pattern="JDV_ResultatDepistageCorpsCetoniques_CISIS"/>
        <active pattern="JDV_ResultatDepistageGlucose_CISIS"/>
        <active pattern="JDV_ResultatDepistageBilirubinurie_CISIS"/>
        <active pattern="JDV_ResultatDepistageUrobilinogenurie_CISIS"/>
        <active pattern="JDV_ResultatDepistageNitriturie_CISIS"/>
        <active pattern="JDV_ResultatDepistageHematurie_CISIS"/>
        <active pattern="JDV_ResultatDepistageLeucocyturie_CISIS"/>
        <active pattern="JDV_ResultatDepistageAcideAscorbique_CISIS"/>
        <active pattern="JDV_ResultatDepistageNitriturieCystite_CISIS"/>
        <active pattern="JDV_ResultatDepistageLeucocyturieCystite_CISIS"/>
        
        
    </phase>
    
    <!-- Variables globales -->
    
    <pattern id="variables">
        
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="JDV_ResultatDepistage_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistage_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageGlycemie_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageGlycemie_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageCetonemie_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageCetonemie_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageCholesterol_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageCholesterol_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageCRP_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageCRP_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageRuptureMembranePH_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageRuptureMembranePH_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageBilirubinemie_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageBilirubinemie_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageProteinurie_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageProteinurie_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageCorpsCetoniques_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageCorpsCetoniques_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageGlucose_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageGlucose_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageBilirubinurie_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageBilirubinurie_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageUrobilinogenurie_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageUrobilinogenurie_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageNitriturie_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageNitriturie_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageHematurie_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageHematurie_CISIS'"/>
        <let name="JDV_ResultatDepistageLeucocyturie_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageLeucocyturie_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageAcideAscorbique_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistageAcideAscorbique_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageNitriturieCystite_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistage_CISIS.xml'"/>
        <let name="JDV_ResultatDepistageLeucocyturieCystite_CISIS" value="'../jeuxDeValeurs/JDV_ResultatDepistage_CISIS.xml'"/>
        
        
        <!-- présence des sections obligatoires -->        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">            
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.3.2.1'])&gt; 0"> 
                [CI-SIS_BIO-TROD] Erreur de conformité au modèle : La section FR-CR-BIO-Chapitre (1.3.6.1.4.1.19376.1.3.3.2.1) doit être présente.
            </assert>
        </rule>
    </pattern>
</schema>
