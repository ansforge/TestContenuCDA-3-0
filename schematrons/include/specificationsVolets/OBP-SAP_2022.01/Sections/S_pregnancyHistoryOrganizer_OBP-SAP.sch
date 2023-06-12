<?xml version="1.0" encoding="UTF-8"?>

<!--  S_pregnancyHistoryOrganizer_OBP-SAP.sch
    
    Teste la conformité des entrées de la section FR-Historique-des-grossesses (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4)
    
    Historique :
    28/10/2013 : Création OBP_pregnancyHistoryOrganizerEntries20131028.sch.
    25/10/2017 : Renommage du schématron en S_patientEducationAndConsents_OBP.sch
    25/01/2022 : Remplacement du code XX-MCH184 [TA_CS] par le code MED-164 [TA_ASIP]
    24/10/2022 : Version 2022.01
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_pregnancyHistoryOrganizer_OBP-SAP">
    <title>Vérification de la section FR-Historique-des-grossesses</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1"]'>  
        <!--  Vérification de la présence des entrées obligatoires        -->
        
        <!-- Pregnancy History Organizer + Pregnancy observation -->
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='63962-5']
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP-SAP] : Un organizer FR-Historique-de-la-grossesse doit contenir une entrée "Numéro de la grossesse antérieure" (63962-5)
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='63893-2'
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP-SAP] : Un organizer FR-Historique-de-la-grossesse doit contenir une entrée "Issue de la grossesse" (63893-2)
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='11884-4'
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP-SAP] : Un organizer FR-Historique-de-la-grossesse doit contenir une entrée "Age gestationnel du fœtus (estimation clinique)" (11884-4)
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='OBS_003'
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP-SAP] : Un organizer FR-Historique-de-la-grossesse doit contenir une entrée "Etat du périnée" (OBS_003)
        </assert>        
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='O72'
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP-SAP] : Un organizer FR-Historique-de-la-grossesse doit contenir une entrée "Hémorragie du post-partum" (O72)
        </assert>        
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='MED-164'
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP-SAP] : Un organizer "Pathologie en cours de grossesse" doit contenir une entrée "Pathologie en cours de grossesse" (MED-164)
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='11638-4'
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP-SAP] : Un organizer FR-Historique-de-la-grossesse doit contenir une entrée "Nombre d'enfants" (11638-4)
        </assert>
    </rule>
</pattern>