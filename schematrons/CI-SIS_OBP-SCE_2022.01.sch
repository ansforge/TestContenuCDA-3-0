<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_OBP-SCE_2022.01.sch    
    ......................................................................................................................................................    
    Auteur : ANS
    ......................................................................................................................................................    
    Historique :
        17/10/2013 : Création
        19/06/2015 : Maj des include telecom20110728.sch -> telecom20150317.sch
        14/03/2018 : MAJ du pattern Variables
        20/11/2020 : Modification du nom du schématron JDV appelé (ancien JDV_routeOfAdministration_OBP.sch)
        10/09/2021 : Modification du nom du schématron
        13/09/2021 : Modification pour nouvelle version 2021.01
        15/04/2022:  Migration des terminologies et JDV en SNOMED-CT
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_OBP-SCE_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_OBP-SCE_2022.01.sch">
    <title>Vérification de la conformité au modèle OBP-SCE_2022.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!--Entete-->    
    <include href="include/specificationsVolets/OBP-SCE_2022.01/Entete/Entete_OBP-SCE.sch"/>
    
   <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
        
    <!-- JDV -->    
    <include href="include/jeuxDeValeurs/OBP-SCE_2022.01/JDV_LesionTraumatiqueObstetricale_OBP-SCE.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SCE_2022.01/JDV_TypeInfectionNN_OBP-SCE.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SCE_2022.01/JDV_ModeSortie_OBP-SCE.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SCE_2022.01/JDV_TypeAllaitementNN_OBP-SCE.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SCE_2022.01/JDV_StaticSCEprocedures_OBP-SCE.sch"/> 
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_OBP-SCE_2022.01">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        
        <!-- Activation Entete -->
        <active pattern="Entete_OBP-SCE"/>
        
        <!-- Activation JDV -->
        <active pattern="JDV_LesionTraumatiqueObstetricale_OBP-SCE"/>
        <active pattern="JDV_TypeInfectionNN_OBP-SCE"/>
        <active pattern="JDV_ModeSortie_OBP-SCE"/>
        <active pattern="JDV_TypeAllaitementNN_OBP-SCE"/>
        <active pattern="JDV_StaticSCEprocedures_OBP-SCE"/>        
        
    </phase>
     
    <!-- Variables globales -->
    <pattern id="variables">
        <let name="jdv_LesionTraumatiqueObstetricale_OBP-SCE" value="'../jeuxDeValeurs/JDV_OBP_LesionTraumatiqueObstetricale-CISIS.xml'"/>
        <let name="jdv_TypeInfectionNN_OBP-SCE" value="'../jeuxDeValeurs/JDV_OBP_TypeInfectionNN-CISIS.xml'"/>
        <let name="jdv_ModeSortie_OBP-SCE" value="'../jeuxDeValeurs/JDV_ModeSortie-OBP-SCE-CISIS.xml'"/>
        <let name="jdv_TypeAllaitementNN_OBP-SCE" value="'../jeuxDeValeurs/JDV_OBP_TypeAllaitementNN-CISIS.xml'"/>
        <let name="jdv_StaticSCEprocedures_OBP-SCE" value="'../jeuxDeValeurs/JDV_OBP_StaticSCEprocedures-CISIS.xml'"/>
        
    </pattern>
</schema>
