<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_referencesExternes_int.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée IHE External Reference Entry aux spécifications du profil IHE PCC
    
    Historique :
    06/07/2023 : ANS : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_referencesExternes_int">
    <title>Vérification de la conformité  de l'entrée "IHE External Reference Entry"</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.4"]'>
        
        <assert
            test="self::cda:act[@classCode='ACT' and @moodCode='EVN']">
            [E_referencesExternes_int] Erreur de conformité IHE PCC : Dans l'entrée IHE External Reference Entry
            les attributs de l'élément CDA 'observation' sont classCode='ACT' et moodCode='EVN'</assert>
        
        <assert test='count(cda:id)=1'>
            [E_referencesExternes_int] : Erreur de conformité IHE PCC: L'élément "id" est obligatoirement présent une fois.
        </assert>
        
        <assert test='count(cda:code)=1 and cda:code/@nullFlavor="NA"'>
            [E_referencesExternes_int] : Erreur de conformité IHE PCC : L'élément "code" doit être présent une fois et doit avoir l'attribut @nullFlavor="NA"
        </assert>
        
        <assert test="count(cda:text)=1"> 
            [E_referencesExternes_int] : Erreur de conformité IHE PCC :  L'élément "text" est obligatoire[1..1]
        </assert>
        
        <assert test='count(cda:reference)&gt;=1 and (cda:reference/@typeCode="SPRT" or cda:reference/@typeCode="REFR")'>
            [E_referencesExternes_int] : Erreur de conformité IHE PCC : L'élément "reference" doit être présent une fois ou plusieurs fois et et doit avoir l'attribut @typeCode="SPRT" or @typeCode="REFR".
        </assert>
        
        <assert test='cda:reference/cda:externalDocument[@classCode="DOC" and @moodCode="EVN"]'>
            [E_referencesExternes_int] : Erreur de conformité IHE PCC : L'élément "externalDocument" doit être présent une fois et doit avoir les attributs suivants :
            @classCode="DOC" and @moodCode="EVN".
        </assert>
        
        <assert test='cda:reference/cda:externalDocument/cda:id'>
            [E_referencesExternes_int] : Erreur de conformité IHE PCC : L'élément "externalDocument" doit contenir un "id" une seule fois[1..1].
        </assert>
    </rule>
    
</pattern>
