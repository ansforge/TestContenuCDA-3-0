<?xml version="1.0" encoding="UTF-8"?>

<!-- 
   ......................................................................................................................................................
   CI-SIS_VAC_2022.01.sch : Schématron de vérification de la conformité au modèle Historique de vaccination (créé par le DMP) du CI-SIS
   ......................................................................................................................................................      
   Auteur : ANS
   ......................................................................................................................................................    
   Historique :
       15/04/2022 : Création
   ......................................................................................................................................................    
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_VAC_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_VAC_2022.01.sch">
    <title>Vérification de la conformité au modèle Historique de vaccination 2022.01</title>
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
    <include href="include/specificationsVolets/VAC_2022.01/Entete/Entete_VAC_2022.01.sch"/>

    <phase id="CI-SIS_VAC_2022.01">
        
        <!-- Entete -->
        <active pattern="Entete_VAC_2022.01"/>
        
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
        
        <!-- présence des sections obligatoires -->        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">            
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.23'])=1"> 
                [CI-SIS_VAC_2022.01] Erreur de conformité au modèle : La section "FR-Vaccinations" (1.3.6.1.4.1.19376.1.5.3.1.3.23) doit être présente [1..1].
            </assert>
            
        </rule>
    </pattern>
</schema>
