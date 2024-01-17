<?xml version="1.0" encoding="UTF-8"?>

<!-- Schématron E_instructionsPatient_fr    
     ......................................................................................................................................................
     Vérification de la conformité de l'entrée FR-Instructions-au-patient (1.3.6.1.4.1.19376.1.5.3.1.4.3) aux spécifications du CI-SIS    
     ......................................................................................................................................................
     Historique :
     12/08/2020 : ANS : Création
     02/09/2020 : ANS : Suppression du contrôle templateId '1.2.250.1.213.1.1.3.33' qui n'est pas obligatoire    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_instructionsPatient_fr">
    <title>CI-SIS entrée "FR-Instructions-au-patient"</title>

    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.33']">
        
        <!-- Test des templateId pour l'entrée "FR-Instructions-au-patient" -->
        <assert test="count(cda:templateId[@root='1.2.250.1.213.1.1.3.33'])&lt;=1 and cda:templateId[@root='2.16.840.1.113883.10.20.1.49'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.3']">
          [E_instructionsPatient_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Instructions-au-patient" doit avoir deux occurrences de 'templateId' :
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.3" (Conformité de l'entrée au parent IHE PCC)
            - Un deuxième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.49" (Conformité de l'entrée au parent CDA)
            et peut avoir :
            - Un troisième 'templateId' optionnel dont l'attribut @root="1.2.250.1.213.1.1.3.33" (Conformité de l'entrée au format CI-SIS)
        </assert> 
        
        <assert test="not(cda:entryRelationship/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48.35']) or (cda:entryRelationship[@typeCode='COMP']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48.35']/cda:code[@code='PINSTRUCT' and @codeSystem='1.3.6.1.4.1.19376.1.5.3.2'])">
            [E_instructionsPatient_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Instructions-au-patient(1.2.250.1.213.1.1.3.33)" peut avoir une ou plusieurs entryRelationship "FR-Instruction-au-patient (1.2.250.1.213.1.1.3.48.35)" avec :
            - L'attribut @typeCode='COMP',
            - le templateId '1.2.250.1.213.1.1.3.48.35', 
            - le code 'PINSTRUCT' et le codeSystemName '1.3.6.1.4.1.19376.1.5.3.2'.
        </assert>  
        
    </rule>
        
</pattern>