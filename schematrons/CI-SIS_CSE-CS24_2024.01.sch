<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Schématron du CSE-CS24 : CI-SIS_CSE-CS24_2024.01.sch
    ANS
    Vérification de la conformité au Certificats de Santé de l'Enfant - CS24 du CI-SIS.
    ......................................................................................................................................................
    Historique :
        27/05/2011 : FMY : Création
        31/05/2011 : FMY : Externalisation du plus grand nombre de patterns, contôle de authorSpecialty, 2 phases : "latotale" et "minimale"
        15/06/2011 : Organisation des sous-répertoires de composants
        24/06/2011 : CRI : Adaptation du module initial CI-SIS_StructurationCommuneCDAr2.sch en CI-SIS_CertificatSante.sch pour le volet
                           "Certificats de Santé de l'Enfant" (CS8, CS9 et CS24).
        08/10/2012 : FMY : CI-SIS 1.3 => retrait des include assignedAuthor, confidentialityCode et custodianOrganization. 
                           Maj des include assignedEntity (addr & telecom optionnels) et addr (contrôle structure des adresses)
        22/05/2015 : JDS : Utilisation du schématron CSENeurologicEnt20130326.sch (dernière version)         
                           Mise à jour du schématron CSEgeneralAppEnt20120306.sch -> CSEgeneralAppEnt20150522.sch
                           Maj des include telecom20110728.sch                    -> telecom20150317.sch
        14/03/2018 : NMA : MAJ du pattern variables
        09/06/2020 : APE : Ajout du contrôle de présence des sections obligatoires  
        26/01/2021 : ANS : Mise en conformité dernière version 2021.01     
        23/02/2021 : ANS : Ajout des sous-répertoires pour les schématrons specificationsVolets/CSE/Entrées et specificationsVolets/CSE/Sections   
                     et jeuxDeValeurs/CSE-CS8/
                     Modification des noms des JDV. 
        06/04/2022 : Modification des schématrons d'entrées afin de remplacer les codes en dur SNOMED 3.5 par les codes CIM-10
        28/08/2023 : Migration des terminologies et JDV
        04/12/2023 : Nouvelle version 2024.01
    ......................................................................................................................................................               
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_CSE-CS24_2024.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CSE-CS24_2024.01.sch">
    <title>Vérification de conformité du document aux spécifications du modèle CSE-CS24_2024.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!-- Entete -->    
    <include href="include/specificationsVolets/CSE-CS24_2024.01/Entete/Entete_CSE-CS24.sch"/>
    
    <!-- Sections spécifiques au volet -->    
    <include href="../schematrons/include/specificationsVolets/CSE-CS24_2024.01/Sections/S_codedPhysicalExam_CSE-CS24.sch"/>
    
    <!--= Entrées spécifiques au volet -->    
    <include href="include/specificationsVolets/CSE-CS24_2024.01/Entrees/E_codedSocialHistory_CSE-CS24.sch"/>
    <include href="include/specificationsVolets/CSE-CS24_2024.01/Entrees/E_historyOfPastIllness_CSE-CS24.sch"/>
    <include href="include/specificationsVolets/CSE-CS24_2024.01/Entrees/E_developpementPsychomoteur_CSE-CS24.sch"/>
    
    <!-- JDV -->    
    <include href="include/jeuxDeValeurs/CSE-CS24_2024.01/JDV_Activite-CISIS.sch"/>    
    <include href="include/jeuxDeValeurs/CSE-CS24_2024.01/JDV_CauseAccidentDom-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS24_2024.01/JDV_Profession-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS24_2024.01/JDV_TypeGarde-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS24_2024.01/JDV_VaccinCSE24-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS24_2024.01/JDV_AntecedentsCSE24-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS24_2024.01/JDV_ReperageTroubleNeurodeveloppement-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS24_2024.01/JDV_Rencontre_CS9_CS24-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS24_2024.01/JDV_EnfantExposeAuxEcrans_CS24-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS24_2024.01/JDV_DeveloppementPsychomoteur_CS24-CISIS.sch"/>
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <phase id="CI-SIS_CSE-CS24_2024.01">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        
        <!-- Entete -->        
        <active pattern="Entete_CSE-CS24"/>
        
        <!-- Sections spécifiques -->        
        <active pattern="S_codedPhysicalExam_CSE-CS24"/>
        
        <!-- Entrées spécifiques -->        
        <active pattern="E_codedSocialHistory_CSE-CS24"/>
        <active pattern="E_historyOfPastIllness_CSE-CS24"/>
        <active pattern="E_developpementPsychomoteur_CSE-CS24"/>
        
        <!-- JDV -->        
        <active pattern="JDV_Activite-CISIS"/>
        <active pattern="JDV_CauseAccidentDom-CISIS"/>
        <active pattern="JDV_Profession-CISIS"/>        
        <active pattern="JDV_TypeGarde-CISIS"/>
        <active pattern="JDV_VaccinCSE24-CISIS"/>
        <active pattern="JDV_AntecedentsCSE24-CISIS"/>
        <active pattern="JDV_ReperageTroubleNeurodeveloppement_CISIS"/>
        <active pattern="JDV_Rencontre_CS9_CS24_CISIS"/>
        <active pattern="JDV_EnfantExposeAuxEcrans_CS24_CISIS"/>
        <active pattern="JDV_DeveloppementPsychomoteur_CS24_CISIS"/>        
        
    </phase>
    
    <!-- Variables globales -->
    
    <pattern id="variables">
        
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="JDV_Activite-CISIS" value="'../jeuxDeValeurs/JDV_Activite_CISIS.xml'"/>
        <let name="JDV_CauseAccidentDom-CISIS" value="'../jeuxDeValeurs/JDV_CauseAccidentDom_CISIS.xml'"/>
        <let name="JDV_Profession-CISIS" value="'../jeuxDeValeurs/JDV_Profession_CISIS.xml'"/>         
        <let name="JDV_TypeGarde-CISIS" value="'../jeuxDeValeurs/JDV_TypeGarde_CISIS.xml'"/>
        <let name="JDV_VaccinCSE24-CISIS" value="'../jeuxDeValeurs/JDV_VaccinCSE24_CISIS.xml'"/>
        <let name="JDV_AntecedentsCSE24-CISIS" value="'../jeuxDeValeurs/JDV_AntecedentsCSE24_CISIS.xml'"/> 
        <let name="JDV_ReperageTroubleNeurodeveloppement_CISIS" value="'../jeuxDeValeurs/JDV_ReperageTroubleNeurodeveloppement_CISIS.xml'"/> 
        <let name="JDV_Rencontre_CS9_CS24_CISIS" value="'../jeuxDeValeurs/JDV_Rencontre_CS9_CS24_CISIS.xml'"/> 
        <let name="JDV_EnfantExposeAuxEcrans_CS24_CISIS" value="'../jeuxDeValeurs/JDV_EnfantExposeAuxEcrans_CS24_CISIS.xml'"/> 
        <let name="JDV_DeveloppementPsychomoteur_CS24_CISIS" value="'../jeuxDeValeurs/JDV_DeveloppementPsychomoteur_CS24_CISIS.xml'"/> 
        
        
                
        <rule context='cda:ClinicalDocument/cda:component/cda:structuredBody'>
            
            <!-- Présence obligatoire de la section FR-Habitus-mode-de-vie (1.3.6.1.4.1.19376.1.5.3.1.3.16.1) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.16.1"]'>
                [CI-SIS_CSE-CS24_2024.01.sch] Erreur de conformité : La section FR-Habitus-mode-de-vie (1.3.6.1.4.1.19376.1.5.3.1.3.16.1) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section FR-Antecedents-medicaux (1.3.6.1.4.1.19376.1.5.3.1.3.8) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.8"]'>
                [CI-SIS_CSE-CS24_2024.01.sch] Erreur de conformité : La section FR-Antecedents-medicaux (1.3.6.1.4.1.19376.1.5.3.1.3.8) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section FR-Signes-vitaux (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2"]'>
                [CI-SIS_CSE-CS24_2024.01.sch] Erreur de conformité : La section FR-Signes-vitaux (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section FR-Developpement-psychomoteur (1.3.6.1.4.1.19376.1.7.3.1.1.13.4) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.7.3.1.1.13.4"]'>
                [CI-SIS_CSE-CS24_2024.01.sch] Erreur de conformité : La section FR-Developpement-psychomoteur (1.3.6.1.4.1.19376.1.7.3.1.1.13.4) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section FR-Allergies-et-hypersensibilites (1.3.6.1.4.1.19376.1.5.3.1.3.13) -->
            <assert test='count(cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.13"])&lt;=1'>
                [CI-SIS_CSE-CS24_2024.01.sch] Erreur de conformité : La section FR-Allergies-et-hypersensibilites (1.3.6.1.4.1.19376.1.5.3.1.3.13) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section FR-Vaccinations (1.3.6.1.4.1.19376.1.5.3.1.3.23) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.23"]'>
                [CI-SIS_CSE-CS24_2024.01.sch] Erreur de conformité : La section FR-Vaccinations (1.3.6.1.4.1.19376.1.5.3.1.3.23) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section FR-Plan-de-soins (1.3.6.1.4.1.19376.1.5.3.1.3.36) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.36"]'>
                [CI-SIS_CSE-CS24_2024.01.sch] Erreur de conformité : La section FR-Plan-de-soins (1.3.6.1.4.1.19376.1.5.3.1.3.36) est obligatoire.  
            </assert>
            
        </rule>
        
    </pattern>
</schema>
