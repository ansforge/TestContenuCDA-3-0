<?xml version="1.0" encoding="UTF-8"?>
<!--             
    
    E_acteSubstitution_fr.sch :
    Contenu :
       Contrôle la conformité des éléments E_acteSubstitution_fr conformément au volet Modèles de contenu CDA.
    Historique :
    29/06/2023 : Création  
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_acteSubstitution_fr">
    <title>Vérification de la conformité de l'entrée FR-Acte-substitution(1.2.250.1.213.1.1.3.206)</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.206"]'>
        
        <!-- Test des templateId pour l'entrée "FR-Acte-substitution" -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.206'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.9.2']">
            
            [1] [E_acteSubstitution_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Acte-substitution" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.206"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.9.2"
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test="count(cda:code)=1">
            [E_acteSubstitution_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Acte-substitution" doit comporter un élément 'code'.
        </assert>
  
    </rule>
    
</pattern>