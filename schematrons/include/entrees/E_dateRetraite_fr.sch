<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_dateRetraite_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-Date_retraite (1.2.250.1.213.1.1.3.132)
    aux spécifications du CI-SIS
    
    Historique :
    29/06/23 : ANS : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_dateRetraite_fr">
    <title>CI-SIS date de retraite </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.132"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_dateRetraite_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Date-retraite(1.2.250.1.213.1.1.3.132), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-Date-retraite" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.21'] and cda:templateId[@root='1.2.250.1.213.1.1.3.132']">
            
            [1] [E_dateRetraite_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Date-retraite" doit comporter les 'templateId' suivants :
            - Un premier 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.132"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.7.3.1.4.24.21"
        </assert>
        
        <assert test='count(cda:id)&gt;=1'>
            [E_dateRetraite_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une ou plusieurs fois.
        </assert>
        
        <assert test='count(cda:code)=1 and cda:code/@code="87510-4" and cda:code/@codeSystem="2.16.840.1.113883.6.1"'>
            [E_dateRetraite_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='87510-4' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </assert>
        
        <assert test="cda:statusCode[@code='completed']"> 
            [E_dateRetraite_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </assert>
        
        <assert test='count(cda:value)=1'>
            [E_dateRetraite_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois [1..1].
        </assert>
        
        <assert test='count(cda:participant)=1'>
            [E_dateRetraite_fr] : Erreur de conformité CI-SIS : L'élément participant doit être présent une fois [1..1].
        </assert>
        <assert test='not(cda:participant/cda:participantRole/cda:playingEntity) or (cda:participant/cda:participantRole/cda:playingEntity[@classCode="PLC" and @determineCode="INST)"])'>
            [E_dateRetraite_int] : Erreur de conformité CI-SIS : Les attributs de l'élément "playingEntity" prennent les valeurs suivantes 
            •	@classCode="PLC"
            •	@determinerCode="INST"
            
        </assert>
    </rule>
    
</pattern>
