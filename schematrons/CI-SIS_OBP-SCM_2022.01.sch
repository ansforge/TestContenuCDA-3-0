<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_OBP-SCM_2022.01.sch    
    ......................................................................................................................................................    
    Auteur : ANS
    ......................................................................................................................................................    
    Historique :
        17/10/2013 : Création
        19/06/2015 : Maj des include telecom20110728.sch  -> telecom20150317.sch
        14/03/2018 : MAJ du pattern Variables
        20/11/2020 : Modification du nom du schématron JDV appelé (ancien JDV_routeOfAdministration_OBP.sch)
        10/09/2021 : Modification du nom du schématron
        20/04/2022:  Modification vers la nouvelle version 2022.01
        20/04/2022:  Migration des terminologies et JDV en SNOMED-CT

-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_OBP-SCM_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_OBP-SCM_2022.01.sch">
    <title>Vérification de la conformité au modèle OBP-SCM_2022.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>
    
    <!-- Entete -->    
    <include href="include/specificationsVolets/OBP-SCM_2022.01/Entete/Entete_OBP-SCM.sch"/>
    
    <!-- Sections --> 
    <include href="include/specificationsVolets/OBP-SCM_2022.01/Sections/S_ResultatsEvenements_OBP-SCM.sch"/>
    <include href="include/specificationsVolets/OBP-SCM_2022.01/Sections/S_ActesInterventions_OBP-SCM.sch"/>
        
    <!-- JDV --> 
    <include href="include/jeuxDeValeurs/OBP-SCM_2022.01/JDV_ModeSortie_OBP-SCM.sch"/>
        
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_OBP-SCM_2022.01">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        
        <!-- Activation Entete -->
        <active pattern="Entete_OBP-SCM"/>
        
        <!-- Activation Sections -->
        <active pattern="S_ResultatsEvenements_OBP-SCM"/>
        <active pattern="S_ActesInterventions_OBP-SCM"/>
        
        <!-- Activation JDV -->
        <active pattern="JDV_ModeSortie_OBP-SCM"/>
        
    </phase>

    <!-- Variables globales -->
    <pattern id="variables">
        
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="jdv_ModeSortie_OBP-SCM" value="'../jeuxDeValeurs/JDV_ModeSortie-OBP-SCM-CISIS.xml'"/>
        
    </pattern>
</schema>
