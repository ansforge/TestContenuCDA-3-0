<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_F-PRC_1.4.sch
    Vérification de la conformité sémantique au volet Patients à Risques de Cardiologie du CI-SIS.
     
    Historique :    
    24/06/2011 : Adaptation du module initial CI-SIS_StructurationCommuneCDAr2.sch pour le volet "Certificats de Santé de l'Enfant" (composant CS8) du CI-SIS de l'ASIP.
    01/08/2011 : Ajout des spécificités et contraintes du volet du CI-SIS "Patients à Risques de Cardiologie"
    08/10/2012 : CI-SIS 1.3 => retrait des include assignedAuthor, confidentialityCode et custodianOrganization. 
                     Maj des include assignedEntity (addr & telecom optionnels) et addr (contrôle structure des adresses)       
                     Prise en compte de la bonne version de l'include codedVitalSigns
                     Suppression des accents du nom du fichier UFCV_DispositifMedicalImplanteOrg20110826.sch
                     Actualisation nom de fichiers include problemEntry, concernentry, procedureentry 
    19/06/2015 : Maj des include telecom20110728.sch                        -> telecom20150317.sch
    14/03/2018 : MAJ du pattern Variables
    22/02/2021 : Renommage des schématrons JDV
    07/02/2022 : Mise à jour des appels au schematrons spécifiques
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_F-PRC_2022.sch">
    <title>Rapport de conformité du document aux spécifications du volet Fiches Patient à risque en cardiologie (F-PRC_2022.01)</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>

    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!--Patterns spécifiques au volet-->
    <include href="include/specificationsVolets/F-PRC_2022.01/entrees/E_AllergiesAndIntolerances_F-PRC.sch"/>
    <include href="include/specificationsVolets/F-PRC_2022.01/entrees/E_DispositifMedicalImplanteOrg_F-PRC.sch"/>
    <include href="include/specificationsVolets/F-PRC_2022.01/entrees/E_DM-PSC.sch"/>
    <include href="include/specificationsVolets/F-PRC_2022.01/entrees/E_DM-DCI.sch"/>
    <include href="include/specificationsVolets/F-PRC_2022.01/entrees/E_DM-PPV.sch"/>
    <include href="include/specificationsVolets/F-PRC_2022.01/entrees/E_DM-TAP.sch"/>
    
    <include href="include/jeuxDeValeurs/F-PRC_2022.01/JDV_UFCV_MatImpl_F-PRC.sch"/>
    <include href="include/jeuxDeValeurs/F-PRC_2022.01/JDV_UFCV_ProtValv_F-PRC.sch"/>

    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->
   
    <phase id="CI-SIS_F-PRC_2022">
        
        <active pattern="E_AllergiesAndIntolerances_F-PRC"/>
        <active pattern="E_DispositifMedicalImplanteOrg_F-PRC"/>
        <active pattern="E_DM-PSC"/>
        <active pattern="E_DM-DCI"/>
        <active pattern="E_DM-PPV"/>
        <active pattern="E_DM-TAP"/>
        
        <active pattern="JDV_UFCV_MatImpl_F-PRC"/>
        <active pattern="JDV_UFCV_ProtValv_F-PRC"/>
        
    </phase>
    
    <pattern id="variables">
        
        <let name="jdv_UFCV_MatImpl" value="'../jeuxDeValeurs/JDV_UFCV_MatImpl-CISIS.xml'"/>
        <let name="jdv_UFCV_ProtValv" value="'../jeuxDeValeurs/JDV_UFCV_ProtValv-CISIS.xml'"/>
    </pattern>

</schema>
