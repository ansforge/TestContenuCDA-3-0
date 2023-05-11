<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    E_FR-Traitement_CNAM-HR.sch :
    
    Vérification de la conformité d'une entrée FR-Traitement (1.3.6.1.4.1.19376.1.5.3.1.4.7)
    
    Historique :
    13/01/2021 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_FR-Traitement_CNAM-HR">
    <p>Vérification de la conformité d'une entrée FR-Traitement (1.3.6.1.4.1.19376.1.5.3.1.4.7)</p>
    <rule context="*[cda:templateId/@root = '1.2.250.1.213.1.1.3.42']">


        <assert test="cda:templateId[@root = '1.3.6.1.4.1.19376.1.5.3.1.4.7.1']">
            [E_FR-Traitement_CNAM-HR] Erreur de conformité : Une entrée FR-Traitement
            ('1.3.6.1.4.1.19376.1.5.3.1.4.7') doit avoir un templateId@root
            '1.3.6.1.4.1.19376.1.5.3.1.4.7.1'. </assert>

        <assert test="cda:effectiveTime/cda:low[@nullFlavor = 'UNK'] and
            cda:effectiveTime/cda:high[@nullFlavor = 'UNK']"> 
            [E_FR-Traitement_CNAM-HR] Erreur de conformité :
            Une entrée FR-Traitement ('1.3.6.1.4.1.19376.1.5.3.1.4.7') doit avoir un effectiveTime/low/@nullFlavor 'UNK' and effectiveTime/high/@nullFlavor 'UNK'. 
        </assert>
        
        <assert test="(cda:entryRelationship/cda:supply[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.3']/cda:performer/cda:assignedEntity/cda:id[@nullFlavor = 'UNK'])
            or (not(cda:entryRelationship[cda:supply/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.3']]))"> 
            [E_FR-Traitement_CNAM-HR] Erreur de conformité :
            Une entrée FR-Traitement ('1.3.6.1.4.1.19376.1.5.3.1.4.7') doit avoir un entryRelationship/supply/performer/assignedEntity/id/@nullFlavor 'UNK'. 
        </assert>
    </rule>
</pattern>
