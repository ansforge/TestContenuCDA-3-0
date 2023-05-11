<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_OBP-SAP_2023.01.sch
    ANS   
    ......................................................................................................................................................    
    Historique :
        17/10/2013 : Création
        19/06/2015 : Maj des include telecom20110728.sch -> telecom20150317.sch
                     Modification du schematron codedListOfSurgeries20120718.sch -> codedListOfSurgeries20150319.sch
        12/10/2017 : Mise à niveau par rapport à la V2 du testContenuCDA
        14/03/2018 : MAJ du pattern Variables  
        10/09/2021 : Modification du nom du schématron
        13/09/2021 : Modification pour nouvelle version 2021.01
        25/01/2022 : Ajout du contrôle du JDV_ObservationEnfant_OBP-CISIS
        25/10/2022 : Version 2022.01
        11/05/2023 : Version 2023.01
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_OBP-SAP_2023.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_OBP-SAP_2023.01.sch">
    <title>Vérification de la conformité au modèle OBP-SAP_2023.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!--Entete-->    
    <include href="include/specificationsVolets/OBP-SAP_2023.01/Entete/Entete_OBP-SAP.sch"/>
    
    <!-- Sections -->    
    <include href="include/specificationsVolets/OBP-SAP_2023.01/Sections/S_activeProblem_OBP-SAP.sch"/>
    <include href="include/specificationsVolets/OBP-SAP_2023.01/Sections/S_birthOrganizer_OBP-SAP.sch"/>
    <include href="include/specificationsVolets/OBP-SAP_2023.01/Sections/S_pregnancyHistoryOrganizer_OBP-SAP.sch"/>
    
    <!-- JDV -->    
    <include href="include/jeuxDeValeurs/OBP-SAP_2023.01/JDV_AnomalieCroissance_OBP-SAP.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SAP_2023.01/JDV_AntecedentsObstetricaux_OBP-SAP.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SAP_2023.01/JDV_StatutNouveauNe_OBP-SAP.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SAP_2023.01/JDV_EtatPerinee_OBP-SAP.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SAP_2023.01/JDV_GroupeRhesus_OBP-SAP.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SAP_2023.01/JDV_IssueGrossesse_OBP-SAP.sch"/>
    <include href="include/jeuxDeValeurs/OBP-SAP_2023.01/JDV_ObservationEnfant_OBP-SAP.sch"/>    
    <include href="include/jeuxDeValeurs/OBP-SAP_2023.01/JDV_TranfertMutation_OBP-SAP.sch"/>    
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_OBP-SAP_2023.01">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        
        <!-- Activation Entete -->        
        <active pattern="Entete_OBP-SAP"/>
        
        <!-- Activation Sections -->        
        <active pattern="S_activeProblem_OBP-SAP"/>
        <active pattern="S_BirthOrganizer_OBP-SAP"/>
        <active pattern="S_pregnancyHistoryOrganizer_OBP-SAP"/>
        
        <!-- Activation JDV -->   
        <!-- 
        
        -->
        <active pattern="JDV_AnomalieCroissance_OBP-SAP"/>      
        <active pattern="JDV_AntecedentsObstetricaux_OBP-SAP"/>
        <active pattern="JDV_StatutNouveauNe_OBP-SAP"/>
        <active pattern="JDV_EtatPerinee_OBP-SAP"/>
        <active pattern="JDV_GroupeRhesus_OBP-SAP"/>
        <active pattern="JDV_IssueGrossesse_OBP-SAP"/>
        <active pattern="JDV_ObservationEnfant_OBP-SAP"/>           
        <active pattern="JDV_TranfertMutation_OBP-SAP"/>        
        
    </phase>
    
    <!-- Variables globales -->
    <pattern id="variables">
        
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="JDV_AnomalieCroissance_OBP-SAP" value="'../jeuxDeValeurs/JDV_OBP_AnomalieCroissance-CISIS.xml'"/>        
        <let name="JDV_AntecedentsObstetricaux_OBP-SAP" value="'../jeuxDeValeurs/JDV_AntecedentsObstetricaux_OBP-CISIS.xml'"/>
        <let name="JDV_StatutNouveauNe_OBP-SAP" value="'../jeuxDeValeurs/JDV_EtatNaissance-CISIS.xml'"/>
        <let name="JDV_EtatPerinee_OBP-SAP" value="'../jeuxDeValeurs/JDV_EtatPerinee-CISIS.xml'"/>
        <let name="JDV_GroupeRhesus_OBP-SAP" value="'../jeuxDeValeurs/JDV_GroupeRhesus-CISIS.xml'"/>
        <let name="JDV_IssueGrossesse_OBP-SAP" value="'../jeuxDeValeurs/JDV_IssueGrossesse-CISIS.xml'"/>
        <let name="JDV_ObservationEnfant_OBP-SAP" value="'../jeuxDeValeurs/JDV_ObservationEnfant_OBP-CISIS.xml'"/>  
        <let name="JDV_TranfertMutation_OBP-SAP" value="'../jeuxDeValeurs/JDV_TransfertMutation-CISIS.xml'"/>
        
        
    </pattern>
</schema>