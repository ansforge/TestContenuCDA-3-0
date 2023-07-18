<?xml version="1.0" encoding="UTF-8"?>

<!--                   
     -=<<o#%@O[ E_participantBodyProcedureStepsAPSR2_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée "E_participantBodyProcedureStepsAPSR2_fr"
    aux spécifications d'IHE PaLM Suppl.APSR
    
    Historique :
    03/07/2023 : ANS : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_participantBodyProcedureStepsAPSR2_fr">
    
    <title>Palm_Suppl_APSR V2.0 participantBodyProcedureStepsAPSR2 Entry</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.106"]'>
        
        <assert test='count(cda:time)&lt;=1'>
            [E_participantBodyProcedureStepsAPSR2_int.sch] Erreur de conformité APSR : L'entrée "participantBodyProcedureStepsAPSR2" peut contenir un élément "time"(cardinalité [0..1]).
        </assert>
        
        <assert test="count(cda:participantRole)=1">
            [E_participantBodyProcedureStepsAPSR2_int.sch] Erreur de conformité APSR : L'élément "participantRole" doit être présent une seule fois (cardinalité [1..1])
        </assert>
        <assert test="count(cda:participantRole/cda:playingEntity)=1">
            [E_participantBodyProcedureStepsAPSR2_int.sch] Erreur de conformité APSR : L'élément "playingEntity" doit être présent une seule fois (cardinalité [1..1])
        </assert>
    </rule>
    
</pattern>
