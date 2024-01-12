<?xml version="1.0" encoding="UTF-8"?><schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cda="urn:hl7-org:v3" xmlns:lab="urn:oid:1.3.6.1.4.1.19376.1.3.2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" defaultPhase="Struct_minimale" queryBinding="xslt2" schemaVersion="CI-SIS_StructurationMinimale.sch">
    <title>Rapport de conformité du document aux spécifications françaises (en-tête)</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    <ns prefix="lab" uri="urn:oid:1.3.6.1.4.1.19376.1.3.2"/>

    

    
    <!--Suppressed abstract pattern IVL_TS was here-->
    <!--Suppressed abstract pattern dansJeuDeValeurs was here-->   
    

    
    
    <!--Suppressed abstract pattern abstractImmunization was here-->
    
    
    <pattern id="addr">
    <rule context="cda:addr">
        <let name="nba" value="count(@*)"/>
        <let name="nbch" value="count(*)"/>
        <let name="val" value="@*"/>
        <assert test="(             ($nba = 0 and $nbch &gt; 0) or             ($nba and name(@*) = 'use' and $nbch &gt; 0) or              ($nba = 1 and name(@*) = 'nullFlavor' and $nbch = 0 and             ($val = 'UNK' or $val = 'NASK' or $val = 'ASKU' or $val = 'NAV' or $val = 'MSK'))              )">
            [addr.sch] Erreur de conformité CI-SIS : <name/> ne contient pas un attribut autorisé pour une adresse, 
            ou est vide et sans nullFlavor, ou contient une valeur de nullFlavor non admise.
        </assert>
        <assert test="$nbch = 0 or                         (cda:streetAddressLine and not(cda:postalCode) and not(cda:city) and not(cda:country) and not(cda:state)                         and not(cda:houseNumber) and not(cda:streetName)and not(cda:additionalLocator) and not(cda:unitID)                         and not(cda:postBox) and not(cda:precinct)) or                         (not(cda:streetAddressLine))                         ">
            [addr.sch] Erreur de conformité CI-SIS : <name/> doit être structuré : 
            - soit sous la formes de lignes d'adresse (streetAddressLine)
            - soit sous la forme de composants élémentaires d'adresse
        </assert>
    </rule>
</pattern>   
    <pattern id="assignedAuthor_fr">
    
    <rule context="assignedAuthor">
        <let name="count_id" value="count(cda:id)"/>
        <assert test="$count_id &lt;= 1"> [assignedAuthor_fr.sch] Erreur de conformité CI-SIS :
            L'élément "id" ne peut être présent qu'une seule fois (cardinalité [0..1]) dans une assignedAuthor </assert>
        <assert test="not(cda:id) or(cda:id and (cda:id[@root] and cda:id[@extension]) or cda:id[@nullFlavor])">
            [assignedAuthor_fr.sch] Erreur de conformité CI-SIS : S'il existe, l'élément "id" doit comportant les
            attibuts @root et @extension </assert>
        
    </rule>
    
    
    <rule context="cda:assignedAuthor/cda:representedOrganization">
        <let name="count_representedOrganization_name" value="count(cda:name)"/>
        
        
        <assert test="not(cda:id) or (cda:id and cda:id[@root = '1.2.250.1.71.4.2.2'])">
            [assignedAuthor_fr.sch] Erreur de conformité CI-SIS : Lorsqu'il est présent, l'élément
            representedOrganization/id doit avoir l'attribut@root='1.2.250.1.71.4.2.2' </assert>
        <assert test="$count_representedOrganization_name &lt;= 1"> [assignedAuthor_fr.sch] Erreur
            de conformité CI-SIS : L'élément representedOrganization/name ne peut être présent
            qu'une seule fois (cardinalité [0..1]) </assert>
        
    </rule>
    
    <rule context="cda:assignedAuthor/cda:assignedPerson">
        <let name="count_assignedPerson_name" value="count(cda:name)"/>
        <let name="count_assignedPerson_family" value="count(cda:name/cda:family)"/>
        <let name="count_assignedPerson_given" value="count(cda:name/cda:given)"/>
        <let name="count_assignedPerson_prefix" value="count(cda:name/cda:prefix)"/>
        <let name="count_assignedPerson_suffix" value="count(cda:name/cda:suffix)"/>
        
        <assert test="cda:name or @nullFlavor"> [assignedAuthor_fr.sch] Erreur de conformité CI-SIS
            : Si l'élément assignedPerson n'est pas vide avec un nullFlavor, alors il doit comporter
            un élément fils "name" (nullFlavor autorisé). </assert>
        <assert test="$count_assignedPerson_name = 1"> [assignedAuthor_fr.sch] Erreur de conformité
            CI-SIS : L'élément assignedPerson doit contenir un seul et unique élément name </assert>
        <assert test="$count_assignedPerson_family = 1"> [assignedAuthor_fr.sch] Erreur de
            conformité CI-SIS : L'élément assignedPerson/name/family doit être présent et qu'une
            seule fois (cardinalité [1..1]) </assert>
        <assert test="$count_assignedPerson_given &lt;= 1"> [assignedAuthor_fr.sch] Erreur de
            conformité CI-SIS : l'élément assignedPerson/name/given ne peut être présent qu'une
            seule fois (cardinalité [0..1]) </assert>
        <assert test="$count_assignedPerson_prefix &lt;= 1"> [assignedAuthor_fr.sch] Erreur de
            conformité CI-SIS : l'élément assignedPerson/name/prefix ne peut être présent qu'une
            seule fois (cardinalité [0..1]) </assert>
        <assert test="$count_assignedPerson_suffix &lt;= 1"> [assignedAuthor_fr.sch] Erreur de
            conformité CI-SIS : l'élément assignedPerson/name/suffix ne peut être présent qu'une
            seule fois (cardinalité [0..1]) </assert>
        <assert test="not(cda:name/cda:prefix) or (cda:name/cda:prefix and cda:name/cda:prefix = 'M' or cda:name/cda:prefix = 'MLLE' or cda:name/cda:prefix = 'MME'             or cda:name/cda:prefix = 'DR' or cda:name/cda:prefix = 'MC' or cda:name/cda:prefix = 'MG' or cda:name/cda:prefix = 'PC' or cda:name/cda:prefix = 'PG' or cda:name/cda:prefix = 'PR' or cda:name/cda:prefix/@nullFlavor)"> [assignedAuthor_fr.sch] Erreur de
            conformité CI-SIS : l'élément assignedPerson/name/prefix doit faire partie de la table de référence  TRE_R81-Civilite ('M' ou 'MLLE' ou 'MME')
            ou TRE_R11-CiviliteExercice ('DR' ou 'MC' ou 'MG' ou 'PC' ou 'PG' ou 'PR')</assert>
        <assert test="not(cda:name/cda:suffix) or (cda:name/cda:suffix and cda:name/cda:suffix = 'DR' or cda:name/cda:suffix = 'MC' or cda:name/cda:suffix = 'MG'             or cda:name/cda:suffix = 'PC' or cda:name/cda:suffix = 'PG' or cda:name/cda:suffix = 'PR' or cda:name/cda:prefix/@nullFlavor)"> [assignedAuthor_fr.sch] Erreur de
            conformité CI-SIS : l'élément  assignedPerson/name/suffix doit faire partie de la table de référence TRE_R11-CiviliteExercice ('DR' ou 'MC' ou 'MG' ou 'PC' ou 'PG' ou 'PR')
        </assert>
    </rule>
