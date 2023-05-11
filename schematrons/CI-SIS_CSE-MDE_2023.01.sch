<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Schématron du CS24 : CI-SIS_CSE-MDE_2022.01.sch
    ANS
    Vérification de la conformité au Mesures de l'Enfant - MDE du CI-SIS.
    ......................................................................................................................................................
    Historique :
        21/12/2022 : NBE : Création
    ......................................................................................................................................................               
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_CSE_MDE_2023.01" 
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CSE_MDE_2023.01.sch">
    <title>Vérification de conformité du document aux spécifications du modèle CI-SIS_CSE_MDE_2023.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!-- Entete -->    
    <include href="include/specificationsVolets/CSE-MDE_2023.01/Entete/Entete_CSE-MDE.sch"/>
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <phase id="CI-SIS_CSE_MDE_2023.01">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        <!-- Entete -->        
        <active pattern="Entete_CSE-MDE"/>
    </phase>
    
    <!-- Variables globales -->
    <pattern id="variables">
        <rule context='cda:ClinicalDocument/cda:component/cda:structuredBody'>
            <!-- Présence obligatoire de la section Signes vitaux (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2"]'>
                [CI-SIS_CSE_MDE_2023.01.sch] Erreur de conformité : La section Signes vitaux (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2) est obligatoire.  
            </assert>
        </rule>
    </pattern>
</schema>
