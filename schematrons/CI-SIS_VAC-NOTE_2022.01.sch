<?xml version="1.0" encoding="UTF-8"?>

<!-- 
   ......................................................................................................................................................
   CI-SIS_VAC-NOTE_2022.01.sch : Schématron de vérification de la conformité au modèle Note de vaccination du CI-SIS
   ......................................................................................................................................................      
   Auteur : ANS
   ......................................................................................................................................................    
   Historique :
       15/04/2022 : Création
   ......................................................................................................................................................    
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_VAC-NOTE_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_VAC-NOTE_2022.01.sch">
    <title>Vérification de la conformité au modèle Note de vaccination 2022.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>

    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>

    <!-- JDV -->
    <include href="include/jeuxDeValeurs/VAC_2022.01/JDV_UsageDrogues-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/VAC_2022.01/JDV_ProfessionsExposees-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/VAC_2022.01/JDV_vieEnCollectivite-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/VAC_2022.01/JDV_RisquePourUsager-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/VAC_2022.01/JDV_RisquePourEntourage-CISIS.sch"/>
    
    <!-- Entete -->
    <include href="include/specificationsVolets/VAC-NOTE_2022.01/Entete/Entete_VAC-NOTE_2022.01.sch"/>
    
    <!-- Section -->
    <include href="include/specificationsVolets/VAC-NOTE_2022.01/Sections/S_Vaccination_VAC-Note.sch"/>

    <!-- Entrée -->
    <include href="include/specificationsVolets/VAC-NOTE_2022.01/Entrees/E_Vaccination_VAC-Note.sch"/>
    
    <phase id="CI-SIS_VAC-NOTE_2022.01">
        
        <!-- Entete -->
        <active pattern="Entete_VAC-NOTE"/>
        
        <!-- Section -->
        <active pattern="S_Vaccination_VAC-Note"/>
        
        <!-- Entrée -->
        <active pattern="E_Vaccination_VAC-Note"/>
        
        <!-- JDV -->
        <active pattern="variables"/>
        <active pattern="JDV_UsageDrogues-CISIS"/>
        <active pattern="JDV_ProfessionsExposees-CISIS"/>
        <active pattern="JDV_vieEnCollectivite-CISIS"/>
        <active pattern="JDV_RisquePourUsager-CISIS"/>
        <active pattern="JDV_RisquePourEntourage-CISIS"/>

    </phase>

    <!-- Variables globales -->
    <pattern id="variables">

        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="jdv_AllergyAndIntoleranceCodes"
            value="'../jeuxDeValeurs/JDV_HL7_ObservationIntoleranceType-CISIS.xml'"/>
        <let name="JDV_UsageDrogues-CISIS" value="'../jeuxDeValeurs/JDV_UsageDrogues-CISIS.xml'"/>
        <let name="JDV_ProfessionsExposees-CISIS"
            value="'../jeuxDeValeurs/JDV_ProfessionsExposees-CISIS.xml'"/>
        <let name="JDV_vieEnCollectivite-CISIS"
            value="'../jeuxDeValeurs/JDV_vieEnCollectivite-CISIS.xml'"/>
        <let name="JDV_RisquePourUsager-CISIS"
            value="'../jeuxDeValeurs/JDV_RisquePourUsager-CISIS.xml'"/>
        <let name="JDV_RisquePourEntourage-CISIS"
            value="'../jeuxDeValeurs/JDV_RisquePourEntourage-CISIS.xml'"/>

    </pattern>
</schema>