</pattern>
    <pattern id="assignedEntity_fr">

    <rule context="cda:assignedEntity">
        <let name="count_id" value="count(cda:id)"/>
        <assert test="$count_id = 1"> [assignedEntity_fr.sch] Erreur de conformité CI-SIS :
            L'élément "id" ne doit être présent qu'une seule et unique fois dans une assignedEntity </assert>
        <assert test="(cda:id[@root] and cda:id[@extension]) or cda:id[@nullFlavor]">
            [assignedEntity_fr.sch] Erreur de conformité CI-SIS : L'élément "id" doit comportant les
            attibuts @root et @extension </assert>

    </rule>

    
    <rule context="cda:assignedEntity/cda:representedOrganization">
        <let name="count_representedOrganization_id" value="count(cda:id)"/>
        <let name="count_representedOrganization_name" value="count(cda:name)"/>

        
        <assert test="not(cda:id) or (cda:id and cda:id[@root = '1.2.250.1.71.4.2.2'])">
            [assignedEntity_fr.sch] Erreur de conformité CI-SIS : Lorsqu'il est présent, l'élément
            representedOrganization/id doit avoir l'attribut@root='1.2.250.1.71.4.2.2' </assert>
        <assert test="$count_representedOrganization_name &lt;= 1"> [assignedEntity_fr.sch] Erreur
            de conformité CI-SIS : L'élément representedOrganization/name ne peut être présent
            qu'une seule fois (cardinalité [0..1]) </assert>

    </rule>
    
    <rule context="cda:assignedEntity/cda:assignedPerson">
        <let name="count_assignedPerson_name" value="count(cda:name)"/>
        <let name="count_assignedPerson_family" value="count(cda:name/cda:family)"/>
        <let name="count_assignedPerson_given" value="count(cda:name/cda:given)"/>
        <let name="count_assignedPerson_prefix" value="count(cda:name/cda:prefix)"/>
        <let name="count_assignedPerson_suffix" value="count(cda:name/cda:suffix)"/>
        
        <assert test="cda:name or @nullFlavor"> [assignedEntity_fr.sch] Erreur de conformité CI-SIS
            : Si l'élément assignedPerson n'est pas vide avec un nullFlavor, alors il doit comporter
            un élément fils "name" (nullFlavor autorisé). </assert>
        <assert test="$count_assignedPerson_name = 1"> [assignedEntity_fr.sch] Erreur de conformité
            CI-SIS : L'élément assignedPerson doit contenir un seul et unique élément name </assert>
        <assert test="$count_assignedPerson_family = 1"> [assignedEntity_fr.sch] Erreur de
            conformité CI-SIS : L'élément assignedPerson/name/family doit être présent et qu'une
            seule fois (cardinalité [1..1]) </assert>
        <assert test="$count_assignedPerson_given &lt;= 1"> [assignedEntity_fr.sch] Erreur de
            conformité CI-SIS : l'élément assignedPerson/name/given ne peut être présent qu'une
            seule fois (cardinalité [0..1]) </assert>
        <assert test="$count_assignedPerson_prefix &lt;= 1"> [assignedEntity_fr.sch] Erreur de
            conformité CI-SIS : l'élément assignedPerson/name/prefix ne peut être présent qu'une
            seule fois (cardinalité [0..1]) </assert>
        <assert test="$count_assignedPerson_suffix &lt;= 1"> [assignedEntity_fr.sch] Erreur de
            conformité CI-SIS : l'élément assignedPerson/name/suffix ne peut être présent qu'une
            seule fois (cardinalité [0..1]) </assert>
        <assert test="not(cda:name/cda:prefix) or (cda:name/cda:prefix and cda:name/cda:prefix = 'M' or cda:name/cda:prefix = 'MLLE' or cda:name/cda:prefix = 'MME'             or cda:name/cda:prefix = 'DR' or cda:name/cda:prefix = 'MC' or cda:name/cda:prefix = 'MG' or cda:name/cda:prefix = 'PC' or cda:name/cda:prefix = 'PG' or cda:name/cda:prefix = 'PR' or cda:name/cda:prefix/@nullFlavor)"> [assignedEntity_fr.sch] Erreur de
            conformité CI-SIS : l'élément assignedPerson/name/prefix doit faire partie de la table de référence  TRE_R81-Civilite ('M' ou 'MLLE' ou 'MME')
            ou TRE_R11-CiviliteExercice ('DR' ou 'MC' ou 'MG' ou 'PC' ou 'PG' ou 'PR')</assert>
        <assert test="not(cda:name/cda:suffix) or (cda:name/cda:suffix and cda:name/cda:suffix = 'DR' or cda:name/cda:suffix = 'MC' or cda:name/cda:suffix = 'MG'             or cda:name/cda:suffix = 'PC' or cda:name/cda:suffix = 'PG' or cda:name/cda:suffix = 'PR' or cda:name/cda:prefix/@nullFlavor)"> [assignedEntity_fr.sch] Erreur de
            conformité CI-SIS : l'élément  assignedPerson/name/suffix doit faire partie de la table de référence TRE_R11-CiviliteExercice ('DR' ou 'MC' ou 'MG' ou 'PC' ou 'PG' ou 'PR')
        </assert>
    </rule>
</pattern>
    <pattern id="associatedEntity_fr">
    
    <rule context="cda:associatedEntity">
        <let name="count_id" value="count(cda:id)"/>
        <assert test="$count_id &lt;= 1"> [associatedEntity_fr.sch] Erreur de conformité CI-SIS :
            L'élément "id" ne peut être présent qu'une seule fois (cardinalité [0..1]) dans une associatedEntity </assert>
        <assert test="not(cda:id) or(cda:id and (cda:id[@root] and cda:id[@extension]) or cda:id[@nullFlavor] or cda:id)">
            [associatedEntity_fr.sch] Erreur de conformité CI-SIS : S'il existe, l'élément "id" doit comportant les
            attibuts @root et @extension </assert>
    </rule>
    
    
    <rule context="cda:associatedEntity/cda:scopingOrganization">
        <let name="count_scopingOrganization_name" value="count(cda:name)"/>
        
        
        <assert test="not(cda:id) or (cda:id and cda:id[@root])">
            [associatedEntity_fr.sch] Erreur de conformité CI-SIS : Lorsqu'il est présent, l'élément
            scopingOrganization/id doit avoir l'attribut @root</assert>
        <assert test="$count_scopingOrganization_name &lt;= 1"> [associatedEntity_fr.sch] Erreur
            de conformité CI-SIS : L'élément scopingOrganization/name ne peut être présent
            qu'une seule fois (cardinalité [0..1]) </assert>
        
    </rule>
    
    <rule context="cda:associatedEntity/cda:associatedPerson">
        <let name="count_associatedPerson_name" value="count(cda:name)"/>
        <let name="count_associatedPerson_family" value="count(cda:name/cda:family)"/>
        <let name="count_associatedPerson_given" value="count(cda:name/cda:given)"/>
        <let name="count_associatedPerson_prefix" value="count(cda:name/cda:prefix)"/>
        <let name="count_associatedPerson_suffix" value="count(cda:name/cda:suffix)"/>
        
        <assert test="cda:name or @nullFlavor"> [associatedEntity_fr.sch] Erreur de conformité CI-SIS
            : Si l'élément associatedPerson n'est pas vide avec un nullFlavor, alors il doit comporter
            un élément fils "name" (nullFlavor autorisé). </assert>
        <assert test="$count_associatedPerson_name = 1"> [associatedEntity_fr.sch] Erreur de conformité
            CI-SIS : L'élément associatedPerson doit contenir un seul et unique élément name </assert>
        <assert test="$count_associatedPerson_family = 1"> [associatedEntity_fr.sch] Erreur de
            conformité CI-SIS : L'élément associatedPerson/name/family doit être présent et qu'une
            seule fois (cardinalité [1..1]) </assert>
        <assert test="$count_associatedPerson_given &lt;= 1"> [associatedEntity_fr.sch] Erreur de
            conformité CI-SIS : l'élément associatedPerson/name/given ne peut être présent qu'une
            seule fois (cardinalité [0..1]) </assert>
        <assert test="$count_associatedPerson_prefix &lt;= 1"> [associatedEntity_fr.sch] Erreur de
            conformité CI-SIS : l'élément associatedPerson/name/prefix ne peut être présent qu'une
            seule fois (cardinalité [0..1]) </assert>
        <assert test="$count_associatedPerson_suffix &lt;= 1"> [associatedEntity_fr.sch] Erreur de
            conformité CI-SIS : l'élément associatedPerson/name/suffix ne peut être présent qu'une
            seule fois (cardinalité [0..1]) </assert>
        <assert test="not(cda:name/cda:prefix) or (cda:name/cda:prefix and cda:name/cda:prefix = 'M' or cda:name/cda:prefix = 'MLLE' or cda:name/cda:prefix = 'MME'             or cda:name/cda:prefix = 'DR' or cda:name/cda:prefix = 'MC' or cda:name/cda:prefix = 'MG' or cda:name/cda:prefix = 'PC' or cda:name/cda:prefix = 'PG' or cda:name/cda:prefix = 'PR' or cda:name/cda:prefix/@nullFlavor)"> [associatedEntity_fr.sch] Erreur de
            conformité CI-SIS : l'élément assignedPerson/name/prefix doit faire partie de la table de référence  TRE_R81-Civilite ('M' ou 'MLLE' ou 'MME')
            ou TRE_R11-CiviliteExercice ('DR' ou 'MC' ou 'MG' ou 'PC' ou 'PG' ou 'PR')</assert>
        <assert test="not(cda:name/cda:suffix) or (cda:name/cda:suffix and cda:name/cda:suffix = 'DR' or cda:name/cda:suffix = 'MC' or cda:name/cda:suffix = 'MG'             or cda:name/cda:suffix = 'PC' or cda:name/cda:suffix = 'PG' or cda:name/cda:suffix = 'PR' or cda:name/cda:prefix/@nullFlavor)"> [associatedEntity_fr.sch] Erreur de
            conformité CI-SIS : l'élément associatedPerson/name/suffix doit faire partie de la table de référence TRE_R11-CiviliteExercice ('DR' ou 'MC' ou 'MG' ou 'PC' ou 'PG' ou 'PR')
        </assert>
    </rule>
