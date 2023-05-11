<?xml version="1.0" encoding="UTF-8"?>

<!-- CI-SIS_CNAM-HR_2022.01.sch
        
        Schématron du document CNAM-HR_2022.01.sch (Historique des remboursements)
        
        Auteur : ANS 
        Historique :
        03/11/2022 : Création
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_CNAM-HR_2022.01"
        xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CNAM-HR_2022.01.sch">

        <title>Vérification de conformité du document aux spécifications du modèle CNAM-HR_2022.01</title>
        <ns prefix="cda" uri="urn:hl7-org:v3"/>
        <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
        <ns prefix="jdv" uri="http://esante.gouv.fr"/>
        <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>

        <!--  Abstract patterns  -->
        <include href="abstract/dansJeuDeValeurs.sch"/>
        <include href="abstract/IVL_TS.sch"/>
        
        <!-- Entête du volet CNAM-HR -->	
        <include href="include/specificationsVolets/CNAM-HR_2022.01/Entete/Entete_CNAM-HR.sch"/>
        
        <!-- JDV -->
        <!-- les JDV spécifiques CNAM ne sont pas contrôlés 
        <include href="include/jeuxDeValeurs/CNAM-HR_2022.01/JDV_BDM_CNAM-HR-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CNAM-HR_2022.01/JDV_BDM_CA_CNAM-HR-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CNAM-HR_2022.01/JDV_BDM_ATC_CNAM-HR-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CNAM-HR_2022.01/JDV_LPP_CNAM-HR-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CNAM-HR_2022.01/JDV_sejours_actes_CNAM-HR-CISIS.sch"/>
        <include href="include/jeuxDeValeurs/CNAM-HR_2022.01/JDV_sejours_acte_CNAM-HR-CISIS.sch"/>-->
        
        <!-- Entrées -->
        <include href="include/specificationsVolets/CNAM-HR_2022.01/Entrees/E_FR-ActesInterventions_CNAM-HR.sch"/>
        <include href="include/specificationsVolets/CNAM-HR_2022.01/Entrees/E_FR-DispositifMedical_CNAM-HR.sch"/>
        <include href="include/specificationsVolets/CNAM-HR_2022.01/Entrees/E_FR-HistoriquePrisesEnChargeMedicales_CNAM-HR.sch"/>
        <include href="include/specificationsVolets/CNAM-HR_2022.01/Entrees/E_FR-Traitement_CNAM-HR.sch"/>
        <include href="include/specificationsVolets/CNAM-HR_2022.01/Entrees/E_FR-Vaccination_CNAM-HR.sch"/>
        
        <!-- Sections -->      
        <include href="include/specificationsVolets/CNAM-HR_2022.01/Sections/S_CommentaireNonCodee-CISIS.sch"/>
        <include href="include/specificationsVolets/CNAM-HR_2022.01/Sections/S_DispositifsMedicaux-CISIS.sch"/>
        <include href="include/specificationsVolets/CNAM-HR_2022.01/Sections/S_HistoriquePriseEnChargeMedicale.sch"/> 
        <include href="include/specificationsVolets/CNAM-HR_2022.01/Sections/S_Traitements-CISIS.sch"/>
        <include href="include/specificationsVolets/CNAM-HR_2022.01/Sections/S_Vaccinations-CISIS.sch"/> 

        <phase id="CI-SIS_CNAM-HR_2022.01">
                <active pattern="variables"/>
                <p>Vérification complète de la conformité au CI-SIS</p>
                <!-- JDV -->        
                <!-- les JDV spécifiques CNAM ne sont pas contrôlés -->
                
                <!-- Sections spécifiques au volet CNAM-HR -->
                <active pattern="S_CommentaireNonCodee-CISIS"/>
                <active pattern="S_DispositifsMedicaux-CISIS"/>
                <active pattern="S_HistoriquePriseEnChargeMedicale"/>
                <active pattern="S_Traitements-CISIS"/>
                <active pattern="S_Vaccinations-CISIS"/>
               
                <!-- Entrees spécifiques au volet CNAM-HR -->
                <active pattern="E_FR-ActesInterventions_CNAM-HR"/>
                <active pattern="E_FR-DispositifMedical_CNAM-HR"/>
                <active pattern="E_FR-HistoriquePrisesEnChargeMedicales_CNAM-HR"/>
                <active pattern="E_FR-Traitement_CNAM-HR"/>
                <active pattern="E_FR-Vaccination_CNAM-HR"/>
                
        </phase>
        
        
        <pattern id="variables">
                                
                <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">
                        <assert test="cda:component/cda:section/cda:templateId[@root='1.3.6.1.4.1.19376.1.4.1.2.16']"> 
                                [CI-SIS_CNAM-HR_2022.01] Erreur de conformité : La section FR-Commentaire-non-code (1.3.6.1.4.1.19376.1.4.1.2.16) pour la mention "Usage et Responsabilités" doit être présente.
                        </assert>
                        <assert test="cda:component/cda:section/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.3.19']"> 
                                [CI-SIS_CNAM-HR_2022.01] Erreur de conformité : La section FR-Traitements (1.3.6.1.4.1.19376.1.5.3.1.3.19) doit être présente.
                        </assert>
                        <assert test="cda:component/cda:section/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.3.23']"> 
                                [CI-SIS_CNAM-HR_2022.01] Erreur de conformité : La section FR-Vaccinations (1.3.6.1.4.1.19376.1.5.3.1.3.23) doit être présente.
                        </assert>
                        <assert test="cda:component/cda:section/cda:templateId[@root='1.2.250.1.213.1.1.2.1']"> 
                                [CI-SIS_CNAM-HR_2022.01] Erreur de conformité : La section FR-Dispositifs-medicaux (1.2.250.1.213.1.1.2.1) doit être présente.
                        </assert>
                        <assert test="cda:component/cda:section/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.5.3.3']"> 
                                [CI-SIS_CNAM-HR_2022.01] Erreur de conformité : La section FR-Historique-prises-en-charge-medicales (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.3) doit être présente.
                        </assert>
                        <assert test="cda:component/cda:section[cda:code/cda:translation[@code='67803-7']]/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11']"> 
                                [CI-SIS_CNAM-HR_2022.01] Erreur de conformité : La section FR-Actes-et-interventions (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11) doit être présente avec un code/translation="67803-7" pour les "Soins médicaux et dentaires".
                        </assert>
                        <assert test="cda:component/cda:section[cda:code/cda:translation[@code='18726-0']]/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11']"> 
                                [CI-SIS_CNAM-HR_2022.01] Erreur de conformité : La section FR-Actes-et-interventions (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11) doit être présente avec un code/translation="18726-0" pour les "Actes de radiologie".
                        </assert>
                        <assert test="cda:component/cda:section[cda:code/cda:translation[@code='26436-6']]/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11']"> 
                                [CI-SIS_CNAM-HR_2022.01] Erreur de conformité : La section "FR-Actes-et-interventions (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11) doit être présente avec un code/translation="26436-6" pour les "Actes de biologie".
                        </assert>
                </rule>
                
        </pattern>
</schema>
