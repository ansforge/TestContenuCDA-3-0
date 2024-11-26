<?xml version="1.0" encoding="UTF-8"?>

<!-- CI-SIS_eDISP-MED_2024.01.sch 
     ......................................................................................................................................................
     Vérification de la conformité au modèle du document eDISP-MED_2024.01 du CI-SIS.
     ......................................................................................................................................................
     Historique :
        - 17/06/2024 : Création
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="eDISP-MED_2024.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="eDISP-MED_2024.01.sch">
    
    <title>Rapport de conformité du document aux spécifications du modèle de document eDISP-MED_2024.01 (eDispensation de médicaments)</title>
    
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    <ns prefix="pharm" uri="urn:ihe:pharm"/>
    
    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/> 
    <include href="abstract/IVL_TS.sch"/>
    
    <!-- Entête du document eDISP-MED -->
    <include href="include/specificationsVolets/eDISP-MED_2024.01/Entete/Entete_eDISP-MED_2024.01.sch"/>
    
    <!-- Sections specifiques du document eDISP-MED -->    
    <include href="include/specificationsVolets/eDISP-MED_2024.01/Sections/S_dispensationMedicaments.sch"/>
    
    <!-- Entrées du document eDISP-MED -->
    <include href="include/specificationsVolets/eDISP-MED_2024.01/Entrees/E_dispensationMedicament.sch"/>
    <include href="include/specificationsVolets/eDISP-MED_2024.01/Entrees/E_referenceItemPrescription.sch"/>
    
    <!-- Phase en vigueur -->
    <phase id="eDISP-MED_2024.01">
        <active pattern="variables"/>
        
        <!-- schématron de l'entête eDISP-MED-DM -->
        <active pattern="Entete_eDISP-MED_2024.01"/> 
        
        <!-- schématrons des sections eDISP-MED-DM -->
        <active pattern="S_dispensationMedicaments"/>
        
        <!-- schématrons des entrées eDISP-MED-DM -->
        <active pattern="E_dispensationMedicament"/>
        <active pattern="E_referenceItemPrescription"/>
        
        
    </phase>
    
    <!-- Variables globales -->
    <pattern id="variables">
        
        <!-- présence des sections obligatoires -->    
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">
            <!-- [1..1] Section FR-Dispensation-medicaments(obligatoire) -->
            <assert test="cda:component/cda:section/cda:templateId[@root='1.2.250.1.213.1.1.2.236']"> 
                [eDISP-MED_2024.01] Erreur de conformité : La section "FR-Dispensation-medicaments" (1.2.250.1.213.1.1.2.236) doit être présente.
            </assert>                        
            
        </rule>
        
    </pattern>
    
</schema>