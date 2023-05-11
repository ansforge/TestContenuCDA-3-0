<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_pregnancyHistoryOrganizer_OBP.sch ]O@%#o>>=-
    
    Teste la conformité des entrées de la section "Pregnancy History Organizer" (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    28/10/2013 : CRI : Création OBP_pregnancyHistoryOrganizerEntries20131028.sch.
    25/10/2017 : NMA : Renommage du schématron en S_patientEducationAndConsents_OBP.sch
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_pregnancyHistoryOrganizer_OBP">
    <title>IHE PCC v3.0 Pregnancy History Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1"]'>  
        <!--  Vérification de la présence des entrées obligatoires        -->
        
        <!-- Pregnancy History Organizer + Pregnancy observation -->
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='OBS_041']
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP] : Un organizer "Pregnancy History" 
            dans le contexte SAP doit contenir une entrée "Numéro de la grossesse antérieure"
        </assert>

        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='OBS_001'
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP] : Un organizer "Pregnancy History" 
            dans le contexte SAP doit contenir une entrée "Issue de la grossesse"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='11884-4'
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP] : Un organizer "Pregnancy History" 
            dans le contexte SAP doit contenir une entrée "Durée de la grossesse"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='XX-MCH184'
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP] : Un organizer "Pathologie en cours de grossesse" 
            dans le contexte SAP doit contenir une entrée "Pathologie en cours de grossesse"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='OBS_003'
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP] : Un organizer "Pregnancy History" 
            dans le contexte SAP doit contenir une entrée "Etat du périnée"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='11638-4'
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP] : Un organizer "Pregnancy History" 
            dans le contexte SAP doit contenir une entrée "Nombre d'enfants"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='D8-34000'
            or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [S_pregnancyHistoryOrganizer_OBP] : Un organizer "Pregnancy History" 
            dans le contexte SAP doit contenir une entrée "Hémorragie du post-partum"
        </assert>
    </rule>
</pattern>