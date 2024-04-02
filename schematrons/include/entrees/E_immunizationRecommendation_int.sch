<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ immunizationRecommendation_int.sch ]O@%#o>>=-
    
    Définition: Teste les entrées relatives à la recommandation de vaccination
    
    Historique :
    18/12/2023 : SBM : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_immunizationRecommendation_int">
    <title>Immunization Recommendation</title>
    
    <!-- ****** Contexte = Entrée Immunization Recommendation****** -->
    
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12.2']">
        <let name="count_templateId" value="count(cda:templateId)"/>
        <assert test='(@negationInd="true" or @negationInd="false") and @classCode="SBADM" and (@moodCode="PRP" or @moodCode="INT")'>
            [immunizationRecommendation_int.sch] Erreur de Conformité PCC : 
            Dans une entrée 'Immunization Recommendation' :
            L'attribut negationInd doit prendre la valeur 'true' (Si la vaccination est ‘à ne pas administrer’) ou la valeur 'false' (Si la vaccination est ‘à administrer’).
            L'attribut @moodCode doit prendre la valeur 'INT' si la vaccination est prévue ou 'PRP' si la vaccination est proposée.
            L'attribut @classCode doit prendre la valeur 'SBADM'.
        </assert>
        
        <assert test='cda:templateId[@root="2.16.840.1.113883.10.20.1.25"]'>
            [immunizationRecommendation_int.sch] Erreur de Conformité PCC : 
            Dans une entrée 'Immunization Recommendation', l'OID du template CCD parent (2.16.840.1.113883.10.20.1.25) est obligatoire.
        </assert>
        
        <assert test="$count_templateId&gt;1">
            [immunizationRecommendation_int.sch] Erreur de Conformité PCC : 
            Une entrée 'Immunization Recommendation' doit comporter au minimum deux templateId (cardinalité [2..*])
        </assert>
        
        <assert test='cda:id'>
            [immunizationRecommendation_int.sch] Erreur de Conformité PCC :  
            Dans une entrée 'Immunization Recommendation', l'élément 'id' (identifiant de l'entrée) est obligatoire.
        </assert>
        
        <assert test='cda:code[@code and @codeSystem]'>
            [immunizationRecommendation_int.sch] Erreur de Conformité PCC : 
            Dans une entrée 'Immunization Recommendation', l'élément 'code' (type de vaccination) est obligatoire. Les attributs 'code' et 'codeSystem' sont obligatoires. 
            Le type de vaccination permet de préciser s'il s'agit d'un primo-vaccination ou d'un rappel. 
            Si l'information n'est pas connue, utiliser le code='no-immunization-info' et des nullFlavor="NA" dans les éléments obligatoires de l’entrée.             
            Si pas de vaccinations, utiliser le code='no-known-immunizations' et des nullFlavor="NA" dans les éléments obligatoires de l’entrée.             
        </assert>
        
        <assert test='cda:statusCode[@code="active"]'>
            [immunizationRecommendation_int.sch] Erreur de Conformité PCC : 
            Dans une entrée 'Immunization Recommendation', l'élément 'statusCode' est obligatoire et doit prendre la valeur 'active'.
        </assert>
        
        <assert test='cda:effectiveTime and (cda:effectiveTime/cda:low) and (cda:effectiveTime/cda:high)'>
            [immunizationRecommendation_int.sch] Erreur de Conformité PCC :            
            Dans une entrée 'Immunization Recommendation', l'élément 'effectiveTime' est obligatoire pour indiquer la période de vaccination souhaitable.
            l'élément 'effectiveTime' doit contenir l'élément 'low' et 'high' pour indiquer respectivement la Date de début de période et la Date de fin de période.
        </assert>
        
        <assert test='count(cda:routeCode)&lt;=1'>
            [immunizationRecommendation_int.sch] Erreur de Conformité PCC : 
            Dans une entrée 'Immunization Recommendation', l'élément 'routeCode' peut etre présent [0..1].
        </assert>
        
        <assert test='cda:consumable/@typeCode="CSM"'>
            [immunizationRecommendation_int.sch.sch] Erreur de Conformité PCC :  
            Dans une entrée 'Immunization Recommendation', l'élément 'consumable' est obligatoire. Il doit comporter l'attribut @typeCode="CSM".
        </assert>
        
        <assert test='cda:consumable//cda:manufacturedProduct//cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.7.2"]'>
            [immunizationRecommendation_int.sch] Erreur de Conformité PCC :  
            Dans une entrée 'Immunization Recommendation', l'élément 'consumable' est obligatoire.
            Il doit comporter une entrée 'manufacturedProduct' conforme au template 'Product Entry template' (1.3.6.1.4.1.19376.1.5.3.1.4.7.2).
        </assert>
        
        <assert test="not(cda:entryRelationship) or 
            cda:entryRelationship[@typeCode='SUBJ']/cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.2'] or
            cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.1.46'] or 
            cda:entryRelationship[@typeCode='REFR']/cda:supply/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.3']">
            [immunizationRecommendation_int.sch] Erreur de conformité CI-SIS : 
            Dans une entrée 'Immunization Recommendation', les éléments 'entryRelationship' ne sont pas obligatoires.
            S'ils sont présents, ils doivent respecter les exigences suivantes :
            - Commentaire ('entryRelationship' avec typeCode='SUBJ') : doit comporter une entrée de type 'act' avec un OID="1.3.6.1.4.1.19376.1.5.3.1.4.2".
            - Rang de la vaccination ('entryRelationship' avec typeCode='SUBJ') : doit comporter une entrée de type 'observation' avec un OID="2.16.840.1.113883.10.20.1.46".
            - Lien avec la prescription ('entryRelationship' avec typeCode 'REFR') : doit comporter une entrée de type 'supply' avec un OID="1.3.6.1.4.1.19376.1.5.3.1.4.7.3".
        </assert>
        
        <assert test="count(cda:entryRelationship[@typeCode='REFR']/cda:supply/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.3'])&lt;2">
            [immunizationRecommendation_int.sch] Erreur de conformité CI-SIS : 
            Dans une entrée 'Immunization Recommendation', il ne peut y avoir qu'un seul élément 'entryRelationship' (typeCode 'REFR') décrivant le lien avec la prescription (entrée de type 'supply' avec un OID="1.3.6.1.4.1.19376.1.5.3.1.4.7.3").
        </assert>
        
        <assert test="count(cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.1.46'])&lt;2">
            [immunizationRecommendation_int.sch] Erreur de conformité CI-SIS :
            Dans une entrée 'Immunization Recommendation', il ne peut y avoir qu'un seul élément 'entryRelationship' (typeCode 'SUBJ') décrivant le rang de la vaccination (entrée de type 'observation' avec un OID="2.16.840.1.113883.10.20.1.46").
        </assert>
        
        <assert test="count(cda:entryRelationship[@typeCode='SUBJ']/cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.2'])&lt;2">
            [immunizationRecommendation_int.sch] Erreur de conformité CI-SIS : L'élément entryRelationship représentant le commentaire ne peut être présent qu'une fois
            Dans une entrée 'Immunization Recommendation', il ne peut y avoir qu'un seul élément 'entryRelationship' (typeCode 'SUBJ') portant un commentaire (entrée de type 'act' avec un OID="1.3.6.1.4.1.19376.1.5.3.1.4.2").            
        </assert>
        
        <assert test="not(cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.46']) or (cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.46']
            and cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.46']/cda:code/@code='30973-2')">
            [immunizationRecommendation_int.sch] Erreur de conformité CI-SIS :
            Dans une entrée 'Immunization Recommendation', l'entryRelationship (typeCode 'SUBJ') décrivant le rang de la vaccination (entrée de type 'observation' avec un OID="2.16.840.1.113883.10.20.1.46") doit obligatoirement avoir le code @code='30973-2'.
        </assert>
    </rule>
    
</pattern>
