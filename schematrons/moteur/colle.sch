<?xml version="1.0" encoding="UTF-8"?><!-- 
    CI-SIS_StructurationMinimale.sch
    ......................................................................................................................................................
    Vérification de la conformité sémantique au volet Structuration Commune des Documents Médicaux du CI-SIS.
    ......................................................................................................................................................
    Utilisation des répertoires sous testContenuCDA :
    - testContenuCDA : les documents CDA d'exemples conformes au CI-SIS, ainsi que la feuille de style par défaut cda_asip.xsl pour la visualisation
    - - documentsAnnexes : Des documents annexes liés aux exemples et des documents de référence
    - - infrastructure/cda : Le schéma XML CDA.xsd
    - - jeuxDeValeurs : les jeux de valeurs du CI-SIS dans le format SVS.xsd
    - - processable/coreschemas : Les sous-schémas XML de CDA.xsd (de l'édition normative HL7 v3 de 2005, correspondant à CDAr2)
    - - schematrons : les schématrons des volets du CI-SIS sous la forme source (<CI-SIS_<nom>.sch) et sous la forme compilée en xslt2 (<CI-SIS_<nom>.xsl)
    - - - abstract : les sous-schématrons de patterns abstraits (un fichier par abstract pattern)
    - - - include : les sous-schématrons de patterns concrets (un fichier par pattern)
    - - - - sections : les sous-schématrons de patterns pour la vérification de conformité des sections du corps CDA
    - - - - - entries : les sous-schématrons de patterns pour la vérification de conformité des entries du corps CDA
    - - - moteur : le moteur xslt2 de vérification de conformité sémantique d'un document d'exemple, 
                   avec ses différents composants : saxon9he.jar, script verif.bat et feuilles de transformation xslt2 intermédiaires
    - - - rapports : les rapports de vérification de conformité produits, et la feuille de style qui sert à leur visualisation
    ......................................................................................................................................................
    Pour réaliser le schematron d'un volet de contenu du CI-SIS :
        1) Recopier le présent schématron sous le nom CI-SIS_<nom du volet>.sch, dans le répertoire courant (schematrons)
        2) conserver les include, pattern existants, à l'exception du pattern et de l'include nonXMLBody inutiles pour un volet structuré.
        3) Créer dans le répertoire include les patterns concrets supplémentaires requis par le volet (ou réutiliser ceux qui sont réutilisables)
        4) le cas échéant créer dans le répertoire abstract les paterns abstraits supplémentaires requis par le volet
        5) Inclure tous les patterns supplémentaires dans le schématron CI-SIS_<nom du volet>.sch
        6) Activer dans la phase "latotale<aaaammjj>" les patterns concrets supplémentaires.
        7) La première opération de validation de conformité d'un document au volet compilera le schematron en xslt2 : CI-SIS_<nom du volet>.xsl
    ......................................................................................................................................................    
    Historique :
        27/05/11 : FMY : Création
        31/05/11 : FMY : Compléments
        15/06/11 : FMY : Compléments
        27/06/11 : FMY : publication dans la version 1.0.1 du CI-SIS
        22/07/11 : FMY : Mise à jour des commentaires ci-dessus (retirer le pattern et l'include nonXMLBody), ajout variable OIDLOINC
                         ajout pattern observationInterpretation
        27/07/11 : FMY : Ajout des patterns de sections et d'entries de PCC et du CI-SIS, transversaux à tous types de documents       
        19/12/11 : FMY : Ajout du contrôle / jeu de valeurs confidentialityCode
        08/10/12 : FMY : CI-SIS 1.3 => retrait des include assignedAuthor, confidentialityCode et custodianOrganization. 
                         Maj des include assignedEntity (addr & telecom optionnels) et addr (contrôle structure des adresses)
                         Actualisation nom de fichiers include problemEntry, concernentry, procedureentry 
        24/01/13 : FMY : Ajout de contrôle de encompassingEncounter/code par rapport au jeu de valeurs CI-SIS_jdv_encompassingEncounterCode
        08/04/13 : FMA : Ajout du préfixe lab (pour CR de biologie et CR-ACP, et appel nouveau pattern serviceEventLabStatusCode
        05/12/13 : FMA : Désactivation du contrôle de l'adresse pour livraison au groupement DMP (qui n'a pas implémenté l'évolution addr)
        10/03/15 : JDS : Réactivation du contrôle de l'élément addr (spécifié dans la version du CI-SIS v1.2.0 de 2012 )
                         Maj des include serviceEventLabStatusCode20130408.sch      -> serviceEventLabStatusCode20150317.sch
                         Maj des include telecom20110728.sch                        -> telecom20150317.sch
        14/03/18 : NMA : Compléments
        17/02/20 : NMA : Création du schématron abstrait dansTypeCode et du schématron JDV_participationType.sch
        27/10/20 : APE : Ajout du schématron JDV_authorFunctionCode.sch
        27/10/20 : APE : Ajout du schématron JDV_administrativeGenderCode.sch
        27/10/20 : APE : Suppression du schématron abstrait "dansTypeCode.sch" et du schématron "JDV_participationType.sch" qui ne servent à rien puisque le typeCode est contrôlé par le schéma CDA.
        27/10/20 : APE : Suppression du schématron abstrait "personName20110627.sch" qui n'est pas utilisé
        27/10/20 : APE : Regroupement des valeurs des JDV JDV_J01-XdsAuthorSpecialty-CISIS et JDV_J48-ProfessionNonPS-CISIS dans le JDV_AuthorSpecialty-CISIS pour le contrôle du code profession/spécialité de l'auteur
        28/10/20 : APE : Déplacement des schématrons de JDV de l'en-tête dans le nouveau répertoire include\jeuxDeValeurs\en-tête
        28/10/20 : APE : Renommage du schématron documentCode.sch en JDV_typeCode.sch et déplacé dans le nouveau répertoire include\jeuxDeValeurs\en-tête
        28/10/20 : APE : Renommage du schématron HumanSubstanceAdministrationSite.sch en JDV_substanceAdministration_approachSiteCode.sch
        28/10/20 : APE : Création des schématrons de JDV de l'en-tête : JDV_authenticatorSpecialty.sch, JDV_componentOfResponsibleSpecialty, JDV_legalAuthenticatorSpecialty.sch, JDV_informantRelatedEntityCode.sch
        30/11/20 : APE : Modification pour eP-MED
        28/12/20 : ANS : Mise en conformité volet structuration minimale v1.7
        09/06/21 : ANS : Suppression du schématron JDV_SeverityObservation.sch
--><schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cda="urn:hl7-org:v3" xmlns:lab="urn:oid:1.3.6.1.4.1.19376.1.3.2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" defaultPhase="Struct_minimale" queryBinding="xslt2" schemaVersion="CI-SIS_StructurationMinimale.sch">
    <title>Rapport de conformité du document aux spécifications françaises (en-tête)</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    <ns prefix="lab" uri="urn:oid:1.3.6.1.4.1.19376.1.3.2"/>

    <!-- Inclusion du IHE_XDS-SD -->

    <!-- Inclusions d'abstract patterns : -->
    <?DSDL_INCLUDE_START ../abstract/IVL_TS.sch?><pattern id="IVL_TS" abstract="true">
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

</pattern><?DSDL_INCLUDE_END ../abstract/IVL_TS.sch?>
    <?DSDL_INCLUDE_START ../abstract/dansJeuDeValeurs.sch?><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="dansJeuDeValeurs" abstract="true">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="$xpath_elt">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or $nullFlavor)">
           [dansJeuDeValeurs] L'élément "<value-of select="$vue_elt"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             ($nullFlavor and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
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
</pattern><?DSDL_INCLUDE_END ../abstract/dansJeuDeValeurs.sch?>   
    
<!--    <include href="../abstract/abstractFunctionCode.sch"/> 
    <include href="../abstract/abstractHealthcareFacilityCode.sch"/>
    <include href="../abstract/abstractInformantRelatedEntityCode.sch"/> 
    <include href="../abstract/abstractSpecialty.sch"/> 
    <include href="../abstract/abstractStandardIndustryClassCode.sch"/>
    <include href="../abstract/abstractTypeCode.sch"/>
    <include href="../abstract/abstractEncompassingEncounterCode.sch"/>-->
    <!--<include href="../abstract/typeCodeDansJeuDeValeurs.sch"/> -->
    
    <?DSDL_INCLUDE_START ../abstract/abstractImmunization.sch?><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="abstractImmunization" abstract="true">
    <p>Contrôle de l'appartenance du code Immunization du PS par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="$xpath_elt">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or $nullFlavor)">
            [abstractSpecialty] L'élément "<value-of select="$vue_elt"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             ($nullFlavor and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [abstractSpecialty] L'élément "<value-of select="$vue_elt"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($path_jdv1)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem]) or  (document($path_jdv2)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem]))">
            
            [abstractSpecialty] L'élément <value-of select="$vue_elt"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$path_jdv1"/> ou <value-of select="$path_jdv2"/>.
        </assert>
    </rule>
</pattern><?DSDL_INCLUDE_END ../abstract/abstractImmunization.sch?>
    
    <!-- schématrons des éléments de l'en-tête -->
    <?DSDL_INCLUDE_START ../include/en-tete/addr.sch?><pattern id="addr">
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
</pattern><?DSDL_INCLUDE_END ../include/en-tete/addr.sch?>   
    <?DSDL_INCLUDE_START ../include/en-tete/assignedAuthor_fr.sch?><pattern id="assignedAuthor_fr">
    
    <rule context="assignedAuthor">
        <let name="count_id" value="count(cda:id)"/>
        <assert test="$count_id &lt;= 1"> [assignedAuthor_fr.sch] Erreur de conformité CI-SIS :
            L'élément "id" ne peut être présent qu'une seule fois (cardinalité [0..1]) dans une assignedAuthor </assert>
        <assert test="not(cda:id) or(cda:id and (cda:id[@root] and cda:id[@extension]) or cda:id[@nullFlavor])">
            [assignedAuthor_fr.sch] Erreur de conformité CI-SIS : S'il existe, l'élément "id" doit comportant les
            attibuts @root et @extension </assert>
        
    </rule>
    
    <!-- Règle concernant l'élément representedOrganization  -->
    <rule context="cda:assignedAuthor/cda:representedOrganization">
        <let name="count_representedOrganization_name" value="count(cda:name)"/>
        
        <!-- Vérification de representedOrganization -->
        <assert test="not(cda:id) or (cda:id and cda:id[@root = '1.2.250.1.71.4.2.2'])">
            [assignedAuthor_fr.sch] Erreur de conformité CI-SIS : Lorsqu'il est présent, l'élément
            representedOrganization/id doit avoir l'attribut@root='1.2.250.1.71.4.2.2' </assert>
        <assert test="$count_representedOrganization_name &lt;= 1"> [assignedAuthor_fr.sch] Erreur
            de conformité CI-SIS : L'élément representedOrganization/name ne peut être présent
            qu'une seule fois (cardinalité [0..1]) </assert>
        
    </rule>
    <!-- Règle concernant l'élément assignedPerson  -->
    <rule context="cda:assignedAuthor/cda:assignedPerson">
        <let name="count_assignedPerson_name" value="count(cda:name)"/>
        <let name="count_assignedPerson_family" value="count(cda:name/cda:family)"/>
        <let name="count_assignedPerson_given" value="count(cda:name/cda:given)"/>
        <let name="count_assignedPerson_prefix" value="count(cda:name/cda:prefix)"/>
        <let name="count_assignedPerson_suffix" value="count(cda:name/cda:suffix)"/>
        <!-- Vérification de l'assigned Person -->
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
</pattern><?DSDL_INCLUDE_END ../include/en-tete/assignedAuthor_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/assignedEntity_fr.sch?><pattern id="assignedEntity_fr">

    <rule context="cda:assignedEntity">
        <let name="count_id" value="count(cda:id)"/>
        <assert test="$count_id = 1"> [assignedEntity_fr.sch] Erreur de conformité CI-SIS :
            L'élément "id" ne doit être présent qu'une seule et unique fois dans une assignedEntity </assert>
        <assert test="(cda:id[@root] and cda:id[@extension]) or cda:id[@nullFlavor]">
            [assignedEntity_fr.sch] Erreur de conformité CI-SIS : L'élément "id" doit comportant les
            attibuts @root et @extension </assert>

    </rule>

    <!-- Règle concernant l'élément representedOrganization  -->
    <rule context="cda:assignedEntity/cda:representedOrganization">
        <let name="count_representedOrganization_id" value="count(cda:id)"/>
        <let name="count_representedOrganization_name" value="count(cda:name)"/>

        <!-- Vérification de representedOrganization -->
        <assert test="not(cda:id) or (cda:id and cda:id[@root = '1.2.250.1.71.4.2.2'])">
            [assignedEntity_fr.sch] Erreur de conformité CI-SIS : Lorsqu'il est présent, l'élément
            representedOrganization/id doit avoir l'attribut@root='1.2.250.1.71.4.2.2' </assert>
        <assert test="$count_representedOrganization_name &lt;= 1"> [assignedEntity_fr.sch] Erreur
            de conformité CI-SIS : L'élément representedOrganization/name ne peut être présent
            qu'une seule fois (cardinalité [0..1]) </assert>

    </rule>
    <!-- Règle concernant l'élément assignedPerson  -->
    <rule context="cda:assignedEntity/cda:assignedPerson">
        <let name="count_assignedPerson_name" value="count(cda:name)"/>
        <let name="count_assignedPerson_family" value="count(cda:name/cda:family)"/>
        <let name="count_assignedPerson_given" value="count(cda:name/cda:given)"/>
        <let name="count_assignedPerson_prefix" value="count(cda:name/cda:prefix)"/>
        <let name="count_assignedPerson_suffix" value="count(cda:name/cda:suffix)"/>
        <!-- Vérification de l'assigned Person -->
        <assert test="cda:name or @nullFlavor"> [assignedEntity_fr.sch] Erreur de conformité CI-SIS
            : Si l'élément assignedPerson n'est pas vide avec un nullFlavor, alors il doit comporter
            un élément fils "name" (nullFlavor autorisé). </assert>
        <assert test="$count_assignedPerson_name = 1 or @nullFlavor"> [assignedEntity_fr.sch] Erreur de conformité
            CI-SIS : L'élément assignedPerson doit contenir un seul et unique élément name </assert>
        <assert test="$count_assignedPerson_family = 1 or @nullFlavor"> [assignedEntity_fr.sch] Erreur de
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
</pattern><?DSDL_INCLUDE_END ../include/en-tete/assignedEntity_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/associatedEntity_fr.sch?><pattern id="associatedEntity_fr">
    
    <rule context="cda:associatedEntity">
        <let name="count_id" value="count(cda:id)"/>
        <assert test="$count_id &lt;= 1"> [associatedEntity_fr.sch] Erreur de conformité CI-SIS :
            L'élément "id" ne peut être présent qu'une seule fois (cardinalité [0..1]) dans une associatedEntity </assert>
        <assert test="not(cda:id) or(cda:id and (cda:id[@root] and cda:id[@extension]) or cda:id[@nullFlavor] or cda:id)">
            [associatedEntity_fr.sch] Erreur de conformité CI-SIS : S'il existe, l'élément "id" doit comportant les
            attibuts @root et @extension </assert>
    </rule>
    
    <!-- Règle concernant l'élément scopingOrganization  -->
    <rule context="cda:associatedEntity/cda:scopingOrganization">
        <let name="count_scopingOrganization_name" value="count(cda:name)"/>
        
        <!-- Vérification de scopingOrganization -->
        <assert test="not(cda:id) or (cda:id and cda:id[@root])">
            [associatedEntity_fr.sch] Erreur de conformité CI-SIS : Lorsqu'il est présent, l'élément
            scopingOrganization/id doit avoir l'attribut @root</assert>
        <assert test="$count_scopingOrganization_name &lt;= 1"> [associatedEntity_fr.sch] Erreur
            de conformité CI-SIS : L'élément scopingOrganization/name ne peut être présent
            qu'une seule fois (cardinalité [0..1]) </assert>
        
    </rule>
    <!-- Règle concernant l'élément associatedPerson  -->
    <rule context="cda:associatedEntity/cda:associatedPerson">
        <let name="count_associatedPerson_name" value="count(cda:name)"/>
        <let name="count_associatedPerson_family" value="count(cda:name/cda:family)"/>
        <let name="count_associatedPerson_given" value="count(cda:name/cda:given)"/>
        <let name="count_associatedPerson_prefix" value="count(cda:name/cda:prefix)"/>
        <let name="count_associatedPerson_suffix" value="count(cda:name/cda:suffix)"/>
        <!-- Vérification de l'assigned Person -->
        <assert test="cda:name or @nullFlavor"> [associatedEntity_fr.sch] Erreur de conformité CI-SIS
            : Si l'élément associatedPerson n'est pas vide avec un nullFlavor, alors il doit comporter
            un élément fils "name" (nullFlavor autorisé). </assert>
        <assert test="$count_associatedPerson_name = 1 or @nullFlavor"> [associatedEntity_fr.sch] Erreur de conformité
            CI-SIS : L'élément associatedPerson doit contenir un seul et unique élément name </assert>
        <assert test="$count_associatedPerson_family = 1 or @nullFlavor"> [associatedEntity_fr.sch] Erreur de
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
</pattern><?DSDL_INCLUDE_END ../include/en-tete/associatedEntity_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/authenticator_fr.sch?><pattern id="authenticator_fr">
    <rule context="cda:authenticator">
        <assert test="cda:time[@value] or cda:time[@nullFlavor]">
           [authenticator_fr.sch] Erreur de conformité CI-SIS :  L'élément time doit contenir l'attribut @value ou un attribut nullFlavor
        </assert>
        <assert test="cda:signatureCode[@code='S']"> 
            [authenticator] Erreur de conformité CI-SIS : L'élément code doit contenir l'attribut @code fixé à la valeur 'S' (pour signed)
        </assert>
    </rule>
</pattern><?DSDL_INCLUDE_END ../include/en-tete/authenticator_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/author_fr.sch?><pattern id="author_fr">
    <rule context="cda:ClinicalDocument/cda:author">
       <assert test="cda:time[@value] or cda:time[@nullFlavor]">
           [author_fr] L'élément "time" dans "author" doit être présent et renseigné.
       </assert>
    </rule>
</pattern><?DSDL_INCLUDE_END ../include/en-tete/author_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/componentOf_fr.sch?><pattern id="componentOf_fr">
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
  
</pattern><?DSDL_INCLUDE_END ../include/en-tete/componentOf_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/custodian_fr.sch?><pattern id="custodian_fr">
    <rule context="cda:representedCustodianOrganization">
        <let name="count_id" value="count(cda:id)"/>
        <assert test="cda:id[@root='1.2.250.1.71.4.2.2'] or cda:id[@root='1.2.250.1.213.4.1'] or cda:id[@nullFlavor]">
            [custodian_fr.sch] Erreur de conformité CI-SIS : L'élément representedCustodianOrganization/id doit être présent et doit contenir l'attribut @root soit à la valeur "1.2.250.1.71.4.2.2" ou "1.2.250.1.213.4.1"
        </assert>
        <assert test="$count_id = 1">
            [custodian_fr.sch] Erreur de conformité CI-SIS : L'élément representedCustodianOrganization/id doit être présent qu'une seule fois 
        </assert>
       
    </rule>
</pattern><?DSDL_INCLUDE_END ../include/en-tete/custodian_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/documentationOf_fr.sch?><pattern id="documentationOf_fr">
   
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
    
</pattern><?DSDL_INCLUDE_END ../include/en-tete/documentationOf_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/documentEffectiveTime.sch?><pattern id="documentEffectiveTime" is-a="IVL_TS">
    <p>Conformité de la date et heure de production du document, nullFlavor interdit</p>
    <param name="elt" value="cda:ClinicalDocument/cda:effectiveTime"/>
    <param name="vue_elt" value="'ClinicalDocument/effectiveTime'"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/en-tete/documentEffectiveTime.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/informantRelatedEntity_fr.sch?><pattern id="informantRelatedEntity_fr">
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
</pattern><?DSDL_INCLUDE_END ../include/en-tete/informantRelatedEntity_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/informationRecipient_fr.sch?><pattern id="informationRecipient_fr">
    <rule context="cda:informationRecipient/cda:intendedRecipient">
        <let name="count_id" value="count(cda:id)"/>
        <let name="count_informationRecipient" value="count(cda:informationRecipient)"/>
        <assert test="not(cda:id) or (cda:id[@root='1.2.250.1.71.4.2.1'] and cda:id[@extension])">
            [informationRecipient_fr.sch] Erreur de conformité au CI-SIS : L'élément intendedRecipient/id si présent doit avoir l'attribut @root fixé à "1.2.250.1.71.4.2.1" et l'attribut @extension doit être présent
        </assert>
        <!--<assert test="$count_id &gt;= 0">
            [informationRecipient_fr.sch] Erreur de conformité au CI-SIS : L'élément intendRecipient/id peut être présent 0 ou plusieurs fois (cardinalité [0..*])
        </assert>-->
        <assert test="$count_informationRecipient &lt;= 1">
            [informationRecipient_fr.sch] Erreur de conformité au CI-SIS : L'élément intendedRecipient/informationRecipient ne peut être présent qu'une seule fois au maximum(cardinalité [0..1])
        </assert>
    </rule>
    <!-- règle testant l'élément receivedOrganization -->
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
    <!-- règle testant l'élément informationRecipient -->
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
</pattern><?DSDL_INCLUDE_END ../include/en-tete/informationRecipient_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/inFulfillementOf_fr.sch?><pattern id="inFulfillmentOf_fr">
    <rule context="cda:inFulfillmentOf/cda:order">
        <let name="count_id" value="count(cda:id)"/>
        <assert test="$count_id=1">
            [inFulfillementOf_fr.sch] Erreur de conformité CI-SIS : L'élément id ne doit être présent qu'une fois (cardinalité [1..1])
        </assert>
        <assert test="cda:id[@root] or cda:id[@nullFlavor]">
            [inFulfillementOf_fr.sch] Erreur de conformité CI-SIS : L'élément id doit contenir un attribut @root ou un attribut @nullFlavor
        </assert>
    </rule>
</pattern><?DSDL_INCLUDE_END ../include/en-tete/inFulfillementOf_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/legalAuthenticator_fr.sch?><pattern id="legalAuthenticator_fr">
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
        <!-- Vérification de l'assignedEntity propre à l'élément legal authenticator -->
        <assert test="cda:assignedEntity/cda:assignedPerson">
            [legalAuthenticator_fr.sch] Erreur de conformité CI-SIS : L'élément "assignedEntity/assignedPerson" doit être présent 
        </assert>
    </rule>
</pattern><?DSDL_INCLUDE_END ../include/en-tete/legalAuthenticator_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/modeleEntete_fr.sch?><pattern id="modeleEntete_fr">
   <rule context="cda:ClinicalDocument">
       <let name="count_realmCode" value="count(cda:realmCode)"/>
       <let name="count_templateId" value="count(cda:templateId)"/>
       <let name="count_recordTarget" value="count(cda:recordTarget)"/>
       <let name="count_legalAuthenticator" value="count(cda:legalAuthenticator)"/>
       <let name="count_inFulfillmentOf" value="count(cda:inFulfillmentOf)"/>
       <let name="count_relatedDocument" value="count(cda:relatedDocument)"/>
       
       <!-- conformité du RealmCode -->
       <assert test="$count_realmCode=1">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément realmCode doit être présent qu'une seule fois (cardinalité [1..1]) 
       </assert>
       <assert test="cda:realmCode[@code='FR']">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément realmCode doit comporter l'attribut @code fixé à la valeur 'FR'
       </assert>
       <!--conformité du  typeId -->
       <assert test="cda:typeId[@root='2.16.840.1.113883.1.3'] and cda:typeId[@extension='POCD_HD000040']">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément typeId doit contenir les attributs @root fixé à '2.16.840.1.113883.1.3' et @extension fixé à 'POCD_HD000040'
       </assert>
       <!-- conformité des templateId -->
       <assert test="$count_templateId &gt;=3">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément templateId doit contenir au moins trois occurences
       </assert>
       <assert test="cda:templateId[@root='2.16.840.1.113883.2.8.2.1']">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : l'élément templateId contenant l'attribut @root fixé à la valeur '2.16.840.1.113883.2.8.2.1' doit être présent, cela représente la déclaration de conformité aux spécifications HL7 France
       </assert>
       <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.1']">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : l'élément templateId contenant l'attribut @root fixé à la valeur '1.2.250.1.213.1.1.1.1' doit être présent, cela représente la déclaration de conformité aux spécifications du CI-SIS
       </assert>
       <!-- conformité  id  -->
       <assert test="cda:id[@root]">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : l'élément id doit contenir une valeur d'OID dans l'attribut @root           
       </assert>
       <!-- conformité code  -->
       <assert test="cda:code[@code] and cda:code[@codeSystem] and cda:code[@displayName]">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : l'élément code doit contenir les attributs @code, @codeSystem, et @displayName
       </assert>
       <!-- Conformité title -->
       <assert test="cda:title">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : l'élément title doit être présent
       </assert>
       <!-- conformité effectiveTime -->
       <assert test="cda:effectiveTime[@value]">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : l'élément effectiveTime doit contenir l'attribut @value
       </assert>
 <!--      <!-\- ConfidentailityCode -\->
       <assert test="cda:confidentialityCode[@codeSystem='2.16.840.1.113883.5.25'] and ((cda:confidentialityCode[@code='N']) or
           (cda:confidentialityCode[@code='R']) or (cda:confidentialityCode[@code='V']))">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément confidentialityCode doit contenir l'attribut @codeSystem fixé à  2.16.840.1.113883.5.25. Les valeurs possibles dans les attributs @code et @displayName, sont respectivement :
           'N' et 'Normal', ou 
           'R' et 'Restreint', ou 
           'V' et 'Très restreint'           
       </assert> --> 
       <!-- conformité language code -->
       <assert test="cda:languageCode[@code='fr-FR']">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément languageCode doit être présent et contenir l'attribut @code fixé à la valeur 'fr-FR'
       </assert>
       
      <!-- conformité recordTarget -->
       <assert test="$count_recordTarget=1">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément recordTarget doit être présent qu'une seule fois (cardinalité [1..1])
       </assert>
       
       <!-- conformité legalAuthenticator -->
       <assert test="$count_legalAuthenticator=1">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément legalAuthenticator doit être présent qu'une seule fois (cardinalité [1..1])
       </assert>
       
       <!-- conformité inFulfillmentOf -->
       <assert test="$count_inFulfillmentOf&gt;=0">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément inFulfillmentOf peut être présent [0..*].
       </assert>
       
       <!-- conformité documentaiton -->
       <assert test="cda:documentationOf">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément documentationOf doit être présent au moins une fois (cardinalité [1..*])
       </assert>
       <!-- conformité relatedDocument -->
       <assert test="$count_relatedDocument&lt;=1">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément relatedDocuement doit être présent qu'une seule fois au maximum (cardinalité [0..1])
       </assert>
       
       <!-- conformité componentOf -->
       <assert test="cda:componentOf">
           [modeleEntete_fr.sch] Erreur de conformité CI-SIS : L'élément componentOf est obligatoire (cardinalité [1..1])
       </assert>
   </rule>
