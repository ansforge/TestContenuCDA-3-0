<?xml version="1.0" encoding="UTF-8"?>

<!-- CI-SIS_VSM_2023.01.sch
        
        Schématron du Volet de Synthèse Médicale (VSM 2023.01)
        Auteur : ANS 
        Historique :
        14/09/2023 : Création : Nouvelle version 2023.01
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_VSM_2023.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_VSM_2023.01.sch">
    
    <title>Vérification de conformité du document aux spécifications du modèle VSM_2023.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!--  Abstract patterns  -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>
    
    <!-- Entête du document VSM_2023.01 -->
    <include href="include/specificationsVolets/VSM_2023.01/Entete/Entete_VSM_2023.sch"/>
    
    <phase id="CI-SIS_VSM_2023.01">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        
        <!-- schématron de l'entête VSM_2023.01 -->
        <active pattern="Entete_VSM_2023"/> 
    </phase>
    
    <pattern id="variables">
        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">
            <!-- Vérifier la présence de la section "Pathologies, antécédents, allergies et facteurs de risque"-->
            <assert test="cda:component/cda:section/cda:templateId[@root='1.2.250.1.213.1.1.2.29']"> 
                [VSM_2023.01] Erreur de conformité au volet VSM : La section "Pathologies, antécédents, allergies et facteurs de risque" (1.2.250.1.213.1.1.2.29) doit être présente.
            </assert>
            
            <!-- Verifier la présence de la section "Résultats"-->
            <assert test="cda:component/cda:section/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.3.27']"> 
                [VSM_2023.01] Erreur de conformité au volet VSM : La section "Résultats" (1.3.6.1.4.1.19376.1.5.3.1.3.27) doit être présente.
            </assert>
            
            <!--  Verifier la présence de la section "Traitement au long cours"-->
            <assert test="cda:component/cda:section/cda:templateId[@root='1.2.250.1.213.1.1.2.32']"> 
                [VSM_2023.01] Erreur de conformité au volet VSM : La section "Traitement au long cours" (1.2.250.1.213.1.1.2.32) doit être présente.
            </assert>
        </rule>
        
    </pattern>
</schema>
