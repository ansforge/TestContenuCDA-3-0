<?xml version="1.0" encoding="UTF-8"?>

<!--  S_laborAndDelivery_CSE-CS8.sch
    
    Vérification de la section Travail et accouchement (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3) du CSE-CS8.
    
    Historique :
    25/07/2011 : CRI : Création
    11/10/2017 : Ajout du nom du schématron sur les messages d'erreur
    21/11/2017 : Mise à jour des codes TA_CS ==> TA_ASIP
    24/02/2020 : Nouveau schématron de section en remplacement du schématron d'entrée
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_laborAndDelivery_CSE-CS8">
    <title>Vérification de la section Travail et accouchement (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3) du CSE-CS8.</title>

    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3']">
        <!-- Attribution à la mère -->
        <assert test="cda:subject/cda:relatedSubject/cda:code/@code='MTH'"> 
            [S_laborAndDelivery_CSE-CS8] Erreur de conformité : 
            La section "Labor and Delivery" dans le contexte du CS8 doit être attribué à la mère.
        </assert>        
        <assert test="cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.1.13.7']/cda:entry/cda:observation/cda:code/@code='73813-8'"> 
            [S_laborAndDelivery_CSE-CS8] Erreur de conformité : 
            Cette section doit mentionner le "Début de travail" (73813-8).
        </assert>
        <assert test="cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.1.13.7']/cda:entry/cda:observation/cda:code/@code='MED-168'"> 
            [S_laborAndDelivery_CSE-CS8] Erreur de conformité : 
            Cette section doit mentionner l"Analgésie au cours du travail" (MED-168).
        </assert>
        <assert test="cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.1.13.7']/cda:entry/cda:observation/cda:code/@code='57071-3'"> 
            [S_laborAndDelivery_CSE-CS8] Erreur de conformité : 
            Cette section doit mentionner la "Méthode d'accouchement" (57071-3).
        </assert>
    </rule>
</pattern>