</pattern><?DSDL_INCLUDE_END ../include/en-tete/modeleEntete_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/participant_fr.sch?><pattern id="participant_fr">
    <!-- Règle sur les éléments de premier niveau de participant -->
    <rule context="cda:ClinicalDocument/cda:participant">
     
        <!--<assert test="cda:time[contains(@xsi:type,':IVL_TS')] or cda:time[@xsi:type='IVL_TS'] or cda:time[@nullFlavor]">
            [participant_fr.sch] Erreur de conformité CI-SIS : L'élément participant/time doit être présent et avoir le type fixé à la valeur 'IVL_TS'
        </assert>-->
        
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
    
    <!-- Règle sur l'associatedEntity contenue dans participant -->
    <rule context="cda:participant/cda:associatedEntity">
        
        <assert test="@classCode='PROV' or @classCode='AGNT' or @classCode='ECON' or @classCode='GUARD' or @classCode='QUAL' or @classCode='POLHOLD' or              @classCode='CON' or @classCode='CAREGIVER' or @classCode='PAT'">
            [participant_fr.sch] Erreur de conformité CI-SIS : L'élément participant/associatedEntity[@classCode] doit faire partie de TRE_R260-HL7RoleClass(2.16.840.1.113883.5.110).
        </assert>
        
        <assert test="not(cda:code) or (cda:code and cda:code[@code] and cda:code[@codeSystem] and cda:code[@displayName])">
            [participant_fr.sch] Erreur de conformité CI-SIS : L'élément participant/associatedEntity/code doit contenir les attributs @code, @codeSystem et @displayName lorsqu'il est présent
        </assert>
        <!-- <assert test="cda:associatedPerson">
            [participant_fr.sch] Erreur de conformité CI-SIS : L'élément participant/associatedEntity/associatedPerson doit être présent dans l'associatedEntity
        </assert> -->
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
</pattern><?DSDL_INCLUDE_END ../include/en-tete/participant_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/recordTarget_fr.sch?><pattern id="recordTarget_fr">
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

    <!-- ajouté par HKA le 10/03/20 -->
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
    
