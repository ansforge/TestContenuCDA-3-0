<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_OBP-SNE_2024.01.sch    
    ......................................................................................................................................................    
    Auteur : ANS
    ......................................................................................................................................................    
    Historique :
        17/10/2013 : Création
        19/06/2015 : Maj des include telecom20110728.sch -> telecom20150317.sch
        14/03/2018 : MAJ du pattern Variables
        20/11/2020 : Modification du nom du schématron JDV appelé (ancien JDV_routeOfAdministration_OBP.sch)        
        10/09/2021 : Modification du nom du schématron
        13/09/2021 : Modification pour version 2021.01
        20/04/2022 : Modification pour version 2022.01
        13/06/2023 : Nouvelle version 2023.01
        22/08/2023 : Ajout du schématron JDV_ModeSortie_OBP-SNE.sch 
        03/01/2024 : Version 2024.01
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_OBP-SNE_2024.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_OBP-SNE_2024.01.sch">
    <title>Vérification de la conformité au modèle OBP-SNE_2024.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!-- Entete -->    
    <include href="include/specificationsVolets/OBP-SNE_2024.01/Entete/Entete_OBP-SNE.sch"/>
    
    <!-- Sections -->   
    <include href="include/specificationsVolets/OBP-SNE_2024.01/Sections/S_codedDetailedPhysicalExamination_OBP-SNE.sch"/>
    
    <!-- JDV -->   
    <include href="include/jeuxDeValeurs/OBP-SNE_2024.01/JDV_ModeNaissance_OBP-SNE.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNE_2024.01/JDV_TypeInterventionVoieBasse_OBP-SNE.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNE_2024.01/JDV_PresentationFoetale_OBP-SNE.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNE_2024.01/JDV_QuantiteLA_OBP-SNE.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNE_2024.01/JDV_AspectLA_OBP-SNE.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNE_2024.01/JDV_CirconstancesDeces_OBP-SNE.sch"/>
    <!--<include href="include/jeuxDeValeurs/OBP-SNE_2024.01/JDV_GesteReanimationNN_OBP-SNE.sch"/>-->
    <include href="include/jeuxDeValeurs/OBP-SNE_2024.01/JDV_ApproachSiteCode_OBP-SNE.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNE_2024.01/JDV_OBP_Result-Evenement.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SNE_2024.01/JDV_ModeSortie_OBP-SNE.sch"/>
    
    
    
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_OBP-SNE_2024.01">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        
        <!-- Activation Entete -->        
        <active pattern="Entete_OBP-SNE"/>
        
        <!-- Activation Sections -->        
        <active pattern="S_CodedDetailedPhysicalExamination_OPB-SNE"/>
        
        <!-- Activation JDV -->        
        <active pattern="JDV_ModeNaissance_OBP-SNE"/>
        <active pattern="JDV_TypeInterventionVoieBasse_OBP-SNE"/>
        <active pattern="JDV_PresentationFoetale_OBP-SNE"/>
        <active pattern="JDV_QuantiteLA_OBP-SNE"/>
        <active pattern="JDV_AspectLA_OBP-SNE"/>
        <active pattern="JDV_CirconstancesDeces_OBP-SNE"/>
        <!--<active pattern="JDV_GesteReanimationNN_OBP-SNE"/>-->
        <active pattern="JDV_ApproachSiteCode_OBP-SNE"/>
        <active pattern="JDV_OBP_Result-Evenement"/>
        <active pattern="JDV_ModeSortie_OBP-SNE"/>
        
 
    </phase>
    
    <!-- Variables globales -->
    <pattern id="variables">
        
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="jdv_ApproachSiteCode_OBP-SNE" value="'../jeuxDeValeurs/JDV_RouteofAdministration_CISIS.xml'"/>
        <let name="jdv_ModeNaissance_OBP-SNE" value="'../jeuxDeValeurs/JDV_ModeNaissance_CISIS.xml'"/>
        <let name="jdv_TypeInterventionVoieBasse_OBP-SNE" value="'../jeuxDeValeurs/JDV_TypeInterventionVoieBasse_CISIS.xml'"/>
        <let name="jdv_PresentationFoetale_OBP-SNE" value="'../jeuxDeValeurs/JDV_PresentationFoetale_CISIS.xml'"/>
        <let name="jdv_QuantiteLA_OBP-SNE" value="'../jeuxDeValeurs/JDV_QuantiteLA_CISIS.xml'"/>
        <let name="jdv_AspectLA_OBP-SNE" value="'../jeuxDeValeurs/JDV_AspectLA_CISIS.xml'"/>
        <let name="jdv_CirconstancesDeces_OBP-SNE" value="'../jeuxDeValeurs/JDV_CirconstancesDeces_CISIS.xml'"/>
        <!--<let name="jdv_GesteReanimationNN_OBP-SNE" value="'../jeuxDeValeurs/JDV_OBP_GesteReanimationNN_CISIS.xml'"/>-->
        <let name="jdv_OBP_Result-Evenement" value="'../jeuxDeValeurs/JDV_OBP_Result_Evenement_CISIS.xml'"/>
        <let name="jdv_ModeSortie_OBP-SNE" value="'../jeuxDeValeurs/JDV_ModeSortie_OBP_SNE_CISIS.xml'"/>
        
    </pattern>
</schema>
