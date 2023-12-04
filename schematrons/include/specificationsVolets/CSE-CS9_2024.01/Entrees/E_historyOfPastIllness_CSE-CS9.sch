<?xml version="1.0" encoding="UTF-8"?>

<!-- E_historyOfPastIllness_CSE-CS9.sch
    
    Vérification des entrées relatives aux antécédents médicaux du CSE-CS9.
    
    Historique :
    24/06/11 : Création
    30/06/11 : Adaptation aux modifications de structure du volet concernant les entrées Problem Concern de la section
    11/10/17 : Ajout du nom du schématron sur le nom des messages d'erreur
    22/11/17 : Mise à jour des codes TA_CS ==> TA_ASIP
    24/02/21 : Correction des contrôles
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_historyOfPastIllness_CSE-CS9">
    <title>Vérification des entrées relatives aux antécédents médicaux du CSE-CS9.</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.8"]'>         
        
        <!-- Accident(s) domestique(s) avant le 9ème mois MED-186 -->        
        <assert          
            test="cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:value/@code='MED-186'"> 
            [E_historyOfPastIllness_CSE-SC9] Erreur de conformité :
            L'entrée FR-Probleme 'Accidents domestiques avant le 9ème mois' est obligatoire.
        </assert>       
        <assert test="cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:value/@code='MED-186']/cda:entryRelationship/@typeCode='CAUS'"> 
            [E_historyOfPastIllness_CSE-SC9] Erreur de conformité : 
            La cause de l'accident domestique doit être indiquée dans un élément entryRelationship d'attribut typeCode='CAUS'
        </assert>
                
    </rule> 
</pattern>

