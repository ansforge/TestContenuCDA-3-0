<?xml version="1.0" encoding="UTF-8"?>

<!-- 
   ......................................................................................................................................................
   CI-SIS_VAC_2023.01.sch : Schématron de vérification de la conformité au modèle Historique de vaccination (créé par le DMP) du CI-SIS
   ......................................................................................................................................................      
   Auteur : ANS
   ......................................................................................................................................................    
   Historique :
       15/04/2022 : Création
       30/01/2023 : Nouvelle version du volet VAC 2023.01
   ......................................................................................................................................................    
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_VAC_2023.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_VAC_2023.01.sch">
    <title>Vérification de la conformité au modèle Historique de vaccination 2023.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>

    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>

    <!-- JDV -->

    <!-- Entete -->
    <include href="include/specificationsVolets/VAC_2023.01/Entete/Entete_VAC_2023.01.sch"/>

    <phase id="CI-SIS_VAC_2023.01">
        
        <!-- Entete -->
        <active pattern="Entete_VAC_2023.01"/>
        
        <!-- JDV -->
        <active pattern="variables"/>

    </phase>

    <!-- Variables globales -->
    <pattern id="variables">
        
        <!-- présence des sections obligatoires -->        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">            
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.23'])=1"> 
                [CI-SIS_VAC_2023.01] Erreur de conformité au modèle : La section "FR-Vaccinations" (1.3.6.1.4.1.19376.1.5.3.1.3.23) doit être présente [1..1].
            </assert>
            
        </rule>
    </pattern>
</schema>
