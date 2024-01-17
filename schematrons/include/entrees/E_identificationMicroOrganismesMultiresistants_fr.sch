<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_identificationMicroOrganismesMultiresistants.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-Identification-micro-organismes-multiresistants (1.2.250.1.213.1.1.3.48.5)
    aux spécifications du CI-SIS
    
    Historique :
    31/05/21 : SBM : Création
    12/01/2024 : MAJ du schematron
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_identificationMicroOrganismesMultiresistants_fr">
    <title>CI-SIS identification microOrganismes multiresistants</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.48.5"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_identificationMicroOrganismesMultiresistants_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Identification-micro-organismes-multiresistants (1.2.250.1.213.1.1.3.48.5), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-Identification-micro-organismes-multiresistants" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'] and cda:templateId[@root='1.2.250.1.213.1.1.3.48']">
            
            [1] [E_identificationMicroOrganismesMultiresistants_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Identification-micro-organismes-multiresistants  doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.13"
            - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.48" 
        </assert>
        
        <!-- Test présence de l'élément 'id' -->
        <assert test='count(cda:id)=1'>
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une fois.
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test='count(cda:code)=1 and cda:code/@code="MED-144" and cda:code/@codeSystem="1.2.250.1.213.1.1.4.322"'>
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='MED-144' et
            le codeSystem='1.2.250.1.213.1.1.4.322'.
        </assert>
        
        <!-- Test présence de l'élément 'text' -->
        <assert test='count(cda:text)=1'>
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : L'élément text doit être présent une fois[1..1].
        </assert>
        
        <!-- Test présence de l'élément 'statusCode' -->
        <assert test="cda:statusCode[@code='completed']"> 
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </assert>
        
        <!-- Test présence de l'élément 'effectiveTime' -->
        <assert test='count(cda:effectiveTime)=1'>
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </assert>
        
        <!-- Test présence de l'élément 'value' -->
        <assert test='count(cda:value)=1'>
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois.
        </assert>
        
        <!-- Test de l'élément 'author' -->
        <assert test='count(cda:author)&lt;=1'>
            [E_identificationMicroOrganismesMultiresistants_fr] : Erreur de conformité CI-SIS : L'élément author doit être présent maximum une fois [0..1].
        </assert>
    </rule>
    
</pattern>