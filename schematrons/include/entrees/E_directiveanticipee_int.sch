<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_directiveAnticipee_int.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée IHEAdvanceDirectiveObservation (1.3.6.1.4.1.19376.1.5.3.1.4.13.7)
    aux spécifications du CI-SIS
    
    Historique :
    30/06/23 : ANS : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_directiveAnticipee_int">
    <title>CI-SIS IHEAdvanceDirectiveObservation</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.7"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_directiveAnticipee_int] Erreur de conformité CI-SIS : Dans l'entrée IHEAdvanceDirectiveObservation(1.3.6.1.4.1.19376.1.5.3.1.4.13.7), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "IHEAdvanceDirectiveObservation" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.7']
            and cda:templateId[@root='2.16.840.1.113883.10.20.1.17'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']">
            
            [1] [E_directiveAnticipee_int.sch] Erreur de conformité CI-SIS : 
            L'entrée "IHEAdvanceDirectiveObservation" doit comporter les 'templateId' suivants :
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.13.7"
            - Un deuxième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.17"
            - Un troisième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.13"
            
        </assert>
        
        <assert test='count(cda:id)&gt;=1'>
            [E_directiveAnticipee_int] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une ou plusieurs fois.
        </assert>
        
        <assert test='count(cda:code)=1'>
            [E_directiveAnticipee_int] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois.
        </assert>
        
        <assert test='count(cda:text)=1'>
            [E_directiveAnticipee_int] : Erreur de conformité CI-SIS : L'élément text doit être présent une fois.
        </assert>
        
        <assert test="cda:statusCode[@code='completed']"> 
            [E_directiveAnticipee_int] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </assert>
        
        <assert test='count(cda:effectiveTime)&lt;=1'>
            [E_directiveAnticipee_int] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent maximum une fois [0..1].
        </assert>
        
        <assert test='count(cda:reference)&lt;=1'>
            [E_directiveAnticipee_int] : Erreur de conformité CI-SIS : L'élément reference doit être présent maximum une fois [0..1].
        </assert>
    </rule>
    
</pattern>
