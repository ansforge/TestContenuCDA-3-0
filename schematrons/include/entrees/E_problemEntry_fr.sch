<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ E_problemEntry_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée "E_problemEntry_fr" (1.3.6.1.4.1.19376.1.5.3.1.4.5)
    aux spécifications du CI-SIS
    
    Historique :
    27/06/17 : NMA : Création
    17/08/17 : NMA : Suppression du test sur le codeSystem de la value
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_problemEntry_fr">
    <title>CI-SIS Problem Entry</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']">
        <let name="count_code" value="count(self::cda:observation/cda:code)"/>

        
        <assert test="$count_code=1">
            [E_problemEntry_fr] Erreur de conformité CI-SIS : Dans l'élément "Problem Entry", il ne doit y avoir qu'un seul élément code
        </assert>
        
        <assert test="cda:code[@code and @codeSystem]">
            [E_problemEntry_fr] Erreur de conformité CI-SIS : L'élément "code", contient les attributs code et codeSystem
        </assert>

        <assert test="count(cda:value)=1"> 
            [E_problemEntry_fr] Erreur de conformité CI-SIS : L'élément "value" ne doit être présent qu'une fois </assert>  
        
    </rule>
    
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']//*[cda:templateId/@root='1.2.250.1.213.1.1.3.171']">
        <!-- FR-Certitude -->
        <assert
            test="parent::cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true']"> 
            [E_problemEntry_int.sch] Erreur de conformité PCC : un élément "entryRelationship" optionnel peut être présent et 
            permettre de fournir la certitude sur le problème observé.
            S'il est présent, cet élément se conformera au template "FR-Certitude" (1.2.250.1.213.1.1.3.171).
            Son attribut 'typeCode' prendra alors la valeur 'SUBJ' et l'attribut 'inversionInd' prendra la valeur 'true'.</assert>
    </rule>
</pattern>