</pattern><?DSDL_INCLUDE_END ../include/en-tete/recordTarget_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/relatedDocument_fr.sch?><pattern id="relatedDocument_fr">
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
</pattern><?DSDL_INCLUDE_END ../include/en-tete/relatedDocument_fr.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/serviceEventLabStatusCode.sch?><pattern id="serviceEventLabStatusCode">
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
</pattern><?DSDL_INCLUDE_END ../include/en-tete/serviceEventLabStatusCode.sch?>
    <?DSDL_INCLUDE_START ../include/en-tete/telecom.sch?><pattern id="telecom">
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
</pattern><?DSDL_INCLUDE_END ../include/en-tete/telecom.sch?>
    
    <!-- schématrons des JDV de l'en-tête -->   
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_authenticatorSpecialty.sch?><pattern id="JDV_authenticatorSpecialty" is-a="dansJeuDeValeurs">
    <p>Conformité de la profession/spécialité d'un authenticator</p>
    <param name="path_jdv" value="$jdv_authenticatorSpecialty"/>
    <param name="vue_elt" value="'authenticator/assignedEntity/code'"/>
    <param name="xpath_elt" value="cda:authenticator/cda:assignedEntity/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_authenticatorSpecialty.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_authorFunctionCode.sch?><pattern id="JDV_authorFunctionCode" is-a="dansJeuDeValeurs">
    <p>Conformité du functionCode de l'auteur au CI-SIS</p>
    <param name="path_jdv" value="$jdv_authorFunctionCode"/>
    <param name="vue_elt" value="'author/functionCode'"/>
    <param name="xpath_elt" value="cda:author/cda:functionCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_authorFunctionCode.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_authorSpecialty.sch?><pattern id="JDV_authorSpecialty" is-a="dansJeuDeValeurs">
    <p>Conformité de la profession/spécialité d'un auteur</p>
    <param name="path_jdv" value="$jdv_authorSpecialty"/>
    <param name="vue_elt" value="'author/assignedAuthor/code'"/>
    <param name="xpath_elt" value="cda:author/cda:assignedAuthor/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_authorSpecialty.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_componentOfResponsibleSpecialty.sch?><pattern id="JDV_componentOfResponsibleSpecialty" is-a="dansJeuDeValeurs">
    <p>Conformité de la profession/spécialité d'un authenticator</p>
    <param name="path_jdv" value="$jdv_componentOfResponsibleSpecialty"/>
    <param name="vue_elt" value="'componentOf/encompassingEncounter/responsibleParty/assignedEntity/code'"/>
    <param name="xpath_elt" value="cda:componentOf/cda:encompassingEncounter/cda:responsibleParty/cda:assignedEntity/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_componentOfResponsibleSpecialty.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_healthcareFacilityCode.sch?><pattern id="JDV_healthcareFacilityCode" is-a="dansJeuDeValeurs">
    <p>Conformité au CI-SIS du healthcareFacilityCode de la prise en charge</p>
    <param name="path_jdv" value="$jdv_healthcareFacilityCode"/>
    <param name="vue_elt" value="'componentOf/encompassingEncounter/location/healtCareFacility/code'"/>
    <param name="xpath_elt" value="cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_healthcareFacilityCode.sch?> 
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_informantRelatedEntityCode.sch?><pattern id="JDV_informantRelatedEntityCode" is-a="dansJeuDeValeurs">
    <p>Conformité du functionCode de l'auteur au CI-SIS</p>
    <param name="path_jdv" value="$jdv_informantRelatedEntityCode"/>
    <param name="vue_elt" value="'informant/relatedEntity/code'"/>
    <param name="xpath_elt" value="cda:informant/cda:relatedEntity/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_informantRelatedEntityCode.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_legalAuthenticatorSpecialty.sch?><pattern id="JDV_legalAuthenticatorSpecialty" is-a="dansJeuDeValeurs">
    <p>Conformité de la profession/spécialité d'un legalAuthenticator</p>
    <param name="path_jdv" value="$jdv_legalAuthenticatorSpecialty"/>
    <param name="vue_elt" value="'legalAuthenticator/assignedEntity/code'"/>
    <param name="xpath_elt" value="cda:legalAuthenticator/cda:assignedEntity/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_legalAuthenticatorSpecialty.sch?> 
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_participantFunctionCode.sch?><pattern id="JDV_participantFunctionCode" is-a="dansJeuDeValeurs">
    <p>Conformité de la spécialité de l'auteur au CI-SIS</p>
    <param name="path_jdv" value="$jdv_participantFunctionCode"/>
    <param name="vue_elt" value="'participant/functionCode'"/>
    <param name="xpath_elt" value="cda:participant/cda:functionCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_participantFunctionCode.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_participantAssociatedEntityCode.sch?><pattern id="JDV_participantAssociatedEntityCode" is-a="dansJeuDeValeurs">
    <p>Conformité de la profession/spécialité d'un auteur</p>
    <param name="path_jdv" value="$jdv_participantAssociatedEntityCode"/>
    <param name="vue_elt" value="'participant/associatedEntity/code'"/>
    <param name="xpath_elt" value="cda:participant/cda:associatedEntity/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_participantAssociatedEntityCode.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_standardIndustryClassCode.sch?><pattern id="JDV_standardIndustryClassCode" is-a="dansJeuDeValeurs">
    <p>Conformité du cadre d'exercice du PS</p>
    <param name="path_jdv" value="$jdv_standardIndustryClassCode"/>
    <param name="vue_elt" value="'standardIndustryClassCode'"/>
    <param name="xpath_elt" value="cda:standardIndustryClassCode"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_standardIndustryClassCode.sch?>  
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_typeCode.sch?><pattern id="JDV_typeCode" is-a="dansJeuDeValeurs">
    <p>Conformité au CI-SIS du type de document</p>
    <param name="path_jdv" value="$jdv_typeCode"/>
    <param name="vue_elt" value="'ClinicalDocument/code'"/>
    <param name="xpath_elt" value="cda:ClinicalDocument/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_typeCode.sch?> 
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_confidentialityCode.sch?><pattern id="JDV_confidentialityCode" is-a="dansJeuDeValeurs">
    <p>Conformité au CI-SIS du confidentialityCode</p>
    <param name="path_jdv" value="$jdv_confidentialityCode"/>
    <param name="vue_elt" value="'ClinicalDocument/confidentialityCode'"/>
    <param name="xpath_elt" value="cda:ClinicalDocument/cda:confidentialityCode"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_confidentialityCode.sch?> 
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/en-tête/JDV_encompassingEncounterCode.sch?><pattern id="JDV_encompassingEncounterCode" is-a="dansJeuDeValeurs">
    <p>Conformité du componentOf/encompassingEncounter/code au CI-SIS</p>
    <param name="path_jdv" value="$jdv_encompassingEncounterCode"/>
    <param name="vue_elt" value="'ClinicalDocument/componentOf/encompassingEncounter/code'"/>
    <param name="xpath_elt" value="cda:componentOf/cda:encompassingEncounter/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/en-tête/JDV_encompassingEncounterCode.sch?>
     
    <!-- schématrons des JDV génériques -->
    <!--    <include href="../include/jeuxDeValeurs/JDV_clinicalStatusCodes.sch"/>-->
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_healthStatusCodes.sch?><pattern id="JDV_healthStatusCodes" is-a="dansJeuDeValeurs">
    <p>Conformité PCC du statut de santé d'un patient</p>
    <param name="path_jdv" value="$jdv_healthStatusCodes"/>
    <param name="vue_elt" value="'entryRelationship/observation/value'"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.2']/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_healthStatusCodes.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_substanceAdministration_approachSiteCode.sch?><pattern id="JDV_substanceAdministration_approachSiteCode" is-a="dansJeuDeValeurs">
    <p>Conformité des demandes d'examen complémentaires</p>
    <param name="path_jdv" value="$jdv_substanceAdministration_approachSiteCode"/>
    <param name="vue_elt" value="'substanceAdministration/approachSiteCode'"/>
    <param name="xpath_elt" value="cda:substanceAdministration/cda:approachSiteCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_substanceAdministration_approachSiteCode.sch?> 
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_problemCodes.sch?><pattern id="JDV_problemCodes" is-a="dansJeuDeValeurs">
    <p>Conformité PCC du statut de santé d'un patient</p>
    <param name="path_jdv" value="$jdv_problemCodes"/>
    <param name="vue_elt" value="'entry/observation/code'"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5' and not (cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.6')]/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_problemCodes.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_HL7_allergyintolerance_clinical.sch?><pattern id="JDV_HL7_allergyintolerance_clinical" is-a="dansJeuDeValeurs">
    <p>Conformité PCC du statut de santé d'un patient</p>
    <param name="path_jdv" value="$jdv_HL7_allergyintolerance_clinical"/>
    <param name="vue_elt" value="'observation/entryRelationship/observation/value'"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.6' or cda:templateId/@root='2.16.840.1.113883.10.20.1.54']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_HL7_allergyintolerance_clinical.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_HL7_conditionClinical.sch?><pattern id="JDV_HL7_conditionclinical" is-a="dansJeuDeValeurs">
    <p>Conformité PCC du statut de santé d'un patient</p>
    <param name="path_jdv" value="$jdv_HL7_conditionclinical"/>
    <param name="vue_elt" value="'observation/entryRelationship/observation/value'"/>
    <param name="xpath_elt" value="cda:observation[not(cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.6' or cda:templateId/@root='2.16.840.1.113883.10.20.1.54')]/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_HL7_conditionClinical.sch?>
    <!--<include href="../include/jeuxDeValeurs/JDV_actSubstanceAdministrationImmunizationCode.sch"/>-->
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_observationIntoleranceType.sch?><pattern id="JDV_observationIntoleranceType" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_observationIntoleranceType"/>
    <param name="vue_elt" value="observation/code"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.6']/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_observationIntoleranceType.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_substanceAdministration_ImmunizationRouteCodes.sch?><pattern id="JDV_substanceAdministration_ImmunizationRouteCodes" is-a="dansJeuDeValeurs">
    <p>Conformité du routeCode de l'entrée FR-Vaccination</p>
    <param name="path_jdv" value="$jdv_substanceAdministration_ImmunizationRouteCodes"/>
    <param name="vue_elt" value="substanceAdministration/routeCode"/>
    <param name="xpath_elt" value="cda:substanceAdministration[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12' or cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12.2']/cda:routeCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_substanceAdministration_ImmunizationRouteCodes.sch?>
