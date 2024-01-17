<?xml version="1.0" encoding="UTF-8"?>

<!--                   
     -=<<o#%@O[ E_participant_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'élément "FR-Participant" (1.2.250.1.213.1.1.3.109) aux spécifications au volet du CI-SIS 
    Historique :
    10/01/2024 : ANS : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_participant_fr">
    
    <title>CI-SIS FR-Participant</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.109"]'>
        
        <assert test='count(cda:participantRole)=1'>
            [E_participant_fr.sch] Erreur de conformité CI-SIS : L'élément "participantRole" doit être présent une seule fois (cardinalité [1..1]).
        </assert>
        
        <assert test="not(cda:participantRole/cda:playingEntity) or (cda:participantRole/cda:playingEntity/cda:code or cda:participantRole/cda:playingEntity/cda:name or cda:participantRole/cda:playingEntity/cda:desc) ">
            [E_participant_fr.sch] Erreur de conformité CI-SIS  : L'élément "playingEntity" si il est présent l’un des trois sous-éléments code, name, desc doit être renseigné.
        </assert>
        
        <assert test="not(cda:participantRole/cda:playingDevice) or (cda:participantRole/cda:playingDevice/cda:code or cda:participantRole/cda:playingDevice/cda:manufacturerModelName or cda:participantRole/cda:playingDevice/cda:softwareName) ">
            [E_participant_fr.sch] Erreur de conformité CI-SIS  : L'élément "playingDevice" si il est présent l’un des trois sous-éléments code, manufacturerModelName, softwareName doit être renseigné.
        </assert>
    </rule>
    
</pattern>
