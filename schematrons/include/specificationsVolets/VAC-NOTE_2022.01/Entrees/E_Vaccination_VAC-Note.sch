<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    E_Vaccination_VAC-Note.sch :
    
    Vérification de la conformité d'une entrée FR-Vaccination (1.3.6.1.4.1.19376.1.5.3.1.4.12)
    
    Historique :
    29/11/2022 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_Vaccination_VAC-Note">
    <p>Vérification de la conformité d'une entrée FR-Vaccination (1.3.6.1.4.1.19376.1.5.3.1.4.12)</p>
    
    <rule context="cda:substanceAdministration[./cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12']">
        
        <assert test="not(@negationInd) or @negationInd='false'"> 
            [E_Vaccination_VAC-Note] Erreur de conformité :
            Si présent, l'attribut @negationInd doit être égal à "false" puisque la vaccination a été effectuée. 
        </assert>
        
        <assert test="string-length(cda:effectiveTime/@value)>7 and not(cda:effectiveTime/@nullFlavor)">
            [E_Vaccination_VAC-Note] Erreur de conformité :
            Dans une note de vaccination, l’entrée FR-Vaccination doit contenir une date précise AAAAMMJJ dans l’élément effectiveTime.
        </assert>
        
        <assert test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code[@codeSystem='1.2.250.1.213.2.3.1']">
            [E_Vaccination_VAC-Note] Erreur de conformité :
            Dans une note de vaccination, le code CIS du vaccin est obligatoire. 
        </assert>
        <assert test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:translation[@codeSystem='2.16.840.1.113883.6.73']">
            [E_Vaccination_VAC-Note] Erreur de conformité :
            Dans une note de vaccination, le code ATC du vaccin est obligatoire. 
        </assert>
        <assert test="cda:author">
            [E_Vaccination_VAC-Note] Erreur de conformité :
            Dans une note de vaccination, l’élément "author" (personne ayant validé médicalement que la vaccination a été réalisée) est obligatoire. 
        </assert>
        <assert test="cda:author/cda:assignedAuthor/cda:id">
            [E_Vaccination_VAC-Note] Erreur de conformité :
            Dans une note de vaccination, l’identifiant de l’auteur "author/assignedAuthor/id" est obligatoire 
        </assert>
        <assert test="cda:author/cda:assignedAuthor/cda:code">
            [E_Vaccination_VAC-Note] Erreur de conformité :
            Dans une note de vaccination, la profession de l’auteur "author/assignedAuthor/code" est obligatoire
        </assert>
        <assert test="cda:author/cda:assignedAuthor/cda:assignedPerson/cda:name">
            [E_Vaccination_VAC-Note] Erreur de conformité :
            Dans une note de vaccination, le nom de l’auteur "author/assignedAuthor/assignedPerson/name" est obligatoire
        </assert>
        <assert test="cda:entryRelationship/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.82']/cda:statusCode/@code='completed'">
            [E_Vaccination_VAC-Note] Erreur de conformité :
            Dans une note de vaccination, l’élément "statutCode" doit être "completed" puisque la vaccination a été effectuée
        </assert>
        
        
    </rule>
</pattern>