<!--    <include href="../include/jeuxDeValeurs/JDV_substanceAdministration_RouteOfAdministration.sch"/>-->
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_vitalSignCode.sch?><pattern id="JDV_vitalSignCode" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_vitalSignCode"/>
    <param name="vue_elt" value="'observation/code'"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.2']/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_vitalSignCode.sch?>   
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_administrativeGenderCode.sch?><pattern id="JDV_administrativeGenderCode" is-a="dansJeuDeValeurs">
    <p>Conformité du code sexe d'une personne</p>
    <param name="path_jdv" value="$jdv_administrativeGenderCode"/>
    <param name="vue_elt" value="'administrativeGenderCode'"/>
    <param name="xpath_elt" value="//cda:administrativeGenderCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_administrativeGenderCode.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_SocialHistoryCodes.sch?><pattern id="JDV_SocialHistoryCodes" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_SocialHistoryCodes"/>
    <param name="vue_elt" value="observation[templateId/@root='1.2.250.1.213.1.1.3.52']/code"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.52']/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_SocialHistoryCodes.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_TypeDirectiveAnticipee.sch?><pattern id="JDV_TypeDirectiveAnticipee" is-a="dansJeuDeValeurs">
    <p>Conformité PCC du statut de santé d'un patient</p>
    <param name="path_jdv" value="$jdv_typeDirectiveAnticipee"/>
    <param name="vue_elt" value="'observation/code'"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.7']/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_TypeDirectiveAnticipee.sch?>
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_HL7_PersonalRelationshipRoleType.sch?><pattern id="JDV_HL7_PersonalRelationshipRoleType" is-a="dansJeuDeValeurs">
    <p>Conformité PCC du statut de santé d'un patient</p>
    <param name="path_jdv" value="$jdv_HL7_PersonalRelationshipRoleType_CISIS"/>
    <param name="vue_elt" value="'subject/relatedSubject/code'"/>
    <param name="xpath_elt" value="cda:subject[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.15.2']/cda:relatedSubject/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_HL7_PersonalRelationshipRoleType.sch?>
    
    
    <?DSDL_INCLUDE_START ../include/jeuxDeValeurs/JDV_ImmunizationCode.sch?><pattern id="immunizationCode" is-a="abstractImmunization">
    <p>Conformité du type de document au CI-SIS</p>
    <param name="path_jdv1" value="$jdv_immunization_1"/>
    <param name="path_jdv2" value="$jdv_immunization_2"/>
    <param name="vue_elt" value="'//substanceAdministration/code'"/>
    <param name="xpath_elt" value="//cda:substanceAdministration[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12']/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END ../include/jeuxDeValeurs/JDV_ImmunizationCode.sch?>
    
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->

    <phase id="Struct_minimale">

        <!-- obligatoire dans tout schématron -->
        <active pattern="variablesSM"/>

        <!-- schématrons des éléments de l'en-tête -->
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
        
        <!-- schématrons des JDV de l'en-tête -->
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
        
        <!-- schématrons des JDV génériques -->
        <!--<active pattern="JDV_actSubstanceAdministrationImmunizationCode"/>-->
        <!--<active pattern="JDV_clinicalStatusCodes"/>-->
        <active pattern="JDV_HL7_allergyintolerance_clinical"/>
        <active pattern="JDV_HL7_conditionclinical"/>
        <active pattern="JDV_healthStatusCodes"/>        
        <active pattern="JDV_observationIntoleranceType"/>  
        <active pattern="JDV_problemCodes"/>          
        <active pattern="JDV_substanceAdministration_approachSiteCode"/>         
        <active pattern="JDV_substanceAdministration_ImmunizationRouteCodes"/>
