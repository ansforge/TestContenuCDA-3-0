<?xml version="1.0" encoding="UTF-8"?>

<!--  S_ResultatsEvenements_OBP-SCM.sch 
    
    Historique :
    03/11/2022 : ANS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_ResultatsEvenements_OBP-SCM">  
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.7.3.1.1.13.7"]'>  
        
        <assert test="cda:entry/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']/cda:code[@code='ORG-074']">
            [S_ResultatsEvenements_OBP-SCM] : L'entrée Mode de sortie (FR-Simple-Observation) doit être présente avec le code ORG-074
        </assert>
        <assert test="cda:entry/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']/cda:effectiveTime">
            [S_ResultatsEvenements_OBP-SCM] : La date de sortie est obligatoire
        </assert>
        <assert test="cda:entry/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']/cda:value">
            [S_ResultatsEvenements_OBP-SCM] : Le mode de sortie est obligatoire
        </assert>
        <assert test="not(cda:entry/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.37']) or cda:entry/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.37']/cda:value[@codeSystem='2.16.840.1.113883.6.3']">
            [S_ResultatsEvenements_OBP-SCM] : Si l'entrée Pathologie de suite de couches (FR-Problème) est présente, son élément value (Pathologie observée) est obligatoire et doit être codée en CIM-10
        </assert>
                
    </rule>
</pattern>