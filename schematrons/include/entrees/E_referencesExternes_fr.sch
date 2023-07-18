<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_referencesExternes_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-References-externes (1.2.250.1.213.1.1.3.35) aux spécifications du CI-SIS
    
    Historique :
    06/07/2023 : ANS : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_referencesExternes_fr">
    <title>Vérification de la conformité  de l'entrée FR-References-externes</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.35"]'>
        
        <assert
            test="self::cda:act[@classCode='ACT' and @moodCode='EVN']">
            [E_referencesExternes_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-References-externes(1.2.250.1.213.1.1.3.35), 
            les attributs de l'élément CDA 'observation' sont classCode='ACT' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-References-externes" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.4']">
            
            [E_referencesExternes_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-References-externes" doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.4"
        </assert>
        
        <assert test='count(cda:id)=1'>
            [E_referencesExternes_fr] : Erreur de conformité CI-SIS : L'élément "id" est obligatoirement présent une fois.
        </assert>
        
        <assert test='count(cda:code)=1 and cda:code/@nullFlavor="NA"'>
            [E_referencesExternes_fr] : Erreur de conformité CI-SIS : L'élément "cod"e doit être présent une fois et doit avoir l'attribut @nullFlavor="NA"
        </assert>
        
        <assert test="count(cda:text)=1"> 
            [E_referencesExternes_fr] : Erreur de conformité CI-SIS :  L'élément "text" est obligatoire[1..1]
             </assert>
        
        <assert test='count(cda:reference)&gt;=1 and (cda:reference/@typeCode="SPRT" or cda:reference/@typeCode="REFR")'>
            [E_referencesExternes_fr] : Erreur de conformité CI-SIS : L'élément "reference" doit être présent une fois ou plusieurs fois et et doit avoir l'attribut @typeCode="SPRT" or @typeCode="REFR".
        </assert>
        
        <assert test='cda:reference/cda:externalDocument[@classCode="DOC" and @moodCode="EVN"]'>
            [E_referencesExternes_fr] : Erreur de conformité CI-SIS : L'élément "externalDocument" doit être présent une fois et doit avoir les attributs suivants : .
            @classCode="DOC" and @moodCode="EVN".
        </assert>
        
        <assert test='cda:reference/cda:externalDocument/cda:id'>
            [E_referencesExternes_int] : Erreur de conformité CI-SIS : L'élément "externalDocument" doit contenir un "id" une seule fois[1..1].
        </assert>
    </rule>
    
</pattern>
