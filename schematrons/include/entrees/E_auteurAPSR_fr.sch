<?xml version="1.0" encoding="UTF-8"?>

<!-- E_auteurAPSR_fr
     ......................................................................................................................................................
     Vérification de la conformité de l'élément FR-Auteur-APSR (1.2.250.1.213.1.1.3.160) au CI-SIS.
     ......................................................................................................................................................
     Historique :
        - 10/01/2024 : Création
        
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_auteurAPSR_fr">
    <title>CI-SIS "L'élément FR-Auteur-APSR "</title>
    
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.160']">
        
        <!-- Test du templateId (IHE APSR) -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.8.1.4.2']">
            [E_auteurAPSR_fr.sch] Erreur de conformité CI-SIS : 
            "FR-Auteur-APSR" doit avoir un 'templateId' avec l'attribut @root="1.3.6.1.4.1.19376.1.8.1.4.2"
        </assert>
        <!-- Test de la conformité du <time> -->
        <assert test="count(cda:time)=1">
            [E_auteurAPSR_fr.sch] Erreur de conformité CI-SIS : 
            Dans "FR-Auteur-APSR", l'élément time doit etre présent une seule fois [1..1].
        </assert>
        <!-- Test de la conformité du <assignedAuthor> -->
        <assert test="count(cda:assignedAuthor)=1 ">
            [E_auteurAPSR_fr.sch] Erreur de conformité CI-SIS : 
            Dans "FR-Auteur-APSR", l'élément "assignedAuthor" est obligatoire [1..1].
        </assert>
        <assert test="count(cda:assignedAuthor/cda:id)&gt;=1 ">
            [E_auteurAPSR_fr.sch] Erreur de conformité CI-SIS : 
            Dans "FR-Auteur-APSR", l'élément (assignedAuthor/id)doit etre présent une ou plusiers fois [1..*].
        </assert>
       
    </rule>
    
</pattern>
