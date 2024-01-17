<?xml version="1.0" encoding="UTF-8"?>

<!-- E_informantAPSR_fr
     ......................................................................................................................................................
     Vérification de la conformité de l'élément FR-Auteur-APSR (1.2.250.1.213.1.1.3.160) au CI-SIS.
     ......................................................................................................................................................
     Historique :
        - 10/01/2024 : Création
        
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_informantAPSR_fr">
    <title>CI-SIS "L'élément FR-Informant-APSR "</title>
    
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.161']">
        
        <!-- Test du templateId (IHE APSR) -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.8.1.4.6']">
            [E_informantAPSR_fr.sch] Erreur de conformité CI-SIS : 
            "FR-Auteur-APSR" doit avoir un 'templateId' avec l'attribut @root="1.3.6.1.4.1.19376.1.8.1.4.6"
        </assert>
      
    </rule>
    
</pattern>