<!--        <active pattern="JDV_substanceAdministration_RouteOfAdministration"/>-->
        <active pattern="JDV_vitalSignCode"/>     
        <active pattern="JDV_administrativeGenderCode"/>
        <active pattern="JDV_SocialHistoryCodes"/>
        <active pattern="JDV_TypeDirectiveAnticipee"/>
        <active pattern="immunizationCode"/>
        <active pattern="JDV_HL7_PersonalRelationshipRoleType"/>
         
    </phase>

    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Variables globales          -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->

    <pattern id="variablesSM">
        
        <!-- JDV de l'en-tête -->          
        <let name="jdv_authenticatorSpecialty" value="'../../jeuxDeValeurs/JDV_J01_XdsAuthorSpecialty_CISIS.xml'"/>
        <let name="jdv_authorFunctionCode" value="'../../jeuxDeValeurs/JDV_J47_FunctionCode_CISIS.xml'"/>
<!--        <let name="jdv_authorFunctionCode_2" value="'../../jeuxDeValeurs/TRE_R259-HL7ParticipationFunction.xml'"/>
        <let name="jdv_authorFunctionCode_3" value="'../../jeuxDeValeurs/TRE_R85-RolePriseCharge.xml'"/>-->
        <let name="jdv_authorSpecialty" value="'../../jeuxDeValeurs/JDV_J01_XdsAuthorSpecialty_CISIS.xml'"/>
        <let name="jdv_componentOfResponsibleSpecialty" value="'../../jeuxDeValeurs/JDV_J01_XdsAuthorSpecialty_CISIS.xml'"/>
        <let name="jdv_healthcareFacilityCode" value="'../../jeuxDeValeurs/JDV_J02_XdsHealthcareFacilityTypeCode_CISIS.xml'"/>
        <let name="jdv_informantRelatedEntityCode" value="'../../jeuxDeValeurs/JDV_J11_RelationPatient_CISIS.xml'"/>
        <let name="jdv_legalAuthenticatorSpecialty" value="'../../jeuxDeValeurs/JDV_J01_XdsAuthorSpecialty_CISIS.xml'"/>
        <let name="jdv_participantFunctionCode" value="'../../jeuxDeValeurs/JDV_J47_FunctionCode_CISIS.xml'"/>