</pattern>
    <pattern id="authenticator_fr">
    <rule context="cda:authenticator">
        <assert test="cda:time[@value] or cda:time[@nullFlavor]">
           [authenticator_fr.sch] Erreur de conformité CI-SIS :  L'élément time doit contenir l'attribut @value ou un attribut nullFlavor
        </assert>
        <assert test="cda:signatureCode[@code='S']"> 
            [authenticator] Erreur de conformité CI-SIS : L'élément code doit contenir l'attribut @code fixé à la valeur 'S' (pour signed)
        </assert>
    </rule>
</pattern>
    <pattern id="author_fr">
    <rule context="cda:ClinicalDocument/cda:author">
       <assert test="cda:time[@value] or cda:time[@nullFlavor]">
           [author_fr] L'élément "time" dans "author" doit être présent et renseigné.
       </assert>
    </rule>
</pattern>
    <pattern id="componentOf_fr">
    <rule context="cda:componentOf/cda:encompassingEncounter">
        <assert test="count(cda:location) &lt;= 1">
            [componentOf_fr.sch] Erreur de conformité au CI-SIS : L'élément encompassingEncounter/location ne peut être présent qu'une seule fois au maximum [0..1].
        </assert>
    </rule>
    <rule context="cda:componentOf/cda:encompassingEncounter/cda:id">
        <assert test="@root">
            [componentOf_fr.sch] Erreur de conformité au CI-SIS : L'élément encompassingEncounter/id doit contenir un attribut @root
        </assert>         
    </rule>
    <rule context="cda:componentOf/cda:encompassingEncounter/cda:code">
        <assert test="@code and @codeSystem and @displayName">
            [componentOf_fr.sch] Erreur de conformité au CI-SIS : L'élément encompassingEncounter/code doit contenir les attributs @code, @codeSystem et @displayName
        </assert>
    </rule>
    <rule context="cda:componentOf/cda:encompassingEncounter/cda:dischargeDispositionCode">
        <assert test="@code and @displayName">
            [componentOf_fr.sch] Erreur de conformité au CI-SIS : Les attributs @code et @displayName doit être présent lorque l'élément dischargeDispositionCode est présent
        </assert>
        <assert test="not(@codeSystem) or (@codeSystem and @codeSystem='1.2.250.1.213.2.14')">
            [componentOf_fr.sch] Erreur de conformité au CI-SIS : L'attribut codeSystem doit avoir la valeur '1.2.250.1.213.2.14' lorsqu'il est présent
        </assert>
    </rule>
  
</pattern>
    <pattern id="custodian_fr">
    <rule context="cda:representedCustodianOrganization">
        <let name="count_id" value="count(cda:id)"/>
        <assert test="cda:id[@root='1.2.250.1.71.4.2.2'] or cda:id[@root='1.2.250.1.213.4.1'] or cda:id[@nullFlavor]">
            [custodian_fr.sch] Erreur de conformité CI-SIS : L'élément representedCustodianOrganization/id doit être présent et doit contenir l'attribut @root soit à la valeur "1.2.250.1.71.4.2.2" ou "1.2.250.1.213.4.1"
        </assert>
        <assert test="$count_id = 1">
            [custodian_fr.sch] Erreur de conformité CI-SIS : L'élément representedCustodianOrganization/id doit être présent qu'une seule fois 
        </assert>
       
    </rule>
</pattern>
    <pattern id="documentationOf_fr">
   
    <rule context="cda:documentationOf">
        <assert test="cda:serviceEvent"> 
            [documentationOf_fr] Erreur de conformité CI-SIS : L'élément serviceEvent doit être présent
        </assert>
      
    </rule>
    <rule context="cda:documentationOf/cda:serviceEvent">
       
        <assert test="not(cda:code) or(cda:code and cda:code[@code] and cda:code[@codeSystem] and cda:code[@displayName]) or (cda:code and cda:code[@nullFlavor])">
            [documentationOf_fr] Erreur de conformité CI-SIS : Lorsqu'il est présent, l'élément code doit contenir les attributs @code, @codeSystem et @displayName ou l’attribut @nullFlavor.
        </assert>
        
        <assert test="cda:performer[@typeCode='PRF'] or not(cda:performer)">
            [documentationOf_fr] Erreur de conformité CI-SIS : L'élément serviceEvent/performer, si présent, doit comporter l'attribut @typeCode fixé à "PRF"
        </assert>
        
        <assert test="count(cda:performer) &lt; 2">
            [documentationOf_fr] Erreur de conformité CI-SIS : l'en-tête CDA doit comporter au maximum un seul documentationOf/serviceEvent 
            avec un élément fils performer. </assert>
        
    </rule>
    <rule context="cda:documentationOf/cda:serviceEvent/cda:effectiveTime">
        <assert test="cda:low and not(@nullFlavor)">
            [documentationOf_fr] Erreur de conformité CI-SIS : L'élément effectiveTime du serviceEvent, si présent, ne peut être en nullFlavor et comporte obligatoirement un élément low
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:performer">
        
        <assert test="not(@nullFlavor)">
            [documentationOf_fr] Erreur de conformité CI-SIS : L'élément documentationOf/serviceEvent/performer doit être renseigné sans nullFlavor. </assert>
        
        <assert test="cda:assignedEntity/cda:representedOrganization/cda:standardIndustryClassCode">
            [documentationOf_fr] Erreur de conformité CI-SIS : L'élément documentationOf/serviceEvent/performer correspondant à l'acte principal documenté, 
            doit comporter un descendant assignedEntity/representedOrganization/standardIndustryClassCode. </assert>
        
    </rule>
    
</pattern>
    <!--Start pattern based on abstract IVL_TS--><pattern id="documentEffectiveTime">
    <p>
        Vérification de la conformité au CI-SIS d'un élément de type IVL_TS ou TS du standard CDAr2 :
        L'élément doit porter soit un attribut "value" soit un intervalle éventuellement semi-borné de sous-éléments "low", "high". 
        Alternativement, si l'attribut nullFlavor est autorisé, il doit porter l'une des valeurs admises par le CI-SIS. 
    </p>
    <rule context="cda:ClinicalDocument/cda:effectiveTime">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            [IVL_TS.sch] Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/effectiveTime'"/>/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
        <assert test="(@* and not(*)) or (not(@*) and *)">
            [IVL_TS.sch] Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/effectiveTime'"/> doit contenir soit un attribut soit des éléments fils.
        </assert>
        <assert test="(             (name(@*) = 'nullFlavor' and 0 and             (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or             (name(@*) != 'nullFlavor')              )">
            [IVL_TS.sch] Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/effectiveTime'"/> contient un 'nullFlavor' non autorisé ou porteur d'une valeur non admise.
        </assert>  
        
        
        <assert test="not(cda:low and cda:high) or cda:high/@value &gt; cda:low/@value or cda:high/@nullFlavor">
            [IVL_TS.sch] Erreur de conformité CDA : L'élément de temps 'high' doit être supérieur à l'élément de temps 'low'
        </assert>
        
    </rule> 

    <rule context="cda:ClinicalDocument/cda:effectiveTime/cda:low">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            [IVL_TS.sch] Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/effectiveTime'"/>/low/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:effectiveTime/cda:high">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            [IVL_TS.sch] Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/effectiveTime'"/>/high/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
     </rule>       

