<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_CARD-F-PRC-AVK_2022.01.sch
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
    28/04/2022 : Nouvelle version 2022.01
    28/04/2022 : Migration des terminologies et JDV en SNOMED-CT
    02/01/2023 : Nouvelle version 2023.01 : Création d'un schématron différent pour chaqu'un des volets CARD-F-PRC
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CARD-F-PRC-AVK_2022.01.sch">
    <title>Rapport de conformité du document aux spécifications du volet Fiches Patient à risque en cardiologie (CARD-F-PRC-AVK_2022.01)</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>

    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/> 
    
    <!--Patterns d'entete spécifiques au volet-->
    <include href="include/specificationsVolets/CARD-F-PRC-AVK_2022.01/Entete/Entete_CARD-F-PRC-AVK.sch"/>
    
    <!--Patterns des entrées spécifiques au volet-->
    <include href="include/specificationsVolets/CARD-F-PRC-AVK_2022.01/Entrees/E_AllergiesEtHypersensibilites_CARD-F-PRC-AVK.sch"/>
    <include href="include/specificationsVolets/CARD-F-PRC-AVK_2022.01/Entrees/E_TPINR_CARD-F-PRC-AVK.sch"/>
    <include href="include/specificationsVolets/CARD-F-PRC-AVK_2022.01/Entrees/E_CibleINR_CARD-F-PRC-AVK.sch"/>
    
    <!--Patterns des JDVs spécifiques au volet-->
    <include href="include/jeuxDeValeurs/CARD-F-PRC-AVK_2022.01/JDV_UFCV_EffetINR-CISIS.sch"/>
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->
   
    <phase id="CI-SIS_F-PRC-AVK_2022.01">
        <!-- Entete-->
        <active pattern="Entete_CARD-F-PRC-AVK"/>
        
        <!-- Entrées -->
        <active pattern="E_AllergiesEtHypersensibilites_CARD-F-PRC-AVK"/>
        <active pattern="E_TPINR_CARD-F-PRC-AVK"/>
        <active pattern="E_CibleINR_CARD-F-PRC-AVK"/>
        
        <!-- JDVs -->
        <active pattern="JDV_UFCV_EffetINR-CISIS"/>
    </phase>
    
    <pattern id="variables">
        <let name="jdv_UFCV_EffetINR-CISIS" value="'../jeuxDeValeurs/JDV_UFCV_EffetINR-CISIS.xml'"/>
        
        <!-- présence des sections obligatoires -->        
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">            
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.132'])=1"> 
                [CARD-F-PRC-AVK] Erreur de conformité au modèle : La section "FR-Problemes-actifs" (1.2.250.1.213.1.1.2.132) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.143'])=1"> 
                [CARD-F-PRC-AVK] Erreur de conformité au modèle : La section "FR-Traitements" (1.2.250.1.213.1.1.2.143) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.151'])=1"> 
                [CARD-F-PRC-AVK] Erreur de conformité au modèle : La section "FR-Resultats-examens" (1.2.250.1.213.1.1.2.151) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.137'])=1"> 
                [CARD-F-PRC-AVK] Erreur de conformité au modèle : La section "FR-Allergies-et-hypersensibilites" (1.2.250.1.213.1.1.2.137) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.158'])=1"> 
                [CARD-F-PRC-AVK] Erreur de conformité au modèle : La section "FR-Plan-de-soins" (1.2.250.1.213.1.1.2.158) doit être présente.
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.107'])=1"> 
                [CARD-F-PRC-AVK] Erreur de conformité au modèle : La section "FR-Education-du-patient" (1.2.250.1.213.1.1.2.107) doit être présente.
            </assert>
        </rule>
    </pattern>

</schema>
