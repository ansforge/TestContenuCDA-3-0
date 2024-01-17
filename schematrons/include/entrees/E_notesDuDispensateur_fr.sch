<?xml version="1.0" encoding="UTF-8"?>
<!--             
    
    E_notesDuDispensateur_fr.sch :
    Contenu :
       Contrôle la conformité des éléments E_notesDuDispensateur_fr conformément au volet Modèles de contenu CDA.
    Historique :
    04/07/2023 : Création  
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_notesDuDispensateur_fr">
    <title>Vérification de la conformité de l'entrée FR-Notes-du-dispensateur (1.2.250.1.213.1.1.3.207)</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.207"]'>
        
        <assert test="self::cda:act[@classCode = 'ACT' and @moodCode = 'INT']">
            [E_notesDuDispensateur_fr] Erreur de conformité CI-SIS : L'élément "act" doit
            contenir les attributs @classCode="ACT" et @moodCode="INT". </assert>
        
        <!-- Test des templateId pour l'entrée "FR-Notes-du-dispensateur" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.3.1'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.43']
            and cda:templateId[@root='1.2.250.1.213.1.1.3.207']">
            
            [1] [E_notesDuDispensateur_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Notes-du-dispensateur" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.3.1"
            - Un deuxième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.43"
            - Un troisième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.207"
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test="cda:code/@code='FINSTRUCT' and cda:code/@codeSystem='1.3.6.1.4.1.19376.1.5.3.2'">
            [E_notesDuDispensateur_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Notes-du-dispensateur" doit comporter un élément 'code' avec l'attribut @code='FINSTRUCT' et
            @codeSystem='1.3.6.1.4.1.19376.1.5.3.2'.
        </assert>
    </rule>
</pattern>