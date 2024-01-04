<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_OBP-SEM_2023.01.sch    
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
        14/06/2023 : Nouvelle version 2023.01
        03/01/2024 : Version 2024.01
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_OBP-SEM_2024.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_OBP-SEM_2024.01.sch">
    <title>Vérification de la conformité au modèle OBP-SEM_2024.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!--Entete-->    
    <include href="include/specificationsVolets/OBP-SEM_2024.01/Entete/Entete_OBP-SEM.sch"/>
    
    <!--Sections-->  
    <include href="include/specificationsVolets/OBP-SEM_2024.01/Sections/S_procedureEntry_OBP-SEM.sch"/>
    <include href="include/specificationsVolets/OBP-SEM_2024.01/Sections/S_codedDetailedPhysicalExamination_OBP-SEM.sch"/>
   
   <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
        
    <!-- JDV --> 
     
    <!-- <include href="include/jeuxDeValeurs/OBP-SEM_2024.01/JDV_LesionTraumatiqueObstetricale_OBP-SEM.sch"/>-->
    <include href="include/jeuxDeValeurs/OBP-SEM_2024.01/JDV_ModeSortie_OBP-SEM.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SEM_2024.01/JDV_TypeAllaitementNN_OBP-SEM.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SEM_2024.01/JDV_StaticSEMprocedures_OBP.sch"/> 
    <include href="include/jeuxDeValeurs/OBP-SEM_2024.01/JDV_OBP_TestAudition.sch"/> 
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_OBP-SEM_2024.01">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        
        <!-- Activation Entete -->
        <active pattern="Entete_OBP-SEM"/>
        
        <!-- Activation Sections -->
        <active pattern="S_procedureEntry_OBP-SEM"/>
        <active pattern="S_CodedDetailedPhysicalExamination_OPB-SEM"/>
        
       
        
        <!-- Activation JDV -->
        <!--<active pattern="JDV_LesionTraumatiqueObstetricale_OBP-SEM" />-->
        <active pattern="JDV_ModeSortie_OBP-SEM"/>
        <active pattern="JDV_TypeAllaitementNN_OBP-SEM"/>
        <active pattern="JDV_StaticSEMprocedures_OBP"/>  
        <active pattern="JDV_OBP_TestAudition"/>  
        
    </phase>
     
    <!-- Variables globales -->
    <pattern id="variables">
        <!--  <let name="jdv_LesionTraumatiqueObstetricale_OBP-SEM" value="'../jeuxDeValeurs/JDV_OBP_LesionTraumatiqueObstetricale_CISIS.xml'"/>-->
        <let name="jdv_ModeSortie_OBP-SEM" value="'../jeuxDeValeurs/JDV_ModeSortie_OBP_SEM_CISIS.xml'"/>
        <let name="jdv_TypeAllaitementNN_OBP-SEM" value="'../jeuxDeValeurs/JDV_TypeAllaitementNouveauNe_CISIS.xml'"/>
        <let name="jdv_StaticSEMprocedures_OBP" value="'../jeuxDeValeurs/JDV_StaticSEMprocedures_CISIS.xml'"/>
        <let name="jdv_OBP_TestAudition" value="'../jeuxDeValeurs/JDV_OBP_TestAudition_CISIS.xml'"/>
    </pattern>
</schema>
