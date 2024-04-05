<?xml version="1.0" encoding="UTF-8"?>
<!-- [ E_directiveAnticipee_int.sch ]
    
    Teste la conformité de l'entrée IHEAdvanceDirectiveObservation (1.3.6.1.4.1.19376.1.5.3.1.4.13.7)
    aux spécifications du CI-SIS
    
    Historique :
    30/06/2023 : ANS : Création
    05/03/2024 : ANS : Suppression des contrôles spécifiques à la France et qui sont dans le schématron E_directiveAnticipee_fr.sch
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_directiveAnticipee_int">
    <title>CI-SIS IHE Advance Directive Observation</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.7"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_directiveAnticipee_int] Erreur de conformité CI-SIS : Dans l'entrée IHE Advance Directive Observation (1.3.6.1.4.1.19376.1.5.3.1.4.13.7), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'
        </assert>
        
        <!-- Test des templateId pour l'entrée "IHEAdvanceDirectiveObservation" -->
        <assert test="cda:templateId[@root='2.16.840.1.113883.10.20.1.17'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'] 
            and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.7']">
            
            [E_directiveAnticipee_int.sch] Erreur de conformité CI-SIS : 
            L'entrée "IHE Advance Directive Observation" doit comporter les 'templateId' suivants :            
            - 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.17"
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.13"
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.13.7"
            
        </assert>
        
        <assert test='count(cda:id)=1'>
            [E_directiveAnticipee_int] : Erreur de conformité : L'élément 'id' est obligatoire [1..1].
        </assert>
        
        <assert test='count(cda:code)=1'>
            [E_directiveAnticipee_int] : Erreur de conformité : L'élément 'code' est obligatoire [1..1].
        </assert>
        
        <assert test='count(cda:text)=1 and count(cda:text/cda:reference)=1'>
            [E_directiveAnticipee_int] : Erreur de conformité : L'élément 'text' est obligatoire [1..1] et doit contenir un élément 'reference' [1..1].
        </assert>
        
        <assert test="cda:statusCode[@code='completed']"> 
            [E_directiveAnticipee_int] : Erreur de conformité : L'élément 'statutCode' est obligatoire [1..1] et fixé à la valeur code='completed'.
        </assert>
        
        <assert test='count(cda:effectiveTime)&lt;=1'>
            [E_directiveAnticipee_int] : Erreur de conformité : L'élément 'effectiveTime' est obligatoire [1..1].
        </assert>
        
        <assert test='count(cda:value)&lt;=1'>
            [E_directiveAnticipee_int] : Erreur de conformité : L'élément 'value' ne peut être présent qu'une seule fois [0..1].
        </assert>
        
        <assert test='count(cda:reference[@typeCode="REFR"])&lt;=1'>
            [E_directiveAnticipee_int] : Erreur de conformité : L'élément 'reference' ne peut être présent qu'une seule fois [0..1] et doit avoir l'attribut @typeCode="REFR".
        </assert>
        
        <assert test='not(cda:reference[@typeCode="REFR"]) or (cda:reference[@typeCode="REFR"] and cda:reference[@typeCode="REFR"]/cda:templateId/@root="2.16.840.1.113883.10.20.1.36")'>
            [E_directiveAnticipee_int] : Erreur de conformité : Si l'élément 'reference' est présent, il doit avoir le templateId '2.16.840.1.113883.10.20.1.36'.
        </assert>
        
        <assert test='not(cda:reference) or (cda:reference and cda:reference/cda:externalDocument and cda:reference/cda:externalDocument/cda:id)'>
            [E_directiveAnticipee_int] : Erreur de conformité : Si l'élément 'reference' est présent, il doit avoir les éléments :
            - 'externalDocument' pour faire référence à un document externe
            - 'id' qui identifie du document externe.
        </assert>
        
        <assert test='not(cda:reference/cda:externalDocument/cda:text) or (cda:reference/cda:externalDocument/cda:text/cda:reference)'>
            [E_directiveAnticipee_int] : Erreur de conformité : Si l'élément 'reference/externalDocument/text' est présent, il doit avoir un élément 'reference' contenant l'URL du document externe.
        </assert>
    </rule>
    
</pattern>
