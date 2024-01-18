<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_ModelesDeContenusCDA.sch
    ......................................................................................................................................................
    Auteur : ANS
    ......................................................................................................................................................
    Vérification de la conformité des entrées IHE (corps d'un document CDA) aux spécifications françaises
    ......................................................................................................................................................  
    Historique :
        27/05/11 : FMY : Création
        31/05/11 : FMY : Compléments
        15/06/11 : FMY : Compléments
        27/06/11 : FMY : publication dans la version 1.0.1 du CI-SIS
        22/07/11 : FMY : Mise à jour des commentaires ci-dessus (retirer le pattern et l'include nonXMLBody), ajout variable OIDLOINC
                         ajout pattern observationInterpretation
        27/07/11 : FMY : Ajout des patterns de sections et d'entries de PCC et du CI-SIS, transversaux à tous types de documents       
        19/12/11 : FMY : Ajout du contrôle / jeu de valeurs confidentialityCode
        08/10/12 : FMY : CI-SIS 1.3 => retrait des include assignedAuthor, confidentialityCode et custodianOrganization. 
                         Maj des include assignedEntity (addr & telecom optionnels) et addr (contrôle structure des adresses)
                         Actualisation nom de fichiers include problemEntry, concernentry, procedureentry 
        24/01/13 : FMY : Ajout de contrôle de encompassingEncounter/code par rapport au jeu de valeurs CI-SIS_jdv_encompassingEncounterCode
        08/04/13 : FMA : Ajout du préfixe lab (pour CR de biologie et CR-ACP, et appel nouveau pattern serviceEventLabStatusCode
        05/12/13 : FMA : Désactivation du contrôle de l'adresse pour livraison au groupement DMP (qui n'a pas implémenté l'évolution addr)
        10/03/15 : JDS : Réactivation du contrôle de l'élément addr (spécifié dans la version du CI-SIS v1.2.0 de 2012 )
                         Maj des include serviceEventLabStatusCode20130408.sch      -> serviceEventLabStatusCode20150317.sch
                         Maj des include telecom20110728.sch                        -> telecom20150317.sch
        10/10/19 : APE : Suppression des appels aux schématrons Dispositif médical FR qui n'existe pas
        10/10/19 : APE : Renommage du nom du schématron encounter (sans 's' à la fin)
        01/12/20 : ANS : Mise à jour pour eP-MED
        
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_ModelesDeContenusCDA"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2" xmlns:lab="urn:oid:1.3.6.1.4.1.19376.1.3.2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_ModelesDeContenusCDA.sch">
    
    <title>Rapport de conformité du document aux spécifications françaises (corps – sections, entrées, jeux de valeurs IHE)</title>

    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    <ns prefix="lab" uri="urn:oid:1.3.6.1.4.1.19376.1.3.2"/>
    <ns prefix="pharm" uri="urn:ihe:pharm"/>

    <!-- Entrées -->
    <include href="../include/entrees/E_allergiesAndIntoleranceConcern_fr.sch"/>
    <include href="../include/entrees/E_allergiesAndIntolerances_fr.sch"/>
    <include href="../include/entrees/E_autorisationSubstitution_fr.sch"/>
    <include href="../include/entrees/E_birthEventOrganizer_fr.sch"/>
    <include href="../include/entrees/E_bloodTypeObservation_fr.sch"/>
    <include href="../include/entrees/E_concernEntry_fr.sch"/>
    <include href="../include/entrees/E_encounter_fr.sch"/>
    <include href="../include/entrees/E_familyHistoryObservation_fr.sch"/>
    <include href="../include/entrees/E_immunizations_fr.sch"/>
    <include href="../include/entrees/E_instructionsPatient_fr.sch"/>
    <include href="../include/entrees/E_instructionsDispensateur_fr.sch"/>
    <include href="../include/entrees/E_itemPlanTraitement_fr.sch"/>
    <include href="../include/entrees/E_medications_fr.sch"/>
<!--    <include href="../include/entrees/E_observationRequest_fr.sch"/>-->
    <include href="../include/entrees/E_patientTransfer_fr.sch"/>
    <include href="../include/entrees/E_periodeRenouvellement_fr.sch"/>  
    <include href="../include/entrees/E_pregnancyHistoryOrganizer_fr.sch"/>
    <include href="../include/entrees/E_pregnancyObservation_fr.sch"/>
    <include href="../include/entrees/E_problemConcernEntry_fr.sch"/>
    <include href="../include/entrees/E_problemEntry_fr.sch"/><!--
    <include href="../include/entrees/E_problemStatusObservation_fr.sch"/>-->
    <include href="../include/entrees/E_produitDeSante_fr.sch"/>
    <include href="../include/entrees/E_quantiteProduit_fr.sch"/>
    <include href="../include/entrees/E_referenceItemPlanTraitement_fr.sch"/>
    <include href="../include/entrees/E_severity_fr.sch"/>
    <include href="../include/entrees/E_simpleObservation_fr.sch"/>
    <include href="../include/entrees/E_socialHistoryObservation_fr.sch"/>
    <include href="../include/entrees/E_supplyEntry_fr.sch"/>
    <include href="../include/entrees/E_surveyObservation_fr.sch"/>
    <include href="../include/entrees/E_traitementPrescrit_fr.sch"/>
    <include href="../include/entrees/E_traitementPrescritSubordonnee_fr.sch"/>
    <include href="../include/entrees/E_transport_fr.sch"/>
    <include href="../include/entrees/E_vitalSignsObservation_fr.sch"/>
    <include href="../include/entrees/E_vitalSignsOrganizer_fr.sch"/>  
    <include href="../include/entrees/E_disposition_fr.sch"/> 
    <include href="../include/entrees/E_statutDuDocument_fr.sch"/> 
    <include href="../include/entrees/E_evenementIndesirablePendantHospitalisation_fr.sch"/> 
    <include href="../include/entrees/E_evenementIndesirableSuiteAdministrationDerivesSang_fr.sch"/> 
    <include href="../include/entrees/E_identificationMicroOrganismesMultiresistants_fr.sch"/>
    <include href="../include/entrees/E_accidentsTransfusionnels_fr.sch"/>
    <include href="../include/entrees/E_payers_fr.sch"/>
    <include href="../include/entrees/E_comments_fr.sch"/>
    <include href="../include/entrees/E_acte_fr.sch"/>
    <include href="../include/entrees/E_acteSubstitution_fr.sch"/>
    <include href="../include/entrees/E_diagnosticDuCancer_fr.sch"/>
    <include href="../include/entrees/E_administrationDeDerivesDuSang_fr.sch"/>
    <include href="../include/entrees/E_certitude_fr.sch"/>
    <include href="../include/entrees/E_criticite_fr.sch"/>
    <include href="../include/entrees/E_dateRetraite_fr.sch"/>
    <include href="../include/entrees/E_directiveAnticipee_fr.sch"/>
    <include href="../include/entrees/E_doseAntigene_fr.sch"/>
    <include href="../include/entrees/E_dureeOccupationPoste_fr.sch"/>
    <include href="../include/entrees/E_participantBodyProcedureStepsAPSR2_fr.sch"/>
    <include href="../include/entrees/E_fluideIntraveineux_fr.sch"/>
    <include href="../include/entrees/E_surveyPanel_fr.sch"/>
    <include href="../include/entrees/E_historiqueDesProfessions_fr.sch"/>
    <include href="../include/entrees/E_historiqueStatutsProfessionnels_fr.sch"/>
    <include href="../include/entrees/E_horairesDeTravail_fr.sch"/>
    <include href="../include/entrees/E_scoreDepressionGeriatiqueComposant_fr.sch"/>
    <include href="../include/entrees/E_scoreDepressionGeriatique_fr.sch"/>
    <include href="../include/entrees/E_scoreBradenComposant_fr.sch"/>
    <include href="../include/entrees/E_scoreBraden_fr.sch"/>
    <include href="../include/entrees/E_traitementDispense_fr.sch"/>
    <include href="../include/entrees/E_TNMy_fr.sch"/>
    <include href="../include/entrees/E_TNM-T_fr.sch"/>
    <include href="../include/entrees/E_TNM-statutTumoralResiduel_fr.sch"/>
    <include href="../include/entrees/E_TNM-r_fr.sch"/>
    <include href="../include/entrees/E_nombreNoeuds_fr.sch"/>
    <include href="../include/entrees/E_TNM-N_fr.sch"/>
    <include href="../include/entrees/E_TNM-marqueursTumorauxSeriques_fr.sch"/>
    <include href="../include/entrees/E_TNM-M_fr.sch"/>
    <include href="../include/entrees/E_TNM-InvasionVeineuse_fr.sch"/>
    <include href="../include/entrees/E_TNM-InvasionPerineurale_fr.sch"/>
    <include href="../include/entrees/E_TNM-InvasionLymphatique_fr.sch"/>
    <include href="../include/entrees/E_TNM-classification_fr.sch"/>
    <include href="../include/entrees/E_TNM-a_fr.sch"/>
    <include href="../include/entrees/E_regionInteretSurImage_fr.sch"/>
    <include href="../include/entrees/E_referencesExternes_fr.sch"/>
    <include href="../include/entrees/E_referenceItemPrescription_fr.sch"/>
    <include href="../include/entrees/E_referenceItemDispensation_fr.sch"/>
    <include href="../include/entrees/E_referenceItemAdministration_fr.sch"/>
    <include href="../include/entrees/E_referenceConseilDispensateur_fr.sch"/>
    <include href="../include/entrees/E_rangDeLaVaccination_fr.sch"/>
    <include href="../include/entrees/E_professionLaPlusLongue_fr.sch"/>
    <include href="../include/entrees/E_periodeActiviteEnZoneDangeureuse_fr.sch"/>
    <include href="../include/entrees/E_organismeAssuranceMaladie_fr.sch"/>
    <include href="../include/entrees/E_observationTNM _fr.sch"/>
    <include href="../include/entrees/E_observationSurEchelleDouleur_fr.sch"/>
    <include href="../include/entrees/E_observationAnatomoPathologique_fr.sch"/>
    <include href="../include/entrees/E_notesDuDispensateur_fr.sch"/>
    <include href="../include/entrees/E_laboratoryObservation_fr.sch"/>
    <include href="../include/entrees/E_joursDeTravailHebdomadaire_fr.sch"/>
    <include href="../include/entrees/E_isolatMicrobiologique_fr.sch"/>
    <include href="../include/entrees/E_imageIllustrativeAPSR_fr.sch"/>
    <include href="../include/entrees/E_instructionAuPatient_fr.sch"/>
    <include href="../include/entrees/E_scoreNIHSS_fr.sch"/>
    <include href="../include/entrees/E_DICOMExpositionPatient_fr.sch"/>
    <include href="../include/entrees/E_DICOMAdministrationProduitDeSante_fr.sch"/>
    <include href="../include/entrees/E_DICOMAdministrationRadiopharmaceutique_fr.sch"/>
    <include href="../include/entrees/E_DICOM_Observation_fr.sch"/>
    <include href="../include/entrees/E_DICOM_Quantite_fr.sch"/>
    <include href="../include/entrees/E_DICOM_TechniqueImagerie_fr.sch"/>
    <include href="../include/entrees/E_DICOMExamenImagerie_fr.sch"/>
    <include href="../include/entrees/E_DICOM_SerieImagerie_fr.sch"/>
    <include href="../include/entrees/E_DICOM_SOPInstanceObservation_fr.sch"/>
    <include href="../include/entrees/E_observationOculaireAlignementOculaireEtMotilite_fr.sch"/>
    <include href="../include/entrees/E_observationOculaireChampVisuel_fr.sch"/>
    <include href="../include/entrees/E_observationOculairePressionIntraoculaire_fr.sch"/>
    <include href="../include/entrees/E_observationOculairePupilles_fr.sch"/>
    <include href="../include/entrees/E_observationOculaireSegmentAnterieur_fr.sch"/>
    <include href="../include/entrees/E_observationOculaireSystemeLacrymal_fr.sch"/>
    <include href="../include/entrees/E_observationOculaireTestDeLaVision_fr.sch"/>
    <include href="../include/entrees/E_ocularObservation_fr.sch"/>
    <include href="../include/entrees/E_auteurAPSR_fr.sch"/>
    <include href="../include/entrees/E_batterieExamensSurveillancePrenataux_fr.sch"/>
    <include href="../include/entrees/E_informantAPSR_fr.sch"/>
    <include href="../include/entrees/E_laboratoireExecutant_fr.sch"/>
    <include href="../include/entrees/E_humanPatientWithNonHumanSubject_fr.sch"/>
    <include href="../include/entrees/E_nonHumanSubject_fr.sch"/>
    <include href="../include/entrees/E_rechercheMicroOrganismes_fr.sch"/>
    <include href="../include/entrees/E_motifArretTraitement_fr.sch"/>
    <include href="../include/entrees/E_modaliteSortie_fr.sch"/>
    <include href="../include/entrees/E_modaliteEntree_fr.sch"/>
    
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->

    <phase id="CI-SIS_ModelesDeContenusCDA">
        
        <!-- Activation des entrées  -->
        <active pattern="E_allergiesAndIntoleranceConcern_fr"/>
        <active pattern="E_allergiesAndIntolerances_fr"/>
        <active pattern="E_autorisationSubstitution_fr"/>
        <active pattern="E_birthEventOrganizer_fr"/>
        <active pattern="E_bloodTypeObservation_fr"/>
        <active pattern="E_concernEntry_fr"/>
        <active pattern="E_encounter_fr"/>
        <active pattern="E_familyHistoryObservation_fr"/>
        <active pattern="E_immunizations_fr"/>
        <active pattern="E_instructionsPatient_fr"/>
        <active pattern="E_instructionsDispensateur_fr"/>
        <active pattern="E_itemPlanTraitement_fr"/>
        <active pattern="E_medications_fr"/>
<!--        <active pattern="E_observationRequest_fr"/>-->
        <active pattern="E_patientTransfer_fr"/>
        <active pattern="E_periodeRenouvellement_fr"/>
        <active pattern="E_pregnancyHistoryOrganizer_fr"/>
        <active pattern="E_pregnancyObservation_fr"/>
        <active pattern="E_problemConcernEntry_fr"/>
        <active pattern="E_problemEntry_fr"/>
<!--        <active pattern="E_problemStatusObservation_fr"/>-->
        <active pattern="E_produitDeSante_fr"/>
        <active pattern="E_quantiteProduit_fr"/>
        <active pattern="E_referenceItemPlanTraitement_fr"/>
        <active pattern="E_severity_fr"/>
        <active pattern="E_simpleObservation_fr"/>
        <active pattern="E_socialHistoryObservation_fr"/>
        <active pattern="E_supplyEntry_fr"/>
        <active pattern="E_surveyObservation_fr"/>
        <active pattern="E_transport_fr"/>
        <active pattern="E_traitementPrescrit_fr"/>
        <active pattern="E_traitementPrescritSubordonnee_fr"/>
        <active pattern="E_vitalSignsOrganizer_fr"/>
        <active pattern="E_vitalSignsObservation_fr"/>
        <active pattern="E_disposition_fr"/>  
        <active pattern="E_statutDuDocument_fr"/>  
        <active pattern="E_evenementIndesirablePendantHospitalisation_fr"/>
        <active pattern="E_evenementIndesirableSuiteAdministrationDerivesSang_fr"/>
        <active pattern="E_identificationMicroOrganismesMultiresistants_fr"/>
        <active pattern="E_accidentsTransfusionnels_fr"/>
        <active pattern="E_payers_fr"/>
        <active pattern="E_comments_fr"/>
        <active pattern="E_acte_fr"/>
        <active pattern="E_acteSubstitution_fr"/>
        <active pattern="E_diagnosticDuCancer_fr"/>
        <active pattern="E_administrationDeDerivesDuSang_fr"/>
        <active pattern="E_certitude_fr"/>
        <active pattern="E_criticite_fr"/>
        <active pattern="E_dateRetraite_fr"/>
        <active pattern="E_directiveAnticipee_fr"/>
        <active pattern="E_doseAntigene_fr"/>
        <active pattern="E_dureeOccupationPoste_fr"/>
        <active pattern="E_participantBodyProcedureStepsAPSR2_fr"/>
        <active pattern="E_fluideIntraveineux_fr"/>
        <active pattern="E_surveyPanel_fr"/>
        <active pattern="E_historiqueDesProfessions_fr"/>
        <active pattern="E_historiqueStatutsProfessionnels_fr"/>
        <active pattern="E_horairesDeTravail_fr"/>
        <active pattern="E_scoreDepressionGeriatiqueComposant_fr"/>
        <active pattern="E_scoreDepressionGeriatique_fr"/>
        <active pattern="E_scoreBradenComposant_fr"/>
        <active pattern="E_scoreBraden_fr"/>
        <active pattern="E_traitementDispense_fr"/>
        <active pattern="E_TNMy_fr"/>
        <active pattern="E_TNM-T_fr"/>
        <active pattern="E_TNM-statutTumoralResiduel_fr"/>
        <active pattern="E_TNM-r_fr"/>
        <active pattern="E_nombreNoeuds_fr"/>
        <active pattern="E_TNM-N_fr"/>
        <active pattern="E_TNM-marqueursTumorauxSeriques_fr"/>
        <active pattern="E_TNM-M_fr"/>
        <active pattern="E_TNM-InvasionVeineuse_fr"/>
        <active pattern="E_TNM-InvasionPerineurale_fr"/>
        <active pattern="E_TNM-InvasionLymphatique_fr"/>
        <active pattern="E_TNM-classification_fr"/>
        <active pattern="E_TNM-a_fr"/>
        <active pattern="E_regionInteretSurImage_fr"/>
        <active pattern="E_referencesExternes_fr"/>
        <active pattern="E_referenceItemPrescription_fr"/>
        <active pattern="E_referenceItemDispensation_fr"/>
        <active pattern="E_referenceItemAdministration_fr"/>
        <active pattern="E_referenceConseilDispensateur_fr"/>
        <active pattern="E_rangDeLaVaccination_fr"/>
        <active pattern="E_professionLaPlusLongue_fr"/>
        <active pattern="E_periodeActiviteEnZoneDangeureuse_fr"/>
        <active pattern="E_organismeAssuranceMaladie_fr"/>
        <active pattern="E_observationTNM_fr"/>
        <active pattern="E_observationSurEchelleDouleur_fr"/>
        <active pattern="E_observationAnatomoPathologique_fr"/>
        <active pattern="E_notesDuDispensateur_fr"/>
        <active pattern="E_laboratoryObservation_fr"/>
        <active pattern="E_joursDeTravailHebdomadaire_fr"/>
        <active pattern="E_isolatMicrobiologique_fr"/>
        <active pattern="E_imageIllustrativeAPSR_fr"/>
        <active pattern="E_instructionAuPatient_fr"/>
        <active pattern="E_scoreNIHSS_fr"/>
        <active pattern="E_DICOMAdministrationProduitDeSante_fr"/>
        <active pattern="E_DICOMExpositionPatient_fr"/>
        <active pattern="E_DICOM_Observation_fr"/>
        <active pattern="E_DICOMAdministrationRadiopharmaceutique_fr"/>
        <active pattern="E_DICOM_Quantite_fr"/>
        <active pattern="E_DICOM_TechniqueImagerie_fr"/>
        <active pattern="E_DICOMExamenImagerie_fr"/>
        <active pattern="E_DICOM_SerieImagerie_fr"/>
        <active pattern="E_DICOM_SOPInstanceObservation_fr"/>
        <active pattern="E_observationOculaireAlignementOculaireEtMotilite_fr"/>
        <active pattern="E_observationOculaireChampVisuel_fr"/>
        <active pattern="E_observationOculairePressionIntraoculaire_fr"/>
        <active pattern="E_observationOculairePupilles_fr"/> 
        <active pattern="E_observationOculaireSegmentAnterieur_fr"/>
        <active pattern="E_observationOculaireSystemeLacrymal_fr"/>
        <active pattern="E_observationOculaireTestDeLaVision_fr"/> 
        <active pattern="E_ocularObservation_fr"/>
        <active pattern="E_auteurAPSR_fr"/>
        <active pattern="E_batterieExamensSurveillancePrenataux_fr"/>
        <active pattern="E_informantAPSR_fr"/>
        <active pattern="E_laboratoireExecutant_fr"/>
        <active pattern="E_humanPatientWithNonHumanSubject_fr"/>
        <active pattern="E_nonHumanSubject_fr"/>
        <active pattern="E_rechercheMicroOrganismes_fr"/>
        <active pattern="E_motifArretTraitement_fr"/>
        <active pattern="E_modaliteSortie_fr"/>
        <active pattern="E_modaliteEntree_fr"/>
    </phase>
</schema>