</pattern>
    <pattern id="informantRelatedEntity_fr">
    <rule context="cda:informant/cda:relatedEntity">
        <let name="count_name" value="count(cda:relatedPerson/cda:name)"/>
        <let name="count_family" value="count(cda:relatedPerson/cda:name/cda:family)"/>
        <let name="count_given" value="count(cda:relatedPerson/cda:name/cda:given)"/>
        
        <assert test="((name(@*) = 'classCode') and              (@* = 'ECON' or @* = 'NOK' or @* = 'CON' or @*='CAREGIVER' or @*='PAT')                     )">
            [informantRelatedEntity_fr.sch] Erreur de conformité CI-SIS : L'élément informant/relatedEntity doit avoir un attribut classCode dont la valeur est dans l'ensemble :
            (ECON, NOK, CON, CAREGIVER, PAT).
        </assert>
        <assert test="count(./cda:addr) &gt;= 0">
            [informantRelatedEntity_fr.sch] Erreur de conformité CI-SIS : L'élément informant/relatedEntity peut comporter [0..*] adresse géographique (nullFlavor autorisé)
        </assert>
        <assert test="count(./cda:telecom) &gt;= 0">
            [informantRelatedEntity_fr.sch] Erreur de conformité CI-SIS : L'élément informant/relatedEntity peut comporter [0..*] adresse telecom (nullFlavor autorisé)
        </assert>
        <assert test="$count_name = 1">
            [informantRelatedEntity_fr.sch] Erreur de conformité CI-SIS : L'élément informant/relatedEntity/relatedPerson/name doit être présent, mais qu'une seule fois (cardinalité [1..1])
        </assert>
        <assert test="$count_family = 1">
            [informantRelatedEntity_fr.sch] Erreur de conformité CI-SIS : L'élément informant/relatedEntity/relatedPerson/name/family doit être présent, mais qu'une seule fois (cardinalité [1..1])      
        </assert>
        <assert test="$count_given &lt;= 1">
            [informantRelatedEntity_fr.sch] Erreur de conformité CI-SIS : L'élément informant/relatedEntity/relatedPerson/name/family doit être présent au maximum qu'une seule fois (cardinalité [0..1])
        </assert>
    </rule>
</pattern>
    <pattern id="informationRecipient_fr">
    <rule context="cda:informationRecipient/cda:intendedRecipient">
        <let name="count_id" value="count(cda:id)"/>
        <let name="count_informationRecipient" value="count(cda:informationRecipient)"/>
        <assert test="not(cda:id) or (cda:id[@root='1.2.250.1.71.4.2.1'] and cda:id[@extension])">
            [informationRecipient_fr.sch] Erreur de conformité au CI-SIS : L'élément intendedRecipient/id si présent doit avoir l'attribut @root fixé à "1.2.250.1.71.4.2.1" et l'attribut @extension doit être présent
        </assert>
        
        <assert test="$count_informationRecipient &lt;= 1">
            [informationRecipient_fr.sch] Erreur de conformité au CI-SIS : L'élément intendedRecipient/informationRecipient ne peut être présent qu'une seule fois au maximum(cardinalité [0..1])
        </assert>
    </rule>
    
    <rule context="cda:informationRecipient/cda:intendedRecipient/cda:receivedOrganization">
        <let name="count_id" value="count(cda:id)"/>
        <let name="count_name" value="count(cda:name)"/>
        <assert test="$count_id &gt;= 0">
            [informationRecipient_fr.sch] Erreur de conformité au CI-SIS : L'élément intendedRecipient/receivedOrganization/id peut être présent 0 ou plusieurs fois (cardinalité [0..*])
        </assert>
        <assert test="$count_name &gt;= 0">
            [informationRecipient_fr.sch] Erreur de conformité au CI-SIS : L'élément intendedRecipient/receivedOrganization/name peut être présent 0 ou plusieurs fois (cardinalité [0..*])
        </assert>
        
    </rule>
    
    <rule context="cda:informationRecipient/cda:intendedRecipient/cda:informationRecipient">
        <let name="count_name" value="count(cda:name)"/>
        <let name="count_family" value="count(cda:name/cda:family)"/>
        <let name="count_given" value="count(cda:name/cda:given)"/>
        <let name="count_prefix" value="count(cda:name/cda:prefix)"/>
        <let name="count_suffix" value="count(cda:name/cda:suffix)"/>
        
        <assert test="$count_name &gt;= 0">
            [informationRecipient_fr.sch] Erreur de conformité au CI-SIS : L'élément intendRecipient/informationRecipient/name peut être présent 0 ou plusieurs fois (cardinalité [0..*])
        </assert>
        <assert test="$count_family=1">
            [informationRecipient_fr.sch] Erreur de conformité au CI-SIS : L'élément intendedRecipient/informationRecipient/name/family doit être présent, mais qu'une seule fois (cardinalité [1..1])
        </assert>
        <assert test="$count_given &lt;=1">
            [informationRecipient_fr.sch] Erreur de conformité au CI-SIS : L'élément intendedRecipient/informationRecipient/name/given ne peut être présent qu'une seule fois au maximum (cardinalité [0..1])
        </assert>
        <assert test="$count_prefix &lt;=1">
            [informationRecipient_fr.sch] Erreur de conformité au CI-SIS : L'élément intendedRecipient/informationRecipient/name/prefix ne peut être présent qu'une seule fois au maximum (cardinalité [0..1])
        </assert>
        <assert test="$count_suffix &lt;=1">
            [informationRecipient_fr.sch] Erreur de conformité au CI-SIS : L'élément intendedRecipient/informationRecipient/name/suffix ne peut être présent qu'une seule fois au maximum (cardinalité [0..1])
        </assert>
        <assert test="not(cda:name/cda:prefix) or (cda:name/cda:prefix and cda:name/cda:prefix = 'M' or cda:name/cda:prefix = 'MLLE' or cda:name/cda:prefix = 'MME'             or cda:name/cda:prefix = 'DR' or cda:name/cda:prefix = 'MC' or cda:name/cda:prefix = 'MG' or cda:name/cda:prefix = 'PC' or cda:name/cda:prefix = 'PG' or cda:name/cda:prefix = 'PR' )"> [assignedAuthor_fr.sch] Erreur de
            conformité CI-SIS : l'élément assignedPerson/name/prefix doit faire partie de la table de référence  TRE_R81-Civilite ('M' ou 'MLLE' ou 'MME')
            ou TRE_R11-CiviliteExercice ('DR' ou 'MC' ou 'MG' ou 'PC' ou 'PG' ou 'PR')</assert>
        <assert test="not(cda:name/cda:suffix) or (cda:name/cda:suffix and cda:name/cda:suffix = 'DR' or cda:name/cda:suffix = 'MC' or cda:name/cda:suffix = 'MG'             or cda:name/cda:suffix = 'PC' or cda:name/cda:suffix = 'PG' or cda:name/cda:suffix = 'PR')"> [informationRecipient_fr.sch] Erreur de
            conformité CI-SIS : l'élément  assignedPerson/name/suffix doit faire partie de la table de référence TRE_R11-CiviliteExercice ('DR' ou 'MC' ou 'MG' ou 'PC' ou 'PG' ou 'PR')
        </assert>
    </rule>
