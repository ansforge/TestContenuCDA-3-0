<?xml version="1.0" encoding="UTF-8"?><!-- 
   CI-SIS_BIO-CR-BIO_2022.01.sch 
   auteur : ANS
   ......................................................................................................................................................    
   Historique :
   13/10/2022 : Création
--><schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cda="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" defaultPhase="CI-SIS_BIO-CR-BIO_2022.01" queryBinding="xslt2" schemaVersion="CI-SIS_BIO-CR-BIO_2022.01.sch">
	
	<title>Vérification de conformité du document au modèle BIO-CR-BIO_2022.01</title>
	<ns prefix="cda" uri="urn:hl7-org:v3"/>
	<ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<ns prefix="jdv" uri="http://esante.gouv.fr"/>
	<ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
	
	<!-- Abstract patterns -->	
	<?DSDL_INCLUDE_START abstract/dansJeuDeValeurs.sch?><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="dansJeuDeValeurs" abstract="true">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="$xpath_elt">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or $nullFlavor)">
           [dansJeuDeValeurs] L'élément "<value-of select="$vue_elt"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             ($nullFlavor and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="$vue_elt"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($path_jdv)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        <!--  débrayage du contrôle sur le displayName qui risque de générer un trop grand nombre d'assert-failed en raison d'une différence 
              non significative de libellé (pb de casse d'un caractère, un espace en trop, un caractère "'" mal codé ...
        <assert test="@nullFlavor or 
                     (document($path_jdv)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem and @displayName=$att_displayName])">
        -->
            [dansJeuDeValeurs] L'élément <value-of select="$vue_elt"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$path_jdv"/>.
        </assert>
    </rule>
</pattern><?DSDL_INCLUDE_END abstract/dansJeuDeValeurs.sch?>
	<?DSDL_INCLUDE_START abstract/IVL_TS.sch?><pattern id="IVL_TS" abstract="true">
    <p>
        Vérification de la conformité au CI-SIS d'un élément de type IVL_TS ou TS du standard CDAr2 :
        L'élément doit porter soit un attribut "value" soit un intervalle éventuellement semi-borné de sous-éléments "low", "high". 
        Alternativement, si l'attribut nullFlavor est autorisé, il doit porter l'une des valeurs admises par le CI-SIS. 
    </p>
    <rule context="$elt">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            [IVL_TS.sch] Erreur de conformité CI-SIS : <value-of select="$vue_elt"/>/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
        <assert test="(@* and not(*)) or (not(@*) and *)">
            [IVL_TS.sch] Erreur de conformité CI-SIS : <value-of select="$vue_elt"/> doit contenir soit un attribut soit des éléments fils.
        </assert>
        <assert test="(             (name(@*) = 'nullFlavor' and $nullFlavor and             (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or             (name(@*) != 'nullFlavor')              )">
            [IVL_TS.sch] Erreur de conformité CI-SIS : <value-of select="$vue_elt"/> contient un 'nullFlavor' non autorisé ou porteur d'une valeur non admise.
        </assert>  
        
        <!-- On test que la valeur high soit plus élevée que la valeur low -->
        <assert test="not(cda:low and cda:high) or cda:high/@value &gt; cda:low/@value or cda:high/@nullFlavor">
            [IVL_TS.sch] Erreur de conformité CDA : L'élément de temps 'high' doit être supérieur à l'élément de temps 'low'
        </assert>
        
    </rule> 

    <rule context="$elt/cda:low">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            [IVL_TS.sch] Erreur de conformité CI-SIS : <value-of select="$vue_elt"/>/low/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
    </rule>
    
    <rule context="$elt/cda:high">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            [IVL_TS.sch] Erreur de conformité CI-SIS : <value-of select="$vue_elt"/>/high/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
     </rule>       

