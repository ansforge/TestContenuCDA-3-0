<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_periodeActiviteEnZoneDangeureuse_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-Periode-activite-en-zone-dangeureuse (1.2.250.1.213.1.1.3.133)
    aux spécifications du CI-SIS
    
    Historique :
    05/07/2023 : ANS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_periodeActiviteEnZoneDangeureuse_fr">
    <title>Vérification de la conformité de l'entrée FR-Periode-activite-en-zone-dangeureuse</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.133"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_periodeActiviteEnZoneDangeureuse_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Periode-activite-en-zone-dangeureuse(1.2.250.1.213.1.1.3.133), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-Periode-activite-en-zone-dangeureuse" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.22']">
            
            [E_periodeActiviteEnZoneDangeureuse_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Periode-activite-en-zone-dangeureuse" doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.7.3.1.4.24.22"
        </assert>
        
        <!-- Test présence de l'élément 'id' -->
        <assert test='count(cda:id)&gt;=1'>
            [E_periodeActiviteEnZoneDangeureuse_fr] : Erreur de conformité CI-SIS : L'élément "id" est présent une ou plusieurs fois.
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test='count(cda:code)=1 and cda:code/@code="87511-2" and cda:code/@codeSystem="2.16.840.1.113883.6.1"'>
            [E_periodeActiviteEnZoneDangeureuse_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='87511-2' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </assert>
        
        <!-- Test présence de l'élément 'statusCode' -->
        <assert test="cda:statusCode[@code='completed']"> 
            [E_periodeActiviteEnZoneDangeureuse_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. 
        </assert>
        
        <!-- Test présence de l'élément 'value' -->
        <assert test='count(cda:value)=1'>
            [E_periodeActiviteEnZoneDangeureuse_fr] : Erreur de conformité CI-SIS : L'élément "value" doit être présent une fois [1..1].
        </assert>
    </rule>
    
</pattern>
