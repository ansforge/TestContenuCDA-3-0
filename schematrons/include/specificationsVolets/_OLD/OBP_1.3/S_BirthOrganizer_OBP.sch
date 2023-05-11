<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_BirthOrganizer_OBP.sch ]O@%#o>>=-
    
    Teste la conformité des entrées de la section "Birth Organizer" (1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    28/10/2013 : CRI : Création OBP_BirthOrganizerEntries20131028.sch
    25/10/2017 : NMA : Renommage du schématron en S_BirthOrganizer_OBP
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_BirthOrganizer_OBP">
  
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2"]'>  
        <!--  Vérification de la présence des entrées obligatoires        -->
        
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='11884-4']">
            [S_BirthOrganizer_OBP] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Age gestationnel du fœtus (estimation clinique)"
        </assert>

        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='D8-34000']">
            [S_BirthOrganizer_OBP] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Hémorragie post-partum"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='MED-164']">
            [S_BirthOrganizer_OBP] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Pathologie en cours de grossesse"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='OBS_001']">
            [S_BirthOrganizer_OBP] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Issue de la grossesse"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='OBS_003']">
            [S_BirthOrganizer_OBP] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Etat du périnée"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='OBS_041']">
            [S_BirthOrganizer_OBP] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Numéro de la grossesse antérieure"
        </assert>
        
        
    </rule>
</pattern>