</pattern><?DSDL_INCLUDE_END abstract/IVL_TS.sch?>   
	
	<!-- Entête du volet CR-BIO -->	
	<?DSDL_INCLUDE_START include/specificationsVolets/BIO-CR-BIO_2022.01/Entete/Entete_CR-BIO.sch?><pattern id="Entete_CR-BIO">
    
    <rule context="cda:ClinicalDocument">         
        <assert test="cda:setId">
            [Entete_CR-BIO] L'élément setId est obligatoire.
        </assert>
        <assert test="cda:title = &#34;Compte rendu d'examens biologiques&#34;">
            [Entete_CR-BIO] L'élément title est obligatoire et doit être fixé à "Compte rendu d'examens biologiques".
        </assert>
        <assert test="cda:code[@code=&#34;11502-2&#34; and @displayName=&#34;CR d'examens biologiques&#34; and @codeSystem=&#34;2.16.840.1.113883.6.1&#34;]">
            [Entete_CR-BIO] L'élément code est obligatoire et doit être fixé à @code="11502-2" @displayName="CR d'examens biologiques" @codeSystem="2.16.840.1.113883.6.1".
        </assert>
        <assert test="cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.3.3&#34; and @extension=&#34;2022.01&#34;]">
            [Entete_CR-BIO] L'élément templateId fixé à @root="1.3.6.1.4.1.19376.1.3.3" et @extension="2022.01" est obligatoire
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:recordTarget/cda:patientRole">         
        <assert test="not(cda:addr[@nullFlavor]) or cda:addr[@nullFlavor=&#34;UNK&#34;]">
            [Entete_CR-BIO] Si aucune adresse n’est connue, utiliser la valeur nullFlavor='UNK'.
        </assert>
        <assert test="not(cda:telecom[@nullFlavor]) or cda:telecom[@nullFlavor=&#34;UNK&#34;]">
            [Entete_CR-BIO] Si aucune coordonnée n’est connue, utiliser la valeur nullFlavor='UNK'.
        </assert>
        <assert test="not(cda:patient/cda:administrativeGenderCode[@nullFlavor]) or cda:patient/cda:administrativeGenderCode[@nullFlavor=&#34;UNK&#34;]">
            [Entete_CR-BIO] Si le sexe n’est pas connu, utiliser la valeur nullFlavor='UNK'.
        </assert>
        <assert test="not(cda:patient/cda:birthTime[@nullFlavor]) or cda:patient/cda:birthTime[@nullFlavor=&#34;UNK&#34;]">
            [Entete_CR-BIO] Si la date de naissance n’est pas connue, utiliser la valeur nullFlavor='UNK'.
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:authenticator">
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.3.3.1.5']">
            [Entete_CR-BIO] Le templateId "1.3.6.1.4.1.19376.1.3.3.1.5" de l'élément authenticator est obligatoire.
        </assert>
        
        <assert test="cda:time">
            [Entete_CR-BIO] La date de la dernière validation effectuée par le biologiste médical est obligatoire.
        </assert>
        
        <assert test="cda:assignedEntity/cda:addr">
            [Entete_CR-BIO] L'adresse du biologiste ayant validé des résultats est obligatoire dans l'élément authenticator.
        </assert>
        
        <assert test="cda:assignedEntity/cda:telecom">
            [Entete_CR-BIO] Les coordonnées telecom du biologiste ayant validé des résultats sont obligatoires dans l'élément authenticator.
        </assert>
        
        <assert test="(cda:assignedEntity/cda:representedOrganization/cda:id) or not (cda:assignedEntity/cda:representedOrganization)">
            [Entete_CR-BIO] L'identifiant du laboratoire est obligatoire dans l'élément authenticator/assignedEntity/representedOrganization/id.
        </assert>
        
        <assert test="(cda:assignedEntity/cda:representedOrganization/cda:name) or not (cda:assignedEntity/cda:representedOrganization)">
            [Entete_CR-BIO] Le nom du laboratoire est obligatoire dans l'élément authenticator/assignedEntity/representedOrganization/name.
        </assert>
        
        <assert test="(cda:assignedEntity/cda:representedOrganization/cda:telecom) or not (cda:assignedEntity/cda:representedOrganization)">
            [Entete_CR-BIO] Les coordonnées telecom du laboratoire sont obligatoires dans l'élément authenticator/assignedEntity/representedOrganization/telecom.
        </assert>
        
        <assert test="(cda:assignedEntity/cda:representedOrganization/cda:addr) or not (cda:assignedEntity/cda:representedOrganization)">
            [Entete_CR-BIO] L'adresse du laboratoire est obligatoire dans l'élément authenticator/assignedEntity/representedOrganization/addr.
        </assert>
    </rule> 
    
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent">
        <assert test="cda:code">
            [Entete_CR-BIO] Le code de l'acte documenté est obligatoire dans l'élément documentationOf/serviceEvent/code.
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:performer">
        <assert test="cda:time">
            [Entete_CR-BIO] La date d'exécution de l'acte documenté est obligatoire.
        </assert>
        <assert test="cda:assignedEntity/cda:addr">
            [Entete_CR-BIO] L'Adresse du directeur du laboratoire est obligatoire.
        </assert>
        <assert test="cda:assignedEntity/cda:telecom">
            [Entete_CR-BIO] Les Coordonnées télécom du directeur du laboratoire sont obligatoires.
        </assert>
        <assert test="cda:assignedEntity/cda:assignedPerson/cda:name">
            [Entete_CR-BIO] Le nom du directeur de laboratoire est obligatoire.
        </assert>
        <assert test="cda:assignedEntity/cda:representedOrganization/cda:id">
            [Entete_CR-BIO] L'identifiant du laboratoire est obligatoire.
        </assert>
        <assert test="cda:assignedEntity/cda:representedOrganization/cda:name">
            [Entete_CR-BIO] Le nom du laboratoire est obligatoire.
        </assert>
        <assert test="cda:assignedEntity/cda:representedOrganization/cda:telecom">
            [Entete_CR-BIO] Les coordonnées telecom du laboratoire sont obligatoires.
        </assert>
        <assert test="cda:assignedEntity/cda:representedOrganization/cda:addr">
            [Entete_CR-BIO] L'adresse du laboratoire est obligatoire.
        </assert>
        <assert test="cda:assignedEntity/cda:representedOrganization/cda:standardIndustryClassCode">
            [Entete_CR-BIO] Le cadre d'exercice du laboratoire est obligatoire.
        </assert>
        
    </rule>

    <rule context="cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter">
        <assert test="cda:responsibleParty/cda:assignedEntity/cda:id">
            [Entete_CR-BIO] L'identifiant du biologiste responsable doit être présent (responsibleParty/assignedEntity/id)
        </assert>
        <assert test="cda:responsibleParty/cda:assignedEntity/cda:code">
            [Entete_CR-BIO] La profession/spécialité du biologiste responsable doit être présente (responsibleParty/assignedEntity/code)
        </assert>
        <assert test="cda:responsibleParty/cda:assignedEntity/cda:assignedPerson/cda:name/cda:family">
            [Entete_CR-BIO] L'identité du biologiste responsable doit être présente (responsibleParty/assignedEntity/assignedPerson/name/family)
        </assert>

    </rule>
    
