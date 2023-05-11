<?xml version="1.0" encoding="UTF-8"?>

<!-- E_problemStatusObservation_fr.sch
    
    Teste la conformité de l'entrée FR-Statut-du-probleme (1.3.6.1.4.1.19376.1.5.3.1.4.1.1)
    
    27/06/2017 : Création
    01/12/2020 : Renommé

-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_problemStatusObservation_fr">
    <title>CI-SIS FR-Statut-du-probleme (Problem Status Observation - 1.3.6.1.4.1.19376.1.5.3.1.4.1.1)</title>
        <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.1.1"]'>

            <assert test='cda:value[@xsi:type="CE" and (@codeSystem="2.16.840.1.113883.4.642.4.1373" or @codeSystem="2.16.840.1.113883.4.642.1.1074")] '>
                
                [E_problemStatusObservation_fr] Erreur de Conformité CI-SIS : Pour tout élément de type 'Problem Status', l'élément 'value' signale le statut clinique.
                Il est toujours représenté utilisant le datatype 'CE' (xsi:type='CE'). 
                Il sera codé à partir d'un jeu de valeurs provenant de :  HL7:condition-clinical OU HL7:allergyintolerance-clinical 
            </assert>

        </rule>
        
        
    </pattern>
    
        