</pattern>
    <pattern id="inFulfillmentOf_fr">
    <rule context="cda:inFulfillmentOf/cda:order">
        <let name="count_id" value="count(cda:id)"/>
        <assert test="$count_id=1">
            [inFulfillementOf_fr.sch] Erreur de conformité CI-SIS : L'élément id ne doit être présent qu'une fois (cardinalité [1..1])
        </assert>
        <assert test="cda:id[@root]">
            [inFulfillementOf_fr.sch] Erreur de conformité CI-SIS : L'élément id doit contenir un attribut @root
        </assert>
    </rule>
</pattern>
    <pattern id="legalAuthenticator_fr">
    <rule context="cda:ClinicalDocument/cda:legalAuthenticator">
       
        <assert test="cda:time[@value] or cda:time[@nullFlavor]">
            [legalAuthenticator_fr.sch] Erreur de conformité CI-SIS : L'élément legalAuthenticator/time doit être présent avec l'attribut @value ou un attribut nullFlavor
        </assert>
        <assert test="cda:signatureCode[@code='S']">
            [legalAuthenticator_fr.sch] Erreur de conformité CI-SIS : L'élément "signatureCode" doit être présent et contenir l'attribut @code fixé à la valeur 'S'
        </assert>
        <assert test="cda:assignedEntity">
            [legalAuthenticator_fr.sch] Erreur de conformité CI-SIS : L'élément "assignedEntity" doit être présent 
        </assert>       
        
        <assert test="cda:assignedEntity/cda:assignedPerson">
            [legalAuthenticator_fr.sch] Erreur de conformité CI-SIS : L'élément "assignedEntity/assignedPerson" doit être présent 
        </assert>
    </rule>
</pattern>
    <pattern id="modeleEntete_fr">
   <rule context="cda:ClinicalDocument">
       <let name="count_realmCode" value="count(cda:realmCode)"/>
       <let name="count_templateId" value="count(cda:templateId)"/>
       <let name="count_recordTarget" value="count(cda:recordTarget)"/>
       <let name="count_legalAuthenticator" value="count(cda:legalAuthenticator)"/>
       <let name="count_inFulfillmentOf" value="count(cda:inFulfillmentOf)"/>
       <let name="count_relatedDocument" value="count(cda:relatedDocument)"/>
       
       
       <assert test="$count_realmCode=1">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément realmCode doit être présent qu'une seule fois (cardinalité [1..1]) 
       </assert>
       <assert test="cda:realmCode[@code='FR']">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément realmCode doit comporter l'attribut @code fixé à la valeur 'FR'
       </assert>
       
       <assert test="cda:typeId[@root='2.16.840.1.113883.1.3'] and cda:typeId[@extension='POCD_HD000040']">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément typeId doit contenir les attributs @root fixé à '2.16.840.1.113883.1.3' et @extension fixé à 'POCD_HD000040'
       </assert>
       
       <assert test="$count_templateId &gt;=3">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément templateId doit contenir au moins trois occurences
       </assert>
       <assert test="cda:templateId[@root='2.16.840.1.113883.2.8.2.1']">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : l'élément templateId contenant l'attribut @root fixé à la valeur '2.16.840.1.113883.2.8.2.1' doit être présent, cela représente la déclaration de conformité aux spécifications HL7 France
       </assert>
       <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.1']">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : l'élément templateId contenant l'attribut @root fixé à la valeur '1.2.250.1.213.1.1.1.1' doit être présent, cela représente la déclaration de conformité aux spécifications du CI-SIS
       </assert>
       
       <assert test="cda:id[@root]">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : l'élément id doit contenir une valeur d'OID dans l'attribut @root           
       </assert>
       
       <assert test="cda:code[@code] and cda:code[@codeSystem] and cda:code[@displayName]">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : l'élément code doit contenir les attributs @code, @codeSystem, et @displayName
       </assert>
       
       <assert test="cda:title">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : l'élément title doit être présent
       </assert>
       
       <assert test="cda:effectiveTime[@value]">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : l'élément effectiveTime doit contenir l'attribut @value
       </assert>
  
       
       <assert test="cda:languageCode[@code='fr-FR']">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément languageCode doit être présent et contenir l'attribut @code fixé à la valeur 'fr-FR'
       </assert>
       
      
       <assert test="$count_recordTarget=1">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément recordTarget doit être présent qu'une seule fois (cardinalité [1..1])
       </assert>
       
       
       <assert test="$count_legalAuthenticator=1">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément legalAuthenticator doit être présent qu'une seule fois (cardinalité [1..1])
       </assert>
       
       
       <assert test="$count_inFulfillmentOf&gt;=0">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément inFulfillmentOf peut être présent [0..*].
       </assert>
       
       
       <assert test="cda:documentationOf">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément documentationOf doit être présent au moins une fois (cardinalité [1..*])
       </assert>
       
       <assert test="$count_relatedDocument&lt;=1">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément relatedDocuement doit être présent qu'une seule fois au maximum (cardinalité [0..1])
       </assert>
       
       
       <assert test="cda:componentOf">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément componentOf est obligatoire (cardinalité [1..1])
       </assert>
   </rule>
</pattern>
    <pattern id="participant_fr">
    
    <rule context="cda:ClinicalDocument/cda:participant">
     
        
        
        <assert test="cda:time/cda:low[@value] or not(cda:time/cda:low)">
            [participant_fr.sch] Erreur de conformité CI-SIS : L'élément participant/time/low doit contenir l'attribut @value
        </assert>
        <assert test="cda:time/cda:high[@value] or not(cda:time/cda:high)">
            [participant_fr.sch] Erreur de conformité CI-SIS : L'élément participant/time/high doit contenir l'attribut @value
        </assert>
        <assert test="not(cda:functionCode) or (cda:functionCode/@code and cda:functionCode/@codeSystem) or cda:functionCode/@nullFlavor">
            [participant_fr.sch] Erreur de conformité CI-SIS : Les attributs code et codeSystem sont obligatoires dans un élément functionCode
        </assert>
        
    </rule>
    
    
    <rule context="cda:participant/cda:associatedEntity">
        
        <assert test="@classCode='PROV' or @classCode='AGNT' or @classCode='ECON' or @classCode='GUARD' or @classCode='QUAL' or @classCode='POLHOLD' or              @classCode='CON' or @classCode='CAREGIVER' or @classCode='PAT'">
            [participant_fr.sch] Erreur de conformité CI-SIS : L'élément participant/associatedEntity[@classCode] doit faire partie de TRE_R260-HL7RoleClass(2.16.840.1.113883.5.110).
        </assert>
        
        <assert test="not(cda:code) or (cda:code and cda:code[@code] and cda:code[@codeSystem] and cda:code[@displayName])">
            [participant_fr.sch] Erreur de conformité CI-SIS : L'élément participant/associatedEntity/code doit contenir les attributs @code, @codeSystem et @displayName lorsqu'il est présent
        </assert>
        
    </rule>
    <rule context="cda:participant/cda:associatedEntity/associatedPerson">
        <let name="count_name" value="count(cda:name)"/>
        <let name="count_family" value="count(cda:name/cda:family)"/>
        <let name="count_given" value="count(cda:name/cda:given)"/>
        <let name="count_prefix" value="count(cda:name/cda:prefix)"/>
        
        
        <assert test="$count_name=1">
            [participant_fr.sch] Erreur de conformité CI-SIS : L'élément participant/associatedEntity/associatedPerson/name doit être présent, mais qu'une seule fois (cardinalité [1..1])
        </assert>
        <assert test="$count_family=1">
            [participant_fr.sch] Erreur de conformité CI-SIS : L'élément participant/associatedEntity/associatedPerson/name/family doit être présent, mais qu'une seule fois (cardinalité [1..1])
        </assert>
        <assert test="$count_given &lt;=1">
            [participant_fr.sch] Erreur de conformité CI-SIS : L'élément participant/associatedEntity/associatedPerson/name/given peut être présent au maximum qu'une seule fois (cardinalité [0..1])
        </assert>
        <assert test="$count_prefix &lt;=1">
            [participant_fr.sch] Erreur de conformité CI-SIS : L'élément participant/associatedEntity/associatedPerson/name/prefix peut être présent au maximum qu'une seule fois (cardinalité [0..1])
        </assert>
    </rule>
