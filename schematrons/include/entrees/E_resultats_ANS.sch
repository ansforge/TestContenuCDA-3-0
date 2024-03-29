<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_resultats_ANS
   Teste la conformité de l'entrée FR-Resultats(1.2.250.1.213.1.1.3.208) Organizer en fonctionn de la conformité CI-SIS
   
   28/03/2024 : SBM :Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_resultats_ANS">
    <title>FR-Resultats Organizer</title>
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.208']">
        <let name="count_templateId" value="count(cda:templateId)"/>
        
        <assert test="self::cda:organizer[@classCode='CLUSTER' and @moodCode='EVN']">
            [E_resultats_ANS] Erreur de Conformité PCC : l'élément "organizer" doit contenir les attributs @classCode et @moodCode fixés respectivement aux valeurs 'CLUSTER' et 'EVN'
        </assert>
        <assert test="$count_templateId=1">
            [E_resultats_ANS] Erreur de Conformité PCC : l'élément "organizer" doit contenir un seul élément templateId
        </assert>
        <assert test='cda:id'>
            [E_resultats_ANS] Erreur de Conformité PCC : l'entrée FR-Resultats(1.2.250.1.213.1.1.3.208) doit contenur un élement Id
        </assert>
        
        <assert test="cda:code[@code='26436-6' or @code='18748-4' or @code='26438-2' or @code='27898-6' or @code='26435-8']">
            [E_resultats_ANS] Erreur de Conformité PCC : l'élément "organizer" doit contenir un élément "code" avec les attributs @code suivants : 
            26436-6 : Biologie polyvalente
            18748-4 : Imagerie
            26438-2 : Cytologie
            27898-6 : Pathologie
            26435-8 : Génétique humaine
        </assert>
        
        <assert test="cda:statusCode[@code='completed']">
            [E_resultats_ANS] Erreur de Conformité PCC : l'élément "organizer" doit contenir un élément "statusCode" avec l'attribut @code='completed'
        </assert>
        
        <assert test="count(cda:component/cda:observation[@classCode='OBS' and @moodCode='EVN']/cda:templateId[@root='1.2.250.1.213.1.1.3.209'])&gt;=1">
            [E_resultats_ANS] Erreur de Conformité PCC : l'élément "organizer" doit contenir une ou plusieurs entrée FR-Resultat (templateId : 1.2.250.1.213.1.1.3.209) : 
            &lt;observation classCode='OBS' moodCode='EVN'&gt;
            &lt;templateId root='1.2.250.1.213.1.1.3.209'/&gt;
        </assert>
        
    </rule>    
    
</pattern>