</pattern><?DSDL_INCLUDE_END include/specificationsVolets/BIO-CR-BIO_2022.01/Entete/Entete_CR-BIO.sch?>
	
	<!-- Sections relatives au volet CR-BIO -->
	<?DSDL_INCLUDE_START include/specificationsVolets/BIO-CR-BIO_2022.01/Sections/S_FR-Resultats-de-laboratoire-de-biologie-de-seconde-intention.sch?><pattern id="S_FR-Resultats-de-laboratoire-de-biologie-de-seconde-intention">
    <p>Vérification de la conformité d'une section de 1er niveau FR-Resultats-de-laboratoire-de-biologie-de-seconde-intention (1.2.250.1.213.1.1.2.60)</p>
    
    <!-- Contrôles des sections FR-Resultats-de-laboratoire-de-biologie-de-seconde-intention (1.2.250.1.213.1.1.2.60) -->
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.2.60']">
        <assert test="cda:code"> [S_FR-Resultats-de-laboratoire-de-biologie-de-seconde-intention] Erreur de conformité :
            Une section FR-Resultats-de-laboratoire-de-biologie-de-seconde-intention (1.2.250.1.213.1.1.2.60) doit comporter un élément code. </assert>
    </rule>
</pattern><?DSDL_INCLUDE_END include/specificationsVolets/BIO-CR-BIO_2022.01/Sections/S_FR-Resultats-de-laboratoire-de-biologie-de-seconde-intention.sch?>
	
	<!-- Entrées relatives au volet CR-BIO -->
	<?DSDL_INCLUDE_START include/specificationsVolets/BIO-CR-BIO_2022.01/Entrees/E_FR-Resultats-examens-de-biologie-medicale.sch?><pattern id="E_FR-Resultats-examens-de-biologie-medicale">
    <p>Vérification de la conformité d'une entrée FR-Resultats-examens-de-biologie-medicale (1.3.6.1.4.1.19376.1.3.1)</p>
    
    <rule context="cda:entry/cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1']">

        <assert test="../@typeCode"> 
            [E_FR-Resultats-examens-de-biologie-medicale] Erreur de conformité :
            un élément entry d'un CR de biologie doit comporter l'attribut typeCode. 
        </assert>
        
        <assert test="../cda:act and              (../cda:act/cda:code[@codeSystem = '2.16.840.1.113883.6.1'] or not(../cda:act/cda:code/@code))"> 
            [E_FR-Resultats-examens-de-biologie-medicale] Erreur de conformité :
            Un élément entry doit avoir un élément fils act et le code de cet act s'il existe,
            doit appartenir à la terminologie LOINC. 
        </assert>
        
        <assert test="../cda:act/cda:statusCode[@code = 'completed'] or                 ../cda:act/cda:statusCode[@code = 'active'] or                 ../cda:act/cda:statusCode[@code = 'aborted']"> 
            [E_FR-Resultats-examens-de-biologie-medicale] Erreur de conformité :
            Un élément entry doit avoir un élément fils act avec un statusCode@code valant 
            'completed', 'active' ou 'aborted'. 
        </assert>
        
        <assert test="../cda:act/cda:entryRelationship[@typeCode = 'COMP']">
            [E_FR-Resultats-examens-de-biologie-medicale] Erreur de conformité : 
            Un élément entry doit avoir au moins un petit fils act/entryRelationship
            avec un attribut typeCode valant 'COMP'. 
        </assert>
        
    </rule>
    
    <rule context="cda:entry[cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1']]/cda:act/cda:entryRelationship/cda:observation">
        <assert test="cda:code[@code and @codeSystem='2.16.840.1.113883.6.1' and @displayName] or (cda:code[not(@code)] and cda:code[not(@displayName)] and cda:code[not(@codeSystemName)] and cda:code[not(@codeSystem)])">
            [E_FR-Resultats-examens-de-biologie-medicale] Erreur de conformité : Si le code d'identification est un code universel LOINC, les attributs @code, @displayName et @codeSystem sont obligatoires.
        </assert>
    </rule>
    
    <rule context="cda:entry[cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1']]/cda:act/cda:entryRelationship/cda:observation/cda:code/cda:translation">
        <assert test="(@code and @codeSystem='1.2.250.1.213.1.1.5.130' and @displayName and @codeSystemName) or (not(@codeSystem='1.2.250.1.213.1.1.5.130') and @code and @displayName and @codeSystemName)">
            [E_FR-Resultats-examens-de-biologie-medicale] Erreur de conformité : Si le code d'identification est un code d'attente LOINC, les attributs @code, @displayName, @codeSystemName et @codeSystem sont obligatoires. Si le code d'identification est un code de portée locale, les attributs @code, @displayName et @codeSystemName sont obligatoires.
        </assert>
    </rule>
    
    <rule context="cda:entry[cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1']]/cda:act/cda:entryRelationship/cda:organizer/cda:component/cda:observation">
        <assert test="cda:code[@code and @codeSystem='2.16.840.1.113883.6.1' and @displayName] or (cda:code[not(@code)] and cda:code[not(@displayName)] and cda:code[not(@codeSystemName)] and cda:code[not(@codeSystem)])">
            [E_FR-Resultats-examens-de-biologie-medicale] Erreur de conformité CR-BIO : Si le code d'identification est un code universel LOINC, les attributs @code, @displayName et @codeSystem sont obligatoires.
        </assert>
    </rule>
    
    <rule context="cda:entry[cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1']]/cda:act/cda:entryRelationship/cda:organizer/cda:component/cda:observation/cda:code/cda:translation">
        <assert test="(@code and @codeSystem='1.2.250.1.213.1.1.5.130' and @displayName and @codeSystemName) or (not(@codeSystem='1.2.250.1.213.1.1.5.130') and @code and @displayName and @codeSystemName)">
            [E_FR-Resultats-examens-de-biologie-medicale] Erreur de conformité : Si le code d'identification est un code d'attente LOINC, les attributs @code, @displayName, @codeSystemName et @codeSystem sont obligatoires. Si le code d'identification est un code de portée locale, les attributs @code, @displayName et @codeSystemName sont obligatoires.
        </assert>
    </rule>
    
    <rule context="cda:entry[cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1']]/cda:act/cda:entryRelationship/cda:organizer/cda:component/cda:organizer/cda:component/cda:observation">
        <assert test="cda:code[@code and @codeSystem='2.16.840.1.113883.6.1' and @displayName] or (cda:code[not(@code)] and cda:code[not(@displayName)] and cda:code[not(@codeSystemName)] and cda:code[not(@codeSystem)])">
            [E_FR-Resultats-examens-de-biologie-medicale] Erreur de conformité : Si le code d'identification est un code universel LOINC, les attributs @code, @displayName et @codeSystem sont obligatoires.
        </assert>
    </rule>
    
    <rule context="cda:entry[cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1']]/cda:act/cda:entryRelationship/cda:organizer/cda:component/cda:organizer/cda:component/cda:observation/cda:code/cda:translation">
        <assert test="(@code and @codeSystem='1.2.250.1.213.1.1.5.130' and @displayName and @codeSystemName) or (not(@codeSystem='1.2.250.1.213.1.1.5.130') and @code and @displayName and @codeSystemName)">
            [E_FR-Resultats-examens-de-biologie-medicale] Erreur de conformité : Si le code d'identification est un code d'attente LOINC, les attributs @code, @displayName, @codeSystemName et @codeSystem sont obligatoires. Si le code d'identification est un code de portée locale, les attributs @code, @displayName et @codeSystemName sont obligatoires.
        </assert>
    </rule>
    
