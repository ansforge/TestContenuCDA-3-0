<?xml version="1.0" encoding="UTF-8"?>

<!-- 
   ......................................................................................................................................................
   CI-SIS_VAC-NOTE_2023.01.sch : Schématron de vérification de la conformité au modèle Note de vaccination du CI-SIS
   ......................................................................................................................................................      
   Auteur : ANS
   ......................................................................................................................................................    
   Historique :
       15/04/2022 : Création
       30/01/2023 : Nouvelle version du volet VAC 2023.01
   ......................................................................................................................................................    
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_VAC-NOTE_2023.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_VAC-NOTE_2023.01.sch">
    <title>Vérification de la conformité au modèle Note de vaccination 2023.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>

    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>

    <!-- JDV -->
    
   
    <!-- Entete -->
    <include href="include/specificationsVolets/VAC-NOTE_2023.01/Entete/Entete_VAC-NOTE_2023.01.sch"/>
    
    <!-- Section -->
    <include href="include/specificationsVolets/VAC-NOTE_2023.01/Sections/S_Vaccination_VAC-Note.sch"/>

    <!-- Entrée -->
    <include href="include/specificationsVolets/VAC-NOTE_2023.01/Entrees/E_Vaccination_VAC-Note.sch"/>
    
    <phase id="CI-SIS_VAC-NOTE_2023.01">
        
        <!-- Entete -->
        <active pattern="Entete_VAC-NOTE"/>
        
        <!-- Section -->
        <active pattern="S_Vaccination_VAC-Note"/>
        
        <!-- Entrée -->
        <active pattern="E_Vaccination_VAC-Note"/>
        
        <!-- JDV -->
        <active pattern="variables"/>

    </phase>

    <!-- Variables globales -->
    <pattern id="variables">
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:substanceAdministration">
            
            <assert test="./cda:author/cda:assignedAuthor/cda:code[@nullFlavor or @displayName]"> 
                [CI-SIS_VAC-Note_2023.01] Erreur de conformité : Dans une note de vaccination, le displayName de la profession de l'auteur de la vaccination est obligatoire
            </assert>
            
            <assert test="not(cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:code) or cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:code[@nullFlavor or @displayName]">
                [CI-SIS_VAC-Note_2023.01] Erreur de conformité : Dans une note de vaccination, le displayName de la profession du vaccinateur est obligatoire
            </assert>
            
            <assert test="not(cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:translation[@codeSystem='2.16.840.1.113883.6.73']) or cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:translation[@codeSystem='2.16.840.1.113883.6.73' and @displayName]">
                [CI-SIS_VAC-Note_2023.01] Erreur de conformité : Dans une note de vaccination, le displayName du vaccin en ATC est obligatoire
            </assert>
            
            <assert test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code[not(@code) or (@code and @displayName)]">
                [CI-SIS_VAC-Note_2023.01] Erreur de conformité : Dans une note de vaccination, le displayName du vaccin en CIS est obligatoire
            </assert>
            
            <assert test="not(cda:approachSiteCode) or cda:approachSiteCode[@nullFlavor or @displayName]">
                [CI-SIS_VAC-Note_2023.01] Erreur de conformité : Dans une note de vaccination, le displayName de la région d'administration est obligatoire
            </assert>

            <assert test="not(cda:routeCode) or cda:routeCode[@nullFlavor or @displayName]">
                [CI-SIS_VAC-Note_2023.01] Erreur de conformité : Dans une note de vaccination, le displayName de la voie d'administration est obligatoire
            </assert>
            
            <assert test="cda:code[@nullFlavor or @displayName]">
                [CI-SIS_VAC-Note_2023.01] Erreur de conformité : Dans une note de vaccination, le displayName du type d'acte de vaccination est obligatoire
            </assert>
            
        </rule>
        
    </pattern>
</schema>
