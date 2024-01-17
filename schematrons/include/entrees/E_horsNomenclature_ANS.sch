<?xml version="1.0" encoding="UTF-8"?>

<!-- E_horsNomenclature_ANS
     ......................................................................................................................................................
     Vérification de la conformité de l'entrée FR-Hors-nomenclature (1.2.250.1.213.1.1.3.48.33) créée par l'ANS
     ......................................................................................................................................................
     Historique :
     - 03/07/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_horsNomenclature_ANS">
    <title>CI-SIS Entrée FR-Hors-nomenclature</title> 
    
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.48.33']">
        
        <!-- Test des templateId pour l'entrée "FR-Hors-nomenclature" -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.48'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'] and cda:templateId[@root='1.2.250.1.213.1.1.3.48.33']">
           [E_horsNomenclature_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Hors-nomenclature" doit comporter trois 'templateId' :
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.13"
            - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.48"
            - Un troisième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.48.33"
        </assert>
        
        <!-- Test présence et nombre max de l'élément 'id' -->
        <assert test="cda:id">
           [E_horsNomenclature_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Hors-nomenclature" doit comporter un élément 'id'.
        </assert>        
        
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="(count(cda:code[@code='GEN-298'][@codeSystem='1.2.250.1.213.1.1.4.322'])=1) and cda:code/@code='GEN-298'">
             [E_horsNomenclature_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Hors-nomenclature" doit comporter un élément 'code' avec les attributs :
            - @code="GEN-298" (cardinalité [1..1])
            - @codeSystem="1.2.250.1.213.1.1.4.322" (cardinalité [1..1])
        </assert>            
        
        <!-- Test de la présence de l'élément fils 'reference' -->
        <assert test="(count(cda:text/cda:reference)=1)">
           [E_horsNomenclature_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Hors-nomenclature" doit comporter un élément 'text/reference'. 
        </assert>
        
        <!-- Test présence et format de l'élément 'effectiveTime' -->
        <assert test="count(cda:effectiveTime)&lt;=1">
            [6] [E_horsNomenclature_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Hors-nomenclature" peut comporter un élément 'effectiveTime' [0..1].
        </assert>
        
        <!-- Test de la présence de l'élément 'statusCode' -->
        <assert test="(count(cda:statusCode[@code='completed'])=1)">
           [E_horsNomenclature_ANS.sch] Erreur de conformité CI-SIS :  
            L'entrée "FR-Hors-nomenclature" doit comporter un élément 'statusCode' et son attribut @code="completed". 
        </assert>
        
    </rule>
    
</pattern>
