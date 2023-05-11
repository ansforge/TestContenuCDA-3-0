<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_CARD-F-PRC-TAP_2023.sch
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
    29/04/2022 : Nouvelle version 2022.01
    29/04/2022 : Migration des terminologies et JDV en SNOMED-CT
    02/01/2023 : Nouvelle version 2023.01 : Création d'un schématron différent pour chaqu'un des volets CARD-F-PRC
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CARD-F-PRC-TAP_2023.sch">
    <title>Rapport de conformité du document aux spécifications du volet Fiches Patient à risque en cardiologie (CARD-F-PRC-TAP_2022.01)</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>

    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!-- Entete spécifiques au volet -->
    <include href="include/specificationsVolets/CARD-F-PRC-TAP_2022.01/Entete/Entete_CARD-F-PRC-TAP.sch"/>
    
    <!--Entrées spécifiques au volet-->
    <include href="include/specificationsVolets/CARD-F-PRC-TAP_2022.01/entrees/E_AllergiesAndHypersensibilites_CARD-F-PRC-TAP.sch"/>
    <include href="include/specificationsVolets/CARD-F-PRC-TAP_2022.01/entrees/E_DM_CARD-F-PRC-TAP.sch"/>
    
    <!--JDVs spécifiques au volet-->
    <include href="include/jeuxDeValeurs/CARD-F-PRC-TAP_2022.01/JDV_UFCV_MotImpl_CARD-F-PRC-TAP.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-TAP_2022.01/JDV_UFCV_MotImplEndoC_CARD-F-PRC-TAP.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-TAP_2022.01/JDV_UFCV_MatImpl_CARD-F-PRC-TAP.sch"/>
    <include href="include/jeuxDeValeurs/CARD-F-PRC-TAP_2022.01/JDV_UFCV_NYHA_CARD-F-PRC-TAP.sch"/>
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->
   
    <phase id="CI-SIS_CARD-F-PRC-TAP_2023">
        <!-- Entrée -->
        <active pattern="E_AllergiesAndHypersensibilites_CARD-F-PRC-TAP"/>
        <active pattern="E_DM_CARD-F-PRC-TAP"/>
        
        <!-- JDV -->
        <active pattern="JDV_UFCV_MatImpl_CARD-F-PRC-TAP"/>
        <active pattern="JDV_UFCV_MotImplEndoC_CARD-F-PRC-TAP"/>
        <active pattern="JDV_UFCV_MotImpl_CARD-F-PRC-TAP"/>
        <active pattern="JDV_UFCV_NYHA_CARD-F-PRC-TAP"/>
    </phase>
    
    <pattern id="variables">
        
        <let name="jdv_UFCV_MotImpl_CARD-F-PRC-TAP" value="'../jeuxDeValeurs/JDV_UFCV_MotImpl-CISIS.xml'"/>
        <let name="jdv_UFCV_MotImplEndoC_CARD-F-PRC-TAP" value="'../jeuxDeValeurs/JDV_UFCV_MotImplEndoC-CISIS.xml'"/>
        <let name="jdv_UFCV_MatImpl_CARD-F-PRC-TAP" value="'../jeuxDeValeurs/JDV_UFCV_MatImpl-CISIS.xml'"/>
        <let name="jdv_UFCV_NYHA_CARD-F-PRC-TAP" value="'../jeuxDeValeurs/JDV_UFCV_NYHA-CISIS.xml'"/>
        
        <!-- présence des sections obligatoires -->        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">            
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.132'])=1"> 
                [CARD-F-PRC-TAP] Erreur de conformité au modèle : La section "FR-Problemes-actifs" (1.2.250.1.213.1.1.2.132) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.143'])=1"> 
                [CARD-F-PRC-TAP] Erreur de conformité au modèle : La section "FR-Traitements" (1.2.250.1.213.1.1.2.143) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.137'])=1"> 
                [CARD-F-PRC-TAP] Erreur de conformité au modèle : La section "FR-Allergies-et-hypersensibilites" (1.2.250.1.213.1.1.2.137) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.136'])=1"> 
                [CARD-F-PRC-TAP] Erreur de conformité au modèle : La section "FR-Historique-des-actes" (1.2.250.1.213.1.1.2.136) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.1'])=1"> 
                [CARD-F-PRC-TAP] Erreur de conformité au modèle : La section "FR-Dispositifs-medicaux" (1.2.250.1.213.1.1.2.1) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.107'])=1"> 
                [CARD-F-PRC-TAP] Erreur de conformité au modèle : La section "FR-Education-du-patient" (1.2.250.1.213.1.1.2.107) doit être présente.
            </assert>
        </rule>
    </pattern>

</schema>
