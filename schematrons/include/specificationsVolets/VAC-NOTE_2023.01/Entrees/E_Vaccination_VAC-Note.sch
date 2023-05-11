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
        
        <assert test="string-length(cda:effectiveTime/@value)=8 and not(cda:effectiveTime/@nullFlavor)">
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
        <assert test="not(cda:entryRelationship/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.82']) or cda:entryRelationship/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.82']/cda:statusCode/@code='completed'">
            [E_Vaccination_VAC-Note] Erreur de conformité :
            Dans une note de vaccination, l’élément "statutCode" doit être "completed" puisque la vaccination a été effectuée
        </assert>
        <assert test="not(cda:entryRelationship/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.82']) or cda:entryRelationship/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.82']/cda:value[@value and contains(@xsi:type,'INT')]">
            [E_Vaccination_VAC-Note] Erreur de conformité :
            Dans une note de vaccination, l’élément "value" doit être présent avec l'attribut @value et @xsi:type = "INT"
        </assert>
        <assert test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:lotNumberText">
            [E_Vaccination_VAC-Note] Erreur de conformité :
            Dans une note de vaccination, le numéro de lot du vaccin est obligatoire. 
        </assert>
        
    </rule>
    <rule context="cda:substanceAdministration[./cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12']/cda:effectiveTime">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(
            ($L = 0) or
            ($L = 4) or 
            ($L = 6 and $mm &lt;= 12) or 
            ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or 
            ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)
            )">
            [IVL_TS.sch] Erreur de conformité CI-SIS : l'effectiveTime contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
    </rule>
</pattern>
