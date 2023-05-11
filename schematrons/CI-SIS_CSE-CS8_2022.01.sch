<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Schématron du CS8 : CI-SIS_CSE-CS8_2022.01.sch
    ANS
    Vérification de la conformité au Certificats de Santé de l'Enfant - CSE-CS8_2022.01 du CI-SIS.   
    ......................................................................................................................................................
    Historique :
        24/06/2011 : Adaptation du module initial CI-SIS_StructurationCommuneCDAr2.sch pour le volet "Certificats de Santé de l'Enfant" (composant CS8) du CI-SIS de l'ASIP
        06/03/2012 : Supression des références à SNOMED CT
        19/04/2013 : Adaptation modifications vocabulaires et intégration des fichiers inclus
        27/05/2015 : Ajout du schématron sections/abdomenPhysicalExam20110627.sch
                     Mise à jour du schématron CSEgeneralAppEnt20120306.sch -> CSEgeneralAppEnt20150522.sch
                     Maj des include telecom20110728.sch                        -> telecom20150317.sch
        10/10/2017 : Mise à jour par rapport au testContenuCDA V2
        23/10/2017 : Correction des schématrons codedSocialHistory et immunization
        14/03/2018 : MAJ du pattern variables
        14/02/2018 : MAJ des contrôles du JDV Activité professionnelle
        09/06/2020 : Ajout du contrôle de présence des sections obligatoires
        26/01/2021 : Mise en conformité dernière version 2022.01   
        24/02/2021 : Ajout des sous-répertoires pour les schématrons specificationsVolets/CSE-CS8/Entrées et specificationsVolets/CSE-CS8/Sections
                     et jeuxDeValeurs/CSE-CS8/
                     Modification des noms des JDV.
        06/04/2022 : Modification des schématrons d'entrées afin de remplacer les codes en dur SNOMED 3.5 par les codes CIM-10
                     Modification des schématrons d'entrées afin d'ajouter le controle sur la présence de l'enryRelationship FR-Certitude (1.2.250.1.213.1.1.3.171)
                     Ajout de schématron de JDV_condition-ver-status-CISIS.sch
                     Ajout de schématron de JDV_MotifHospitalisationCSE-CISIS.sch
                     Ajout de schématron de JDV_Traite-NonTraite-CI-SIS.sch
                     Ajout de schématron de JDV_SocialHistoryCodes-CISIS.sch
                     Modification de schématron de JDV_AntecedentsObstetricaux-CISIS.sch
                     
                     
                     
    ......................................................................................................................................................           .
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_CSE-CS8_2022.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CSE-CS8_2022.01.sch">
    <title>Vérification de conformité du document aux spécifications du modèle CSE-CS8_2022.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>   
    
    <!-- Entete -->
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entete/Entete_CSE-CS8.sch"/>
    
    <!-- Sections spécifiques au volet -->
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Sections/S_codedPhysicalExam-CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Sections/S_laborAndDelivery_CSE-CS8.sch"/>
    
    <!-- Entrées spécifiques au volet -->
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_abdomen_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_codedAntenatalTestingAndSurveillance_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_codedSocialHistory_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_ears_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_generalApp_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_genitalia_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_heart_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_musculo_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_neurologic_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_pregnancyHistory_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_rechHbs_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_teeth_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_acte_CSE-CS8.sch"/>
    <include href="include/specificationsVolets/CSE-CS8_2022.01/Entrees/E_decesEnfant_CSE-CS8.sch"/>
    
    <!-- JDV -->
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_Activite-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_AntecedentsObstetricaux-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_DateCons-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_EvenementsAccouchement-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_NiveauEtude-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_Profession-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_TypePres-CISIS.sch"/>  
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_CouvertureSociale-CISIS.sch"/>  
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_RechAgHbS-CISIS.sch"/>  
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_ModeDebutTravail-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_TypeAnalgesie-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_MethodeAccouchement-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_CauseCesarienne-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_TypeService-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_VaccinCSE8-CISIS.sch"/><!--
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_SocialHistoryCodes-CISIS.sch"/>-->
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_condition-ver-status-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_Traite-NonTraite-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/CSE-CS8_2022.01/JDV_MotifHospitalisationCSE-CISIS.sch"/>
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_CSE-CS8_2022.01">
        <active pattern="variables"/>
        
        <!-- Entete -->
        <active pattern="Entete_CSE-CS8"/>
        
        <!-- Section spécifique -->        
        <active pattern="S_codedPhysicalExam-CSE-CS8"/>
        <active pattern="S_laborAndDelivery_CSE-CS8"/>
        
        <!-- Entrées spécifiques -->
        <active pattern="E_abdomen_CSE-CS8"/>
        <active pattern="E_codedAntenatalTestingAndSurveillance_CSE-CS8"/>
        <active pattern="E_codedSocialHistory_CSE-CS8"/>
        <active pattern="E_ears_CSE-CS8"/>
        <active pattern="E_generalApp_CSE-CS8"/>
        <active pattern="E_genitalia_CSE-CS8"/>
        <active pattern="E_heart_CSE-CS8"/>
        <active pattern="E_musculo_CSE-CS8"/>
        <active pattern="E_neurologic_CSE-CS8"/>
        <active pattern="E_pregnancyHistory_CSE-CS8"/>
        <active pattern="E_rechHbs_CSE-CS8"/>
        <active pattern="E_teeth_CSE-CS8"/>
        <active pattern="E_acte_CSE-CS8"/>
        <active pattern="E_decesEnfant_CSE-CS8"/>
        <active pattern="JDV_condition-ver-status-CISIS"/>
        
        <!-- JDV -->
        <active pattern="JDV_Activite-CISIS"/> 
        <active pattern="JDV_AntecedentsObstetricaux-CISIS"/>
        <active pattern="JDV_DateCons-CISIS"/>
        <active pattern="JDV_EvenementsAccouchement-CISIS"/>
        <active pattern="JDV_NiveauEtude-CISIS"/>
        <active pattern="JDV_Profession-CISIS"/>
        <active pattern="JDV_TypePres-CISIS"/>
        <active pattern="JDV_CouvertureSociale-CISIS"/>
        <active pattern="JDV_RechAgHbS-CISIS"/>
        <active pattern="JDV_ModeDebutTravail-CISIS"/>
        <active pattern="JDV_TypeAnalgesie-CISIS"/>
        <active pattern="JDV_MethodeAccouchement-CISIS"/>
        <active pattern="JDV_CauseCesarienne-CISIS"/>
        <active pattern="JDV_TypeService-CISIS"/>
        <active pattern="JDV_VaccinCSE8-CISIS"/><!--
        <active pattern="JDV_SocialHistoryCodes-CISIS"/>-->
        <active pattern="JDV_condition-ver-status-CISIS"/>
        <active pattern="JDV_MotifHospitalisationCSE-CISIS"/>
        <active pattern="JDV_Traite-NonTraite-CISIS"/>
        
    </phase>
    
    <!-- Variables globales --> 
    
    <pattern id="variables">
        
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="JDV_Activite-CISIS" value="'../jeuxDeValeurs/JDV_Activite-CISIS.xml'"/>
        <let name="JDV_AntecedentsObstetricaux-CISIS" value="'../jeuxDeValeurs/JDV_AntecedentsObstetricaux-CISIS.xml'"/>
        <let name="JDV_DateCons-CISIS" value="'../jeuxDeValeurs/JDV_DateCons-CISIS.xml'"/>
        <let name="JDV_EvenementsAccouchement-CISIS" value="'../jeuxDeValeurs/JDV_EvenementsAccouchement-CISIS.xml'"/>
        <let name="JDV_NiveauEtude-CISIS" value="'../jeuxDeValeurs/JDV_NiveauEtude-CISIS.xml'"/> 
        <let name="JDV_Profession-CISIS" value="'../jeuxDeValeurs/JDV_Profession-CISIS.xml'"/> 
        <let name="JDV_TypePres-CISIS" value="'../jeuxDeValeurs/JDV_TypePres-CISIS.xml'"/>
        <let name="JDV_CouvertureSociale-CISIS" value="'../jeuxDeValeurs/JDV_CouvertureSociale-CISIS.xml'"/>
        <let name="JDV_RechAgHbS-CISIS" value="'../jeuxDeValeurs/JDV_RechAgHbS-CISIS.xml'"/>
        <let name="JDV_ModeDebutTravail-CISIS" value="'../jeuxDeValeurs/JDV_ModeDebutTravail-CISIS.xml'"/>
        <let name="JDV_TypeAnalgesie-CISIS" value="'../jeuxDeValeurs/JDV_TypeAnalgesie-CISIS.xml'"/>
        <let name="JDV_MethodeAccouchement-CISIS" value="'../jeuxDeValeurs/JDV_MethodeAccouchement-CISIS.xml'"/>
        <let name="JDV_CauseCesarienne-CISIS" value="'../jeuxDeValeurs/JDV_CauseCesarienne-CISIS.xml'"/>
        <let name="JDV_TypeService-CISIS" value="'../jeuxDeValeurs/JDV_TypeService-CISIS.xml'"/>
        <let name="JDV_VaccinCSE8-CISIS" value="'../jeuxDeValeurs/JDV_VaccinCSE8-CISIS.xml'"/>
        <let name="JDV_SocialHistoryCodes-CISIS" value="'../jeuxDeValeurs/JDV_SocialHistoryCodes-CISIS.xml'"/>
        <let name="JDV_condition-ver-status-CISIS" value="'../jeuxDeValeurs/JDV_HL7_condition-ver-status-CISIS.xml'"/>
        <let name="JDV_Traite-NonTraite-CISIS" value="'../jeuxDeValeurs/JDV_Traite-NonTraite-CISIS.xml'"/>
        <let name="JDV_MotifHospitalisationCSE-CISIS" value="'../jeuxDeValeurs/JDV_MotifHospitalisationCSE-CISIS.xml'"/>
        <rule context="cda:ClinicalDocument">
            <assert test="./cda:templateId[@root='1.2.250.1.213.1.1.1.5.1']"> 
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité :
                L'élément ClinicalDocument/templateId doit être présent avec @root="1.2.250.1.213.1.1.1.5.1".
            </assert>
            <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.7.3.1.1.13.1']"> 
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité : 
                Le template parent "QRPH Health birth summary" (1.3.6.1.4.1.19376.1.7.3.1.1.13.1) doit être présent.
            </assert>
            <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.5']"> 
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité : 
                Le template parent "Certificat de Santé de l'Enfant" (1.2.250.1.213.1.1.1.5) doit être présent.
            </assert>
            
            <assert test="./cda:code[@code='CERT_DECL' and @codeSystem='1.2.250.1.213.1.1.4.12']"> 
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité : 
                L'élément code doit avoir @code ="CERT_DECL" et @codeSystem = "1.2.250.1.213.1.1.4.12"/>.
            </assert>
            
        </rule>
        
        
        
        <rule context='cda:ClinicalDocument/cda:component/cda:structuredBody'>
            
            <!-- Présence obligatoire de la section Habitus, Mode de vie (1.3.6.1.4.1.19376.1.5.3.1.3.16.1) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.16.1"]'>
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité : 
                La section Habitus, Mode de vie (1.3.6.1.4.1.19376.1.5.3.1.3.16.1) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Couverture sociale (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.7) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.5.3.7"]'>
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité : 
                La section Couverture sociale (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.7) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Historique des grossesses (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4"]'>
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité : 
                La section Historique des grossesses (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Examens et surveillance prénataux (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.5.1) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.21.2.5.1"]'>
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité : 
                La section Examens et surveillance prénataux (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.5.1) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Travail et Accouchement (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3"]'>
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité : 
                La section Travail et Accouchement (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Information sur l'accouchement (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4"]'>
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité : 
                La section Information sur l'accouchement (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Vaccinations (1.3.6.1.4.1.19376.1.5.3.1.3.23) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.23"]'>
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité : 
                La section Vaccinations (1.3.6.1.4.1.19376.1.5.3.1.3.23) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Évaluation et plan (non codé) (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.5) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.13.2.5"]'>
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité : 
                La section Évaluation et plan (non codé) (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.5) est obligatoire.  
            </assert>
            
            <!-- Présence obligatoire de la section Plan de soins (1.3.6.1.4.1.19376.1.5.3.1.3.36) -->
            <assert test='cda:component/cda:section/cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.36"]'>
                [CI-SIS_CSE-CS8_2022.01] Erreur de conformité : 
                La section Plan de soins (1.3.6.1.4.1.19376.1.5.3.1.3.36) est obligatoire.  
            </assert>
            
        </rule>
        
    </pattern>
</schema>