</pattern>
    <pattern id="recordTarget_fr">
    <rule context="cda:ClinicalDocument/cda:recordTarget/cda:patientRole">
        <let name="count_name_patient" value="count(cda:patient/cda:name)"/>
        <let name="count_patient_name_qualifier" value="count(cda:patient/cda:name/cda:given/@qualifier)"/>
        <assert test="not(cda:id[@nullFlavor])">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : L'élément recordTarget/patientRole/id (obligatoire dans CDAr2), 
            doit être sans nullFlavor. 
        </assert>
        <assert test="$count_name_patient = 1">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : L'élément recordTarget/patientRole/patient/name ne doit être présent qu'une fois
        </assert>
        <assert test="$count_patient_name_qualifier = 0 or ($count_patient_name_qualifier &gt;0 and (cda:patient/cda:name/cda:given/@qualifier='BR' or cda:patient/cda:name/cda:given/@qualifier='CL'))">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : S'il existe, l'attribut @qualifier de l'élement name/given doit etre @qualifier='BR' ou @qualifier='CL'.
        </assert>
        
        <assert test="             not(cda:patient/cda:religiousAffiliationCode) and             not(cda:patient/cda:raceCode) and             not(cda:patient/cda:ethnicGroupCode)              ">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : Un élément recordTarget/patientRole/patient 
            ne doit contenir ni race ni religion ni groupe ethnique.
        </assert>
        <assert test="cda:patient/cda:birthTime">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : l'élément recordTarget/patientRole/patient/birthTime doit être présent 
            avec une date de naissance ou un nullFlavor autorisé.
        </assert>
        <assert test="(not(cda:id/@root='1.2.250.1.213.1.4.8') and not(cda:id/@root='1.2.250.1.213.1.4.9') and not(cda:id/@root='1.2.250.1.213.1.4.10') and not(cda:id/@root='1.2.250.1.213.1.4.11'))             and cda:id/@extension             or (cda:patient/cda:name/cda:family/@qualifier             and cda:patient/cda:name/cda:given             and cda:patient/cda:birthTime             and cda:patient/cda:administrativeGenderCode             )">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : Dans le cadre de l'INS, les traits de l'INS (Nom de naissance, premier prénom, date de naissance et sexe) sont obligatoires
        </assert>
        <assert test="cda:patient/cda:name/cda:family/@qualifier='BR' or cda:patient/cda:name/cda:family/@qualifier='SP' or cda:patient/cda:name/cda:family/@qualifier='CL'">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : L'élément patient/name/family/@qualifier prend l'une des valeurs suivantes : "BR" pour le nom de famille
            "SP" pour le nom d’usage
            "CL" pour le nom utilisé (RNIV)
        </assert>
        <assert test="cda:patient/cda:name/cda:given/@qualifier='BR' or cda:patient/cda:name/cda:given/@qualifier='CL' or not(cda:patient/cda:name/cda:given/@qualifier)">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : Si présent, l'élément patient/name/given/@qualifier prend l'une des valeurs suivantes :
            "BR" pour le premier prénom extrait de la liste des prénoms de l’acte de naissance
            "CL" pour pour le prénom utilisé (RNIV)
        </assert>
    </rule>
    <rule context="cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:family">
        <assert test="@qualifier">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : L'attribut @qualifier est obligatoire d'ans l'élément family
        </assert>
        <assert test="@qualifier=&#34;BR&#34; or @qualifier=&#34;CL&#34; or @qualifier=&#34;SP&#34;">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : L'élément patient/name/family/@qualifier prend l'une des valeurs suivantes : "BR" pour le nom de famille
            "SP" pour le nom d’usage
            "CL" pour le nom utilisé (RNIV)
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:given">
        <assert test="@qualifier='BR' or @qualifier='CL' or not(@qualifier)">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : Si présent, L'élément patient/name/given/@qualifier prend l'une des valeurs suivantes :
            "BR" pour le premier prénom extrait de la liste des prénoms de l’acte de naissance
            "CL" pour pour le prénom utilisé (RNIV)
        </assert>
    </rule>

    
    <rule context="cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian">
        <let name="count_name_guardianPerson" value="count(cda:guardianPerson/cda:name)"/>
        <assert test="$count_name_guardianPerson &lt;=1">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : L'élément recordTarget/patientRole/patient/guardian/guardianPerson/name ne doit être présent qu'une fois (cardinalité [0..1])
        </assert>
        <let name="count_name_guardianOrganization" value="count(cda:guardianOrganization/cda:name)"/> 
        <assert test="$count_name_guardianOrganization &lt;=1">
            [recordTarget_fr.sch] Erreur de conformité CI-SIS : L'élément recordTarget/patientRole/patient/guardian/guardianOrganization/name ne doit être présent qu'une fois (cardinalité [0..1])
        </assert>
    </rule> 
    
</pattern>
    <pattern id="relatedDocument_fr">
    <p>
        Si l'élément relatedDocument est présent alors son attribut typeCode doit valoir RPLC 
    </p>
    <rule context="cda:relatedDocument">  
        <let name="count_id" value="count(cda:parentDocument/cda:id)"/>
        <assert test="@typeCode='RPLC'">
            [relatedDocument_fr.sch] Erreur de conformité CI-SIS : ClinicalDocument/relatedDocument ne contient pas l'attribut typeCode avec la seule valeur autorisée : RPLC.
        </assert>
       <assert test="$count_id = 1">
           [relatedDocument_fr.sch] Erreur de conformité CI-SIS : ClinicalDocument/relatedDocument/parentDocument/id doit être présent une seule fois
       </assert>
        <assert test="cda:parentDocument/cda:id[@root]">
            [relatedDocument_fr.sch] Erreur de conformité CI-SIS : ClinicalDocument/relatedDocument/parentDocument/id doit contenir un élément root 
        </assert>
    </rule>
</pattern>
    <pattern id="serviceEventLabStatusCode">
    <p>
        Contrôle d'utilisation à bon escient de l'extension serviceEvent/lab:statusCode autorisée dans les profils XD-LAB, APSR 
    </p>
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/lab:statusCode">
        <assert test="../../../cda:code[@code='11502-2' or @code='11526-1']"> 
            Erreur de conformité CI-SIS : L'extension documentationOf/serviceEvent/lab:statusCode n'est autorisée 
            que dans les CR de biologie ou les CR d'anatomie et de cytologie pathologiques
        </assert>
        <assert test="@code = 'active' or @code = 'completed' "> 
            Erreur de conformité CI-SIS : L'élément documentationOf/serviceEvent/lab:statusCode doit posséder un attribut @code.
        </assert>

        
    </rule>