<!--        <let name="jdv_participantFunctionCode_2" value="'../../jeuxDeValeurs/TRE_R259-HL7ParticipationFunction.xml'"/>
        <let name="jdv_participantFunctionCode_3" value="'../../jeuxDeValeurs/TRE_R85-RolePriseCharge.xml'"/>-->
        <let name="jdv_participantAssociatedEntityCode" value="'../../jeuxDeValeurs/JDV_J01_XdsAuthorSpecialty_CISIS.xml'"/>
<!--        <let name="jdv_participantAssociatedEntityCode_2" value="'../../jeuxDeValeurs/TRE_A00-ProducteurDocNonPS.xml'"/>
        <let name="jdv_participantAssociatedEntityCode_3" value="'../../jeuxDeValeurs/TRE_R85-RolePriseCharge.xml'"/>
        <let name="jdv_participantAssociatedEntityCode_4" value="'../../jeuxDeValeurs/TRE_R94-ProfessionSocial.xml'"/>
        <let name="jdv_participantAssociatedEntityCode_5" value="'../../jeuxDeValeurs/TRE_R95-UsagerTitre.xml'"/>
        <let name="jdv_participantAssociatedEntityCode_6" value="'../../jeuxDeValeurs/TRE_R96-AutreProfDomSanitaire.xml'"/>-->
        <let name="jdv_standardIndustryClassCode" value="'../../jeuxDeValeurs/JDV_J04_XdsPracticeSettingCode_CISIS.xml'"/>
        <!--<let name="jdv_standardIndustryClassCode_2" value="'../../jeuxDeValeurs/TRE_A01-CadreExercice.xml'"/>-->
        <!--<let name="jdv_typeCode_1" value="'../../jeuxDeValeurs/TRE_A04-Loinc.xml'"/>
        <let name="jdv_typeCode_2" value="'../../jeuxDeValeurs/TRE_A05-TypeDocComplementaire.xml'"/>-->
        <let name="jdv_typeCode" value="'../../jeuxDeValeurs/JDV_J07_XdsTypeCode_CISIS.xml'"/>  
        <let name="jdv_confidentialityCode" value="'../../jeuxDeValeurs/JDV_HL7_Confidentiality_CISIS.xml'"/>
        <let name="jdv_encompassingEncounterCode" value="'../../jeuxDeValeurs/JDV_J142_TypeRencontre_CISIS.xml'"/>
        <!--<let name="jdv_encompassingEncounterCode_2" value="'../../jeuxDeValeurs/TRE_R305-TypeRencontre.xml'"/>-->
        
        <!-- JDV génériques -->
        <let name="jdv_actSubstanceAdministrationImmunizationCode" value="'../../jeuxDeValeurs/JDV_HL7_ActSubstanceAdministrationImmunizationCode_CISIS.xml'"/>        
        <let name="jdv_clinicalStatusCodes" value="'../../jeuxDeValeurs/JDV_ClinicalStatusCodes_CISIS.xml'"/>
        <let name="jdv_healthStatusCodes" value="'../../jeuxDeValeurs/JDV_HealthStatusCodes_CISIS.xml'"/>        
        <let name="jdv_observationIntoleranceType" value="'../../jeuxDeValeurs/JDV_HL7_ObservationIntoleranceType_CISIS.xml'"/>
        <let name="jdv_problemCodes" value="'../../jeuxDeValeurs/JDV_ProblemCodes_CISIS.xml'"/>
        <let name="jdv_HL7_allergyintolerance_clinical" value="'../../jeuxDeValeurs/JDV_HL7_allergyintolerance_clinical_CISIS.xml'"/>
        <let name="jdv_HL7_conditionclinical" value="'../../jeuxDeValeurs/JDV_HL7_ConditionClinical_CISIS.xml'"/>
        <!--<let name="jdv_substanceAdministration_approachSiteCode" value="'../../jeuxDeValeurs/JDV_HL7_HumanSubstanceAdministrationSite-CISIS.xml'"/>-->
        <let name="jdv_substanceAdministration_approachSiteCode" value="'../../jeuxDeValeurs/JDV_ImmunizationApproachSiteCode_CISIS.xml'"/>
        <let name="jdv_substanceAdministration_ImmunizationRouteCodes" value="'../../jeuxDeValeurs/JDV_ImmunizationRouteCodes_CISIS.xml'"/>
