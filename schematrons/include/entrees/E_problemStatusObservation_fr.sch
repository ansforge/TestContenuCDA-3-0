<?xml version="1.0" encoding="UTF-8"?>

<!-- E_problemStatusObservation_fr.sch
    
    Teste la conformité de l'entrée FR-Statut-du-probleme (1.3.6.1.4.1.19376.1.5.3.1.4.1.1)
    
    27/06/2017 : Création
    01/12/2020 : Renommé
    03/01/2023 : MAJ du schematron

-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_problemStatusObservation_fr">
    <title>CI-SIS FR-Statut-du-probleme (Problem Status Observation - 1.3.6.1.4.1.19376.1.5.3.1.4.1.1)</title>
        <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.1.1"]'>
            
            <assert
                test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
                [E_problemStatusObservation_fr] Erreur de conformité CI-SIS : Dans l'élément 'Problem Status Observation', le format de base utilisé pour 
                représenter un problème utilise l'élément CDA 'observation' d'attribut classCode='OBS' pour
                signifier qu'il s'agit l'observation d'un problème, et moodCode='EVN', pour exprimer 
                que l'événement a déjà eu lieu. </assert>
            
            <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.57']
                and cda:templateId[@root='2.16.840.1.113883.10.20.1.50'] and cda:templateId[@root='1.2.250.1.213.1.1.3.30']">
                [1] [E_problemStatusObservation_fr] Erreur de conformité CI-SIS : 
                L'entrée "FR-Statut-du-probleme" doit comporter les 'templateId' suivants:
                - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.1.1"
                - Un deuxième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.57"
                - Un troisième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.50"
                - Un quatrième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.30"
            </assert>
            
            <assert test='cda:value[@xsi:type="CE" and (@codeSystem="2.16.840.1.113883.4.642.3.164" or @codeSystem="2.16.840.1.113883.4.642.3.1372")] '>
                
                [E_problemStatusObservation_fr] Erreur de Conformité CI-SIS : Pour tout élément de type 'Problem Status', l'élément 'value' signale le statut clinique.
                Il est toujours représenté utilisant le datatype 'CE' (xsi:type='CE'). 
                Il sera codé à partir d'un jeu de valeurs provenant de :  HL7:condition-clinical OU HL7:allergyintolerance-clinical 
            </assert>

        </rule>
        
        
    </pattern>
    
        