</pattern>
    <pattern id="telecom">
    <p>
        Vérification de la conformité au CI-SIS d'un élément telecom (de type TEL) du standard CDAr2 :
        L'élément doit comporter un attribut "value" bien formaté avec les préfixes autorisés par le CI-SIS, 
        et optionnellement un attribut "use" (qui n'est pas contrôlé).
        Alternativement, si l'attribut nullFlavor est présent, il doit avoir l'une des valeurs admises par le CI-SIS. 
    </p>
    <rule context="cda:telecom">
        <let name="prefix" value="substring-before(@value, ':')"/>
        <let name="suffix" value="substring-after(@value, ':')"/>           
        <assert test="(             (count(@*) = 1 and name(@*) = 'nullFlavor' and             (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or             ($suffix and (             $prefix = 'tel' or              $prefix = 'fax' or              $prefix = 'mailto' or              $prefix = 'http' or              $prefix = 'ftp' or              $prefix = 'mllp'))             )">
            [telecom.sch] Erreur de conformité CI-SIS : <name/> n'est pas conforme à une adresse de télécommunication préfixe:chaîne 
            (avec préfixe = tel, fax, mailto, http, ftp ou mllp) 
            ou est vide et sans nullFlavor, ou contient un nullFlavor non admis.
        </assert>
        <assert test=" @use = 'H'                      or @use = 'HP'                      or @use = 'HV'                      or @use = 'WP'                     or @use = 'DIR'                      or @use = 'PUB'                      or @use = 'EC'                      or @use = 'MC'                      or @use = 'PG'                      or not(@use)">
            [telecom.sch] Erreur de conformité CI-SIS : L'attribut use de l'élément telecom n'est pas conforme. 
            Il est facultatif et les valeurs permises sont 'H','HP', 'HV','WP','DIR','PUB','EC','MC','PG'.
            </assert>
    </rule>
</pattern>
    
       
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_authenticatorSpecialty">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:authenticator/cda:assignedEntity/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="'authenticator/assignedEntity/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'authenticator/assignedEntity/code'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_authenticatorSpecialty)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'authenticator/assignedEntity/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_authenticatorSpecialty"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_authorFunctionCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:author/cda:functionCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="'author/functionCode'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'author/functionCode'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_authorFunctionCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'author/functionCode'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_authorFunctionCode"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_authorSpecialty">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:author/cda:assignedAuthor/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'author/assignedAuthor/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'author/assignedAuthor/code'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_authorSpecialty)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'author/assignedAuthor/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_authorSpecialty"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_componentOfResponsibleSpecialty">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:componentOf/cda:encompassingEncounter/cda:responsibleParty/cda:assignedEntity/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="'componentOf/encompassingEncounter/responsibleParty/assignedEntity/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'componentOf/encompassingEncounter/responsibleParty/assignedEntity/code'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_componentOfResponsibleSpecialty)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'componentOf/encompassingEncounter/responsibleParty/assignedEntity/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_componentOfResponsibleSpecialty"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_healthcareFacilityCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'componentOf/encompassingEncounter/location/healtCareFacility/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'componentOf/encompassingEncounter/location/healtCareFacility/code'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_healthcareFacilityCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'componentOf/encompassingEncounter/location/healtCareFacility/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_healthcareFacilityCode"/>.
        </assert>
    </rule>
</pattern> 
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_informantRelatedEntityCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:informant/cda:relatedEntity/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'informant/relatedEntity/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'informant/relatedEntity/code'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_informantRelatedEntityCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'informant/relatedEntity/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_informantRelatedEntityCode"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_legalAuthenticatorSpecialty">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:legalAuthenticator/cda:assignedEntity/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="'legalAuthenticator/assignedEntity/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'legalAuthenticator/assignedEntity/code'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_legalAuthenticatorSpecialty)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'legalAuthenticator/assignedEntity/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_legalAuthenticatorSpecialty"/>.
        </assert>
    </rule>
</pattern> 
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_participantFunctionCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:participant/cda:functionCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="'participant/functionCode'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'participant/functionCode'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_participantFunctionCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'participant/functionCode'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_participantFunctionCode"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_participantAssociatedEntityCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:participant/cda:associatedEntity/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="'participant/associatedEntity/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'participant/associatedEntity/code'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_participantAssociatedEntityCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'participant/associatedEntity/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_participantAssociatedEntityCode"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_standardIndustryClassCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:standardIndustryClassCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'standardIndustryClassCode'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'standardIndustryClassCode'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_standardIndustryClassCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'standardIndustryClassCode'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_standardIndustryClassCode"/>.
        </assert>
    </rule>
</pattern>  
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_typeCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:ClinicalDocument/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'ClinicalDocument/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'ClinicalDocument/code'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_typeCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'ClinicalDocument/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_typeCode"/>.
        </assert>
    </rule>
</pattern> 
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_confidentialityCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:ClinicalDocument/cda:confidentialityCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'ClinicalDocument/confidentialityCode'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'ClinicalDocument/confidentialityCode'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_confidentialityCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'ClinicalDocument/confidentialityCode'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_confidentialityCode"/>.
        </assert>
    </rule>
</pattern> 
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_encompassingEncounterCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:componentOf/cda:encompassingEncounter/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="'ClinicalDocument/componentOf/encompassingEncounter/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'ClinicalDocument/componentOf/encompassingEncounter/code'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_encompassingEncounterCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'ClinicalDocument/componentOf/encompassingEncounter/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_encompassingEncounterCode"/>.
        </assert>
    </rule>
</pattern>
     
    
    
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_healthStatusCodes">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.2']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="'entryRelationship/observation/value'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'entryRelationship/observation/value'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_healthStatusCodes)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'entryRelationship/observation/value'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_healthStatusCodes"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_substanceAdministration_approachSiteCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:substanceAdministration/cda:approachSiteCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="'substanceAdministration/approachSiteCode'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'substanceAdministration/approachSiteCode'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_substanceAdministration_approachSiteCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'substanceAdministration/approachSiteCode'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_substanceAdministration_approachSiteCode"/>.
        </assert>
    </rule>
</pattern> 
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_problemCodes">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5' and not (cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.6')]/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'entry/observation/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'entry/observation/code'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_problemCodes)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'entry/observation/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_problemCodes"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_HL7_allergyintolerance_clinical">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.6' or cda:templateId/@root='2.16.840.1.113883.10.20.1.54']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'observation/entryRelationship/observation/value'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'observation/entryRelationship/observation/value'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_HL7_allergyintolerance_clinical)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'observation/entryRelationship/observation/value'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_HL7_allergyintolerance_clinical"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_HL7_conditionclinical">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[not(cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.6' or cda:templateId/@root='2.16.840.1.113883.10.20.1.54')]/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'observation/entryRelationship/observation/value'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'observation/entryRelationship/observation/value'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_HL7_conditionclinical)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'observation/entryRelationship/observation/value'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_HL7_conditionclinical"/>.
        </assert>
    </rule>
</pattern>
    
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_observationIntoleranceType">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.6']/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="observation/code"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="observation/code"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_observationIntoleranceType)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="observation/code"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_observationIntoleranceType"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_substanceAdministration_ImmunizationRouteCodes">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:substanceAdministration[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12' or cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12.2']/cda:routeCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="substanceAdministration/routeCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="substanceAdministration/routeCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_substanceAdministration_ImmunizationRouteCodes)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="substanceAdministration/routeCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_substanceAdministration_ImmunizationRouteCodes"/>.
        </assert>
    </rule>
</pattern>

    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_vitalSignCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.2']/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'observation/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'observation/code'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_vitalSignCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'observation/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_vitalSignCode"/>.
        </assert>
    </rule>
</pattern>   
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_administrativeGenderCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="//cda:administrativeGenderCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="'administrativeGenderCode'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'administrativeGenderCode'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_administrativeGenderCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'administrativeGenderCode'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_administrativeGenderCode"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_SocialHistoryCodes">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.52']/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="observation[templateId/@root='1.2.250.1.213.1.1.3.52']/code"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="observation[templateId/@root='1.2.250.1.213.1.1.3.52']/code"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_SocialHistoryCodes)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="observation[templateId/@root='1.2.250.1.213.1.1.3.52']/code"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_SocialHistoryCodes"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_TypeDirectiveAnticipee">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.7']/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'observation/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'observation/code'"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_typeDirectiveAnticipee)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'observation/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_typeDirectiveAnticipee"/>.
        </assert>
    </rule>
</pattern>
    
    
    <!--Start pattern based on abstract abstractImmunization--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="immunizationCode">
    <p>Contrôle de l'appartenance du code Immunization du PS par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="//cda:substanceAdministration[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12']/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
            [abstractSpecialty] L'élément "<value-of select="'//substanceAdministration/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [abstractSpecialty] L'élément "<value-of select="'//substanceAdministration/code'"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_immunization_1)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem]) or  (document($jdv_immunization_2)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem]))">
            
            [abstractSpecialty] L'élément <value-of select="'//substanceAdministration/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_immunization_1"/> ou <value-of select="$jdv_immunization_2"/>.
        </assert>
    </rule>
