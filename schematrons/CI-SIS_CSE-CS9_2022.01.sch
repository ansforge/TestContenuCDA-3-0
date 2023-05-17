<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Schématron du CS9 : CI-SIS_CSE-CS9_2022.01.sch
    ANS
    Vérification de la conformité au Certificats de Santé de l'Enfant - CSE-CS9_2022.01 du CI-SIS.
    ......................................................................................................................................................  
    Historique :
        27/05/2011 : Création
        31/05/2011 : Externalisation du plus grand nombre de patterns, contôle de authorSpecialty, 2 phases : "latotale" et "minimale"
        15/06/2011 : Organisation des sous-répertoires de composants
        24/06/2011 : Adaptation du module initial CI-SIS_StructurationCommuneCDAr2.sch en CI-SIS_CertificatSante.sch pour le volet
                     "Certificats de Santé de l'Enfant" (CS8, CS9 et CS24).
        06/03/2012 : Adaptation à l'utilisation de SNOMED 3.5 à la place de SNOMED CT
        08/10/2012 : CI-SIS 1.3 => retrait des include assignedAuthor, confidentialityCode et custodianOrganization. 
                     Maj des include assignedEntity (addr & telecom optionnels) et addr (contrôle structure des adresses)
        22/05/2015 : Utilisation du schématron CSENeurologicEnt20130326.sch (dernière version)                 
                     Inclusion du schématron CSEteethEnt20120306.sch 
                     Inclusion du schématron teethPhysicalExam20110627.sch
                     Mise à jour du schématron CSEgeneralAppEnt20120306.sch -> CSEgeneralAppEnt20150522.sch
                     Maj des include telecom20110728.sch                    -> telecom20150317.sch
        23/08/2017 : Suppression du schématron qui teste la psychomotricité (CSEPsychoMotEnt20110725.sch)
        14/03/2018 : MAJ du pattern variables
        09/06/2020 : Ajout du contrôle de présence des sections obligatoires
        26/01/2021 : Mise en conformité dernière version 2021.01         
        23/02/2021 : Ajout des sous-répertoires pour les schématrons specificationsVolets/CSE/Entrées et specificationsVolets/CSE/Sections
                     et jeuxDeValeurs/CSE-CS8/
                     Modification des noms des JDV.
        06/04/2022 : Modification des schématrons d'entrées afin de remplacer les codes en dur SNOMED 3.5 par les codes CIM-10
    ......................................................................................................................................................                           
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_CSE-CS9_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CSE-CS9_2022.01.sch">
    <title>Vérification de conformité du document aux spécifications du modèle CSE-CS9_2022.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/> 
    
    <!-- Entete -->    
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entete/Entete_CSE-CS9.sch"/>
    
    <!-- Sections spécifiques au volet -->    
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Sections/S_codedPhysicalExam_CSE-CS9.sch"/>
    
    <!-- Entrées spécifiques au volet -->
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_abdomen_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_codedSocialHistory_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_ears_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_eatingSleeping_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_endocrine_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_eyes_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_generalApp_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_genitalia_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_heart_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_historyOfPastIllness_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_integumentary_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_lymphatic_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_musculo_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_neurologic_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_respiratory_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_teeth_CSE-CS9.sch"/>
    <include href="include/specificationsVolets/CSE-CS9_2022.01/Entrees/E_developpementPsychomoteur_CSE-CS9.sch"/>
    
    <!-- JDV -->
    <include href="include/jeuxDeValeurs/CSE-CS9_2022.01/JDV_Activite-CISIS.sch"/>    
    <include href="include/jeuxDeValeurs/CSE-CS9_2022.01/JDV_CauseAccidentDom-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS9_2022.01/JDV_Profession-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS9_2022.01/JDV_TypeGarde-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS9_2022.01/JDV_VaccinCSE9-CISIS.sch"/>
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <phase id="CI-SIS_CSE-CS9_2022.01">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        
        <!--Entete-->        
        <active pattern="Entete_CSE-CS9"/>
        
        <!-- Sections spécifiques -->        
        <active pattern="S_codedPhysicalExam_CSE-CS9"/>
        
        <!-- Entrées spécifiques -->        
        <active pattern="E_abdomen_CSE-CS9"/>
        <active pattern="E_codedSocialHistory_CSE-CS9"/>
        <active pattern="E_ears_CSE-CS9"/>
        <active pattern="E_eatingSleeping_CSE-CS9"/>
        <active pattern="E_endocrine_CSE-CS9"/>
        <active pattern="E_eyes_CSE-CS9"/>
        <active pattern="E_generalApp_CSE-CS9"/>
        <active pattern="E_genitalia_CSE-CS9"/>
        <active pattern="E_heart_CSE-CS9"/>
        <active pattern="E_historyOfPastIllness_CSE-CS9"/>
        <active pattern="E_integumentary_CSE-CS9"/>
        <active pattern="E_lymphatic_CSE-CS9"/>
        <active pattern="E_musculo_CSE-CS9"/>
        <active pattern="E_neurologic_CSE-CS9"/>
        <active pattern="E_respiratory_CSE-CS9"/>     
        <active pattern="E_teeth_CSE-CS9"/>      
        <active pattern="E_developpementPsychomoteur_CSE-CS9"/>      
        
        <!-- JDV -->
        <active pattern="JDV_Activite-CISIS"/>
        <active pattern="JDV_CauseAccidentDom-CISIS"/>
        <active pattern="JDV_Profession-CISIS"/>        
        <active pattern="JDV_TypeGarde-CISIS"/>
        <active pattern="JDV_VaccinCSE9-CISIS"/>
    </phase>
    
    <!-- Variables globales -->
    
    <pattern id="variables">
        
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="JDV_Activite-CISIS" value="'../jeuxDeValeurs/JDV_Activite-CISIS.xml'"/>
        <let name="JDV_CauseAccidentDom-CISIS" value="'../jeuxDeValeurs/JDV_CauseAccidentDom-CISIS.xml'"/>
        <let name="JDV_Profession-CISIS" value="'../jeuxDeValeurs/JDV_Profession-CISIS.xml'"/>         
        <let name="JDV_TypeGarde-CISIS" value="'../jeuxDeValeurs/JDV_TypeGarde-CISIS.xml'"/> 
        <let name="JDV_VaccinCSE9-CISIS" value="'../jeuxDeValeurs/JDV_VaccinCSE9-CISIS.xml'"/> 
        
        <rule context='cda:ClinicalDocument/cda:component/cda:structuredBody'>
            
            <!-- Présence obligatoire de la section Habitus, Mode de vie (1.3.6.1.4.1.19376.1.5.3.1.3.16.1) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.16.1"]'>
                [CI-SIS_CSE-CS9_2022.01.sch] Erreur de conformité : 
                La section Habitus, Mode de vie (1.3.6.1.4.1.19376.1.5.3.1.3.16.1) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Antécédents médicaux (1.3.6.1.4.1.19376.1.5.3.1.3.8) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.8"]'>
                [CI-SIS_CSE-CS9_2022.01.sch] Erreur de conformité : 
                La section Antécédents médicaux (1.3.6.1.4.1.19376.1.5.3.1.3.8) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Examens physiques (1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1"]'>
                [CI-SIS_CSE-CS9_2022.01.sch] Erreur de conformité : 
                La section Examens physiques (1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Evaluation du statut fonctionnel de l'enfant (1.3.6.1.4.1.19376.1.7.3.1.1.13.3) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.7.3.1.1.13.3"]'>
                [CI-SIS_CSE-CS9_2022.01.sch] Erreur de conformité : 
                La section Evaluation du statut fonctionnel de l'enfant (1.3.6.1.4.1.19376.1.7.3.1.1.13.3) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Vaccinations (1.3.6.1.4.1.19376.1.5.3.1.3.23) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.23"]'>
                [CI-SIS_CSE-CS9_2022.01.sch] Erreur de conformité : 
                La section Vaccinations (1.3.6.1.4.1.19376.1.5.3.1.3.23) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Évaluation et plan (non codé) (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.5) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.13.2.5"]'>
                [CI-SIS_CSE-CS9_2022.01.sch] Erreur de conformité : 
                La section Évaluation et plan (non codé) (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.5) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Plan de soins (1.3.6.1.4.1.19376.1.5.3.1.3.36) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.36"]'>
                [CI-SIS_CSE-CS9_2022.01.sch] Erreur de conformité : 
                La section Plan de soins (1.3.6.1.4.1.19376.1.5.3.1.3.36) est obligatoire.  
            </assert>
            
        </rule>
        
    </pattern>
</schema>