</pattern><?DSDL_INCLUDE_END include/specificationsVolets/BIO-CR-BIO_2022.01/Entrees/E_FR-Resultats-examens-de-biologie-medicale.sch?>
	<?DSDL_INCLUDE_START include/specificationsVolets/BIO-CR-BIO_2022.01/Entrees/E_FR-Batterie-examens-de-biologie-medicale.sch?><pattern id="E_FR-Batterie-examens-de-biologie-medicale">
    <p>Vérification de la conformité d'une entrée FR-Batterie-examens-de-biologie-medicale (1.3.6.1.4.1.19376.1.3.1.4)</p>
    <rule context="*[cda:templateId/@root = '1.3.6.1.4.1.19376.1.3.1.4']">
        <assert test="self::cda:organizer and @classCode = 'BATTERY' and @moodCode = 'EVN'"> 
            [E_FR-Batterie-examens-de-biologie-medicale] Erreur de conformité : 
            Une entrée FR-Batterie-examens-de-biologie-medicale ('1.3.6.1.4.1.19376.1.3.1.4') doit avoir un classCode='BATTERY' et un moodCode='EVN'. 
        </assert>
        
        <assert test="./cda:statusCode[@code = 'completed'] or             ./cda:statusCode[@code = 'active'] or             ./cda:statusCode[@code = 'aborted']"> 
            [E_FR-Batterie-examens-de-biologie-medicale] Erreur de conformité :
            Une entrée FR-Batterie-examens-de-biologie-medicale ('1.3.6.1.4.1.19376.1.3.1.4') doit avoir un statusCode@code 'completed', 'active' ou 'aborted'. 
        </assert>
    </rule>