<!--        <let name="jdv_substanceAdministration_RouteOfAdministration" value="'../../jeuxDeValeurs/JDV_HL7_RouteOfAdministration-CISIS.xml'"/>-->
        <let name="jdv_vitalSignCode" value="'../../jeuxDeValeurs/JDV_SignesVitaux_CISIS.xml'"/>
        <let name="jdv_administrativeGenderCode" value="'../../jeuxDeValeurs/JDV_J143_AdministrativeGender_CISIS.xml'"/>
        <let name="jdv_SocialHistoryCodes" value="'../../jeuxDeValeurs/JDV_SocialHistoryCodes_CISIS.xml'"/>
<!--        <let name="jdv_AllergieReaction" value="'../../jeuxDeValeurs/JDV_AllergieReaction-CISIS.xml'"/> -->
        <let name="jdv_typeDirectiveAnticipee" value="'../../jeuxDeValeurs/JDV_TypeDirectiveAnticipee_CISIS.xml'"/>
        
        
        <let name="jdv_immunization_1" value="'../../jeuxDeValeurs/JDV_HL7_ActSubstanceAdministrationImmunizationCode_CISIS.xml'"/>
        <let name="jdv_immunization_2" value="'../../jeuxDeValeurs/JDV_AbsentOrUnknownImmunization_CISIS.xml'"/>
        <let name="jdv_HL7_PersonalRelationshipRoleType_CISIS" value="'../../jeuxDeValeurs/JDV_HL7_PersonalRelationshipRoleType_CISIS.xml'"/>
        
        <!-- présence des templateId obligatoires -->        
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