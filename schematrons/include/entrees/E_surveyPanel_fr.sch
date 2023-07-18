<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ E_surveyPanel_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée "FR-Groupe-de-questionnaires-d-evaluation" (1.2.250.1.213.1.1.3.95)
    aux spécifications d'IHE PCC
    
    Historique :
    03/07/2023 : ANS : Création
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_surveyPanel_fr">
    
    <title>IHE PCC v3.0 Survey Panel</title>
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.95']">
        <let name="count_templateId" value="count(cda:templateId)"/>
        <assert test="@classCode='CLUSTER'"> 
            [E_surveyPanel_fr] Erreur de Conformité PCC : Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation, l'attribut "classCode" sera fixé à la valeur "CLUSTER". 
        </assert>
        
        <assert test="@moodCode = 'EVN'"> 
            [E_surveyPanel_fr] Erreur de Conformité PCC : Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation", l'élément "moodCode" 
            sera fixé à la valeur "EVN".
        </assert>
        
        <assert test="$count_templateId&gt;2">
            [E_surveyPanel_fr] Erreur de Conformité PCC : Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation", il doit y avoir au minimum deux éléments templateId
        </assert>
        
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.7']">
            [E_surveyPanel_fr] Erreur de Conformité PCC : L'entrée "FR-Groupe-de-questionnaires-d-evaluation" doit avoir un templateId fixé à la valeur @root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.7'
        </assert>
        
        <assert test="cda:templateId[@root='2.16.840.1.113883.10.20.1.32']">
            [E_surveyPanel_fr] Erreur de Conformité PCC : L'entrée "FR-Groupe-de-questionnaires-d-evaluation" doit avoir une templateId fixé à la valeur @root='2.16.840.1.113883.10.20.1.32' pour respecter la conformité CCD
        </assert>
        
        <assert test="count(cda:id)&gt;=1"> 
            [E_surveyPanel_fr] Erreur de Conformité PCC :
            Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation", un 'élément "id" est obligatoire (cardinalité [1..*]).
        </assert>
        
        <assert test="cda:statusCode/@code='completed'">
            [E_surveyPanel_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Groupe-de-questionnaires-d-evaluation, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        
        <assert test="cda:code"> 
            [E_surveyPanel_fr] Erreur de Conformité PCC :
            Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation", un 'élément "code" est obligatoire (cardinalité [1..1]).
        </assert>
        
        <assert test="cda:effectiveTime"> 
            [E_surveyPanel_fr] Erreur de Conformité PCC :
            Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation", un 'élément "effectiveTime" est obligatoire (cardinalité [1..1]).
        </assert> 
        
        <assert test="count(cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.6'])&gt;=1"> 
            [E_surveyPanel_fr] Erreur de Conformité PCC :
            Dans une entrée "FR-Groupe-de-questionnaires-d-evaluation", l'entrée "IHE Survey Observation" est obligatoire (cardinalité [1..*]).
        </assert>
        
    </rule>
</pattern>