</pattern>
    
    
    
    
    

    <phase id="Struct_minimale">

        
        <active pattern="variablesSM"/>

        
        <active pattern="addr"/>
        <active pattern="assignedAuthor_fr"/>
        <active pattern="assignedEntity_fr"/>
        <active pattern="associatedEntity_fr"/>
        <active pattern="authenticator_fr"/>
        <active pattern="author_fr"/>
        <active pattern="componentOf_fr"/>
        <active pattern="custodian_fr"/>
        <active pattern="documentationOf_fr"/>
        <active pattern="documentEffectiveTime"/>
        <active pattern="informantRelatedEntity_fr"/>
        <active pattern="informationRecipient_fr"/>
        <active pattern="inFulfillmentOf_fr"/>
        <active pattern="legalAuthenticator_fr"/>
        <active pattern="modeleEntete_fr"/>
        <active pattern="participant_fr"/>
        <active pattern="recordTarget_fr"/>
        <active pattern="relatedDocument_fr"/>         
        <active pattern="serviceEventLabStatusCode"/>        
        <active pattern="telecom"/>
        
        
        <active pattern="JDV_authenticatorSpecialty"/> 
        <active pattern="JDV_authorFunctionCode"/>
        <active pattern="JDV_authorSpecialty"/>
        <active pattern="JDV_componentOfResponsibleSpecialty"/>
        <active pattern="JDV_healthcareFacilityCode"/>    
        <active pattern="JDV_informantRelatedEntityCode"/>
        <active pattern="JDV_legalAuthenticatorSpecialty"/>
        <active pattern="JDV_participantAssociatedEntityCode"/>
        <active pattern="JDV_participantFunctionCode"/>
        <active pattern="JDV_standardIndustryClassCode"/>
        <active pattern="JDV_typeCode"/>
        <active pattern="JDV_confidentialityCode"/>
        <active pattern="JDV_encompassingEncounterCode"/>
        
        
        
        
        <active pattern="JDV_HL7_allergyintolerance_clinical"/>
        <active pattern="JDV_HL7_conditionclinical"/>
        <active pattern="JDV_healthStatusCodes"/>        
        <active pattern="JDV_observationIntoleranceType"/>  
        <active pattern="JDV_problemCodes"/>          
        <active pattern="JDV_substanceAdministration_approachSiteCode"/>         
        <active pattern="JDV_substanceAdministration_ImmunizationRouteCodes"/>

        <active pattern="JDV_vitalSignCode"/>     
        <active pattern="JDV_administrativeGenderCode"/>
        <active pattern="JDV_SocialHistoryCodes"/>
        <active pattern="JDV_TypeDirectiveAnticipee"/>
        
        <active pattern="immunizationCode"/>
         
    </phase>

    
    
    

    <pattern id="variablesSM">
        
                  
        <let name="jdv_authenticatorSpecialty" value="'../../jeuxDeValeurs/JDV_J01_XdsAuthorSpecialty_CISIS.xml'"/>
        <let name="jdv_authorFunctionCode" value="'../../jeuxDeValeurs/JDV_J47_FunctionCode_CISIS.xml'"/>

        <let name="jdv_authorSpecialty" value="'../../jeuxDeValeurs/JDV_J01_XdsAuthorSpecialty_CISIS.xml'"/>
        <let name="jdv_componentOfResponsibleSpecialty" value="'../../jeuxDeValeurs/JDV_J01_XdsAuthorSpecialty_CISIS.xml'"/>
        <let name="jdv_healthcareFacilityCode" value="'../../jeuxDeValeurs/JDV_J02_XdsHealthcareFacilityTypeCode_CISIS.xml'"/>
        <let name="jdv_informantRelatedEntityCode" value="'../../jeuxDeValeurs/JDV_J11_RelationPatient_CISIS.xml'"/>
        <let name="jdv_legalAuthenticatorSpecialty" value="'../../jeuxDeValeurs/JDV_J01_XdsAuthorSpecialty_CISIS.xml'"/>
        <let name="jdv_participantFunctionCode" value="'../../jeuxDeValeurs/JDV_J47_FunctionCode_CISIS.xml'"/>

        <let name="jdv_participantAssociatedEntityCode" value="'../../jeuxDeValeurs/JDV_J01_XdsAuthorSpecialty_CISIS.xml'"/>

        <let name="jdv_standardIndustryClassCode" value="'../../jeuxDeValeurs/JDV_J04_XdsPracticeSettingCode_CISIS.xml'"/>
        
        
        <let name="jdv_typeCode" value="'../../jeuxDeValeurs/JDV_J07_XdsTypeCode_CISIS.xml'"/>  
        <let name="jdv_confidentialityCode" value="'../../jeuxDeValeurs/JDV_HL7_Confidentiality_CISIS.xml'"/>
        <let name="jdv_encompassingEncounterCode" value="'../../jeuxDeValeurs/JDV_J142_TypeRencontre_CISIS.xml'"/>
        
        
        
        <let name="jdv_actSubstanceAdministrationImmunizationCode" value="'../../jeuxDeValeurs/JDV_HL7_ActSubstanceAdministrationImmunizationCode_CISIS.xml'"/>        
        <let name="jdv_clinicalStatusCodes" value="'../../jeuxDeValeurs/JDV_ClinicalStatusCodes_CISIS.xml'"/>
        <let name="jdv_healthStatusCodes" value="'../../jeuxDeValeurs/JDV_HealthStatusCodes_CISIS.xml'"/>        
        <let name="jdv_observationIntoleranceType" value="'../../jeuxDeValeurs/JDV_HL7_ObservationIntoleranceType_CISIS.xml'"/>
        <let name="jdv_problemCodes" value="'../../jeuxDeValeurs/JDV_ProblemCodes_CISIS.xml'"/>
        <let name="jdv_HL7_allergyintolerance_clinical" value="'../../jeuxDeValeurs/JDV_HL7_allergyintolerance_clinical_CISIS.xml'"/>
        <let name="jdv_HL7_conditionclinical" value="'../../jeuxDeValeurs/JDV_HL7_ConditionClinical_CISIS.xml'"/>
        
        <let name="jdv_substanceAdministration_approachSiteCode" value="'../../jeuxDeValeurs/JDV_ImmunizationApproachSiteCode_CISIS.xml'"/>
        <let name="jdv_substanceAdministration_ImmunizationRouteCodes" value="'../../jeuxDeValeurs/JDV_ImmunizationRouteCodes_CISIS.xml'"/>

        <let name="jdv_vitalSignCode" value="'../../jeuxDeValeurs/JDV_SignesVitaux_CISIS.xml'"/>
        <let name="jdv_administrativeGenderCode" value="'../../jeuxDeValeurs/JDV_J143_AdministrativeGender_CISIS.xml'"/>
        <let name="jdv_SocialHistoryCodes" value="'../../jeuxDeValeurs/JDV_SocialHistoryCodes_CISIS.xml'"/>

        <let name="jdv_typeDirectiveAnticipee" value="'../../jeuxDeValeurs/JDV_TypeDirectiveAnticipee_CISIS.xml'"/>
        
        
        <let name="jdv_immunization_1" value="'../../jeuxDeValeurs/JDV_HL7_ActSubstanceAdministrationImmunizationCode_CISIS.xml'"/>
        <let name="jdv_immunization_2" value="'../../jeuxDeValeurs/JDV_AbsentOrUnknownImmunization_CISIS.xml'"/>
        
                
        <rule context="cda:ClinicalDocument">            
            <assert test="not(cda:templateId[@root='1.3.6.1.4.1.19376.1.2.20']) or (count(cda:templateId)=3 and  cda:templateId[@root='2.16.840.1.113883.2.8.2.1'] and cda:templateId[@root='1.2.250.1.213.1.1.1.1'])"> 
                [CI-SIS_StructurationMinimale] Erreur de conformité : Dans un document CDA non structuré, le templateId 1.3.6.1.4.1.19376.1.2.20 remplace le templateId du volet et seuls les trois templateId "1.3.6.1.4.1.19376.1.2.20", "2.16.840.1.113883.2.8.2.1" et "1.2.250.1.213.1.1.1.1" sont admis
            </assert>
            <assert test="not(cda:component/cda:nonXMLBody) or cda:templateId/@root='1.3.6.1.4.1.19376.1.2.20'">
                [CI-SIS_StructurationMinimale] Erreur de conformité au CI-SIS : Dans un document CDA non structuré, le templateId "1.3.6.1.4.1.19376.1.2.20" est obligatoire
            </assert>
        </rule>
        
    </pattern>

</schema>