</pattern><?DSDL_INCLUDE_END include/specificationsVolets/BIO-CR-BIO_2022.01/Entrees/E_FR-Batterie-examens-de-biologie-medicale.sch?>
	<?DSDL_INCLUDE_START include/specificationsVolets/BIO-CR-BIO_2022.01/Entrees/E_FR-Isolat-microbiologique.sch?><pattern id="E_FR-Isolat-microbiologique">
    <p>Vérification de la conformité d'une entrée FR-Isolat-microbiologique (1.3.6.1.4.1.19376.1.3.1.5)</p>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.1.5']">
        
        <assert test="self::cda:organizer and @classCode = 'CLUSTER' and @moodCode = 'EVN'">
            [E_FR-Isolat-microbiologique] Erreur de conformité :
            Un isolat biologique dans une entry (1.3.6.1.4.1.19376.1.3.1.5)
            doit être un organizer de classCode CLUSTER et de moodCode EVN. 
        </assert>      
        
        <assert test="cda:statusCode[@code = 'completed'] or                     cda:statusCode[@code = 'active'] or                     cda:statusCode[@code = 'aborted']"> 
            [E_FR-Isolat-microbiologique] Erreur de conformité :
            Un isolat biologique doit avoir un statusCode@code valant 'completed', 'active' ou 'aborted'. 
        </assert>
     
        <assert test="cda:specimen[@typeCode='SPC']">
            [E_FR-Isolat-microbiologique] Erreur de conformité : 
            Un isolat d'une entry d'un CR d'examens biologiques doit comporter un élément fils 'specimen', de typeCode 'SPC'. 
        </assert>
            
        <assert test="cda:specimen/cda:specimenRole[@classCode='SPEC']">
            [E_FR-Isolat-microbiologique] Erreur de conformité : 
            Un isolat d'une entry d'un CR d'examens biologiques doit comporter un specimen/specimenRole, de typeCode 'SPEC'. 
        </assert>
        
        <assert test="cda:specimen/cda:specimenRole/cda:specimenPlayingEntity[@classCode='MIC']">
            [E_FR-Isolat-microbiologique] Erreur de conformité : 
            Un isolat d'une entry d'un CR d'examens biologiques doit comporter un specimen/specimenRole/playingEntity de classCode 'MIC'. 
        </assert>
        
        <assert test="cda:specimen/cda:specimenRole/cda:specimenPlayingEntity/cda:code">
            [E_FR-Isolat-microbiologique] Erreur de conformité : 
            Un isolat d'une entry d'un CR d'examens biologiques doit comporter un specimen/specimenRole/playingEntity/code. 
        </assert>
        
        <assert test="not(cda:performer) or cda:performer[@typeCode='PRF']">
            [E_FR-Isolat-microbiologique] Erreur de conformité :
            Si un isolat d'une entry d'un CR d'examens biologiques spécifie un exécutant, ce doit être un élément fils performer de type 'PRF'. 
        </assert> 
        
    </rule>
 
</pattern><?DSDL_INCLUDE_END include/specificationsVolets/BIO-CR-BIO_2022.01/Entrees/E_FR-Isolat-microbiologique.sch?>
	<?DSDL_INCLUDE_START include/specificationsVolets/BIO-CR-BIO_2022.01/Entrees/E_FR-Laboratoire-executant.sch?><pattern id="E_FR-Laboratoire-executant">
    <p>Vérification de la conformité d'une entrée FR-Laboratoire-executant (1.3.6.1.4.1.19376.1.3.3.1.7)</p>
    <rule context="*[cda:templateId/@root = '1.3.6.1.4.1.19376.1.3.3.1.7']">
        
        <assert test="self::cda:performer">
            [E_FR-Laboratoire-executant] Erreur de conformité :
            Un exécutant dans une entrée FR-Laboratoire-executant (1.3.6.1.4.1.19376.1.3.3.1.7) doit être un performer. 
        </assert>      
        
        <assert test="cda:assignedEntity/cda:representedOrganization/cda:id and                     cda:assignedEntity/cda:representedOrganization/cda:name"> 
            [E_FR-Laboratoire-executant] Erreur de conformité :
            Dans une entrée FR-Laboratoire-executant (1.3.6.1.4.1.19376.1.3.3.1.7), les éléments assignedEntity/representedOrganization/id
            et assignedEntity/representedOrganization/name sont obligatoires. 
        </assert>
        
        <assert test="cda:time"> 
            [E_FR-Laboratoire-executant] Erreur de conformité :
            Dans une entrée FR-Laboratoire-executant (1.3.6.1.4.1.19376.1.3.3.1.7), l'élément time est obligatoire.
        </assert>
        
    </rule>
</pattern><?DSDL_INCLUDE_END include/specificationsVolets/BIO-CR-BIO_2022.01/Entrees/E_FR-Laboratoire-executant.sch?>
	<?DSDL_INCLUDE_START include/specificationsVolets/BIO-CR-BIO_2022.01/Entrees/E_FR-Prelevement.sch?><pattern id="E_FR-Prelevement">
    <p>Vérification de la conformité d'une entrée FR-Prelevement (1.3.6.1.4.1.19376.1.3.1.2)</p>
    
    <rule context="cda:procedure[./cda:templateId/@root='1.3.6.1.4.1.19376.1.3.1.2']">
        
        <assert test="./cda:participant[@typeCode = 'PRD' and ./cda:participantRole/@classCode = 'SPEC']"> 
            [E_FR-Prelevement] Erreur de conformité :
            Une entrée FR-Prelevement (1.3.6.1.4.1.19376.1.3.1.2) doit comporter un participant de typeCode 'PRD'
            avec un fils participantRole de classCode 'SPEC'. 
        </assert>
        
        <assert test="             (count(./cda:entryRelationship/cda:act/cda:code[@code = 'SPRECEIVE']/../cda:effectiveTime[@value]/../../../cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1.2'])             =              count((./cda:entryRelationship/cda:act/cda:code[@code = 'SPRECEIVE']/../../../cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1.2'])))">
            [E_FR-Prelevement] Erreur de conformité :
            Une entrée FR-Prelevement (1.3.6.1.4.1.19376.1.3.1.2), si elle comporte l'acte "Réception de l'échantillon au laboratoire"
            doit alors préciser la date et heure de réception de l'échantillon à l'aide d'un effectiveTime@value. 
        </assert>
        
        <assert test="             ./cda:entryRelationship/cda:act[./cda:code/@code = 'SPRECEIVE' and                                              ./cda:code/@codeSystem = '1.3.5.1.4.1.19376.1.5.3.2' and                                             ./cda:effectiveTime/@value] or             not(./cda:entryRelationship/cda:act/cda:code[@code = 'SPRECEIVE'])">
            [E_FR-Prelevement] Erreur de conformité :
            Une entrée FR-Prelevement (1.3.6.1.4.1.19376.1.3.1.2), si elle comporte l'acte "Réception de l'échantillon au laboratoire"
            doit alors préciser la date et heure de réception de l'échantillon à l'aide d'un effectiveTime@value. 
        </assert>
        
    </rule>
</pattern><?DSDL_INCLUDE_END include/specificationsVolets/BIO-CR-BIO_2022.01/Entrees/E_FR-Prelevement.sch?>
	<?DSDL_INCLUDE_START include/specificationsVolets/BIO-CR-BIO_2022.01/Entrees/E_FR-Resultat-examens-de-biologie-element-clinique-pertinent.sch?><pattern id="E_FR-Resultat-examens-de-biologie-element-clinique-pertinent">
    <p>Vérification de la conformité d'une entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent (1.3.6.1.4.1.19376.1.3.1.6)</p>
    <rule context="cda:observation[./cda:templateId/@root = '1.3.6.1.4.1.19376.1.3.1.6']">
        
        <assert test="@moodCode = 'EVN'"> 
            [E_FR-Resultat-examens-de-biologie-element-clinique-pertinent] Erreur de conformité :
            Un résultat dans une entry (avec templateId '1.3.6.1.4.1.19376.1.3.1.6')
            doit avoir un @moodCode 'EVN'. 
        </assert>

        <assert test="./cda:statusCode[@code = 'completed'] or ./cda:statusCode[@code = 'aborted']"> 
            [E_FR-Resultat-examens-de-biologie-element-clinique-pertinent] Erreur de conformité :
            Un résultat doit avoir un statusCode@code valant 'completed' ou 'aborted'. 
        </assert>
        
        <assert test="./cda:entryRelationship[@typeCode = 'REFR']/cda:observation/cda:effectiveTime or                       not(./cda:entryRelationship[@typeCode = 'REFR'])"> 
            [[E_FR-Resultat-examens-de-biologie-element-clinique-pertinent] Erreur de conformité :
            L'antériorité d'un résultat doit obligatoirement être horodatée avec un élément effectiveTime. 
        </assert>
        
        <assert test="./cda:entryRelationship[@typeCode = 'REFR']/cda:observation/cda:statusCode[@code = 'completed'] or             not(./cda:entryRelationship[@typeCode = 'REFR'])"> 
            [E_FR-Resultat-examens-de-biologie-element-clinique-pertinent] Erreur de conformité :
            L'antériorité d'un résultat est obligatoirement au statusCode 'completed'. 
        </assert>

        <assert test="count(./cda:referenceRange) =1 or not(./cda:referenceRange)"> 
            [E_FR-Resultat-examens-de-biologie-element-clinique-pertinent] Erreur de conformité :
            L'intervalle de référence d'un résultat doit être présente au maximum une fois 
        </assert>
    </rule>
</pattern><?DSDL_INCLUDE_END include/specificationsVolets/BIO-CR-BIO_2022.01/Entrees/E_FR-Resultat-examens-de-biologie-element-clinique-pertinent.sch?>
	
	<!-- JDV relatives au volet CR-BIO -->
	<?DSDL_INCLUDE_START include/jeuxDeValeurs/BIO-CR-BIO_2022.01/JDV_HL7_ObservationInterpretation-CISIS.sch?><pattern id="JDV_HL7_ObservationInterpretation-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_HL7_ObservationInterpretation-CISIS"/>
    <param name="vue_elt" value="observation/interpretationCode"/>
    <param name="xpath_elt" value="cda:observation/cda:interpretationCode"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/BIO-CR-BIO_2022.01/JDV_HL7_ObservationInterpretation-CISIS.sch?>
	
	<phase id="CI-SIS_BIO-CR-BIO_2022.01">
		<active pattern="variables"/>
		
		<!-- Activation de l'en-tête  -->
		<active pattern="Entete_CR-BIO"/>
		
		<!-- activation des sections -->
		<active pattern="S_FR-Resultats-de-laboratoire-de-biologie-de-seconde-intention"/>
		
		<!-- Activation des entrées  -->
		<active pattern="E_FR-Resultats-examens-de-biologie-medicale"/>
		<active pattern="E_FR-Batterie-examens-de-biologie-medicale"/>
		<active pattern="E_FR-Isolat-microbiologique"/>
		<active pattern="E_FR-Laboratoire-executant"/>
		<active pattern="E_FR-Prelevement"/>
		<active pattern="E_FR-Resultat-examens-de-biologie-element-clinique-pertinent"/>
		
		<!-- Activation des JDVs  -->
		<active pattern="JDV_HL7_ObservationInterpretation-CISIS"/>
	</phase>	
	
	<!-- ::::::::::::::::::::::::::::::::::::: -->
	<!--           Variables globales          -->
	<!-- ::::::::::::::::::::::::::::::::::::: -->
	
	<pattern id="variables">
		
		<!-- chemins relatifs des fichiers jeux de valeurs -->
		<let name="JDV_HL7_ObservationInterpretation-CISIS" value="'../jeuxDeValeurs/JDV_HL7_ObservationInterpretation-CISIS.xml'"/>
		
		<rule context="cda:ClinicalDocument">
			
			<assert test="./cda:templateId[@root='1.3.6.1.4.1.19376.1.3.3']"> 
				[CI-SIS_BIO-CR-BIO_2022.01] Erreur de conformité : L'élément clinicalDocument/templateId doit être présent avec @root='1.3.6.1.4.1.19376.1.3.3'.
			</assert>
			
			<assert test="./cda:code[@code='11502-2' and @codeSystem='2.16.840.1.113883.6.1']"> 
				[CI-SIS_BIO-CR-BIO_2022.01] Erreur de conformité : L'élément code doit égal à @code='11502-2' et @codeSystem='2.16.840.1.113883.6.1'.
			</assert>
			
			<assert test="./cda:versionNumber[@value] and number(./cda:versionNumber/@value) &gt; 0">
				[CI-SIS_BIO-CR-BIO_2022.01] Erreur de conformité : L'élément "versionNumber" doit être présent dans l'en-tête, avec un attribut @value contenant un entier positif.
			</assert>
			
			<assert test="not(./cda:versionNumber[@nullFlavor])">
				[CI-SIS_BIO-CR-BIO_2022.01] Erreur de conformité : L'attribut nullFlavor est interdit pour l'élément "versionNumber".
			</assert>
			
		</rule>
		
		<!-- Contrôles des sections de niveau 1 autorisées -->
		<rule context="cda:structuredBody/cda:component/cda:section">
			<assert test="(./cda:templateId[@root='1.3.6.1.4.1.19376.1.3.3.2.1']) or (./cda:templateId[@root='1.2.250.1.213.1.1.2.60']) or (./cda:templateId[@root='1.3.6.1.4.1.19376.1.4.1.2.16'])"> 
				[CI-SIS_BIO-CR-BIO_2022.01] Erreur de conformité : un CR-BIO ne peut comporter que les sections de niveau 1 suivantes : FR-CR-de-biologie (1.3.6.1.4.1.19376.1.3.3.2.1), 
				FR-Resultats-de-laboratoire-de-biologie-de-seconde-intention (1.2.250.1.213.1.1.2.60) et FR-Commentaire-non-code (1.3.6.1.4.1.19376.1.4.1.2.16)
			</assert>
		</rule>
		
	</pattern>
	
</schema>