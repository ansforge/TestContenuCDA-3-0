<?xml version="1.0" encoding="UTF-8"?><!-- 
    CI-SIS_AVC-AUNV_2.2_2022.01.sch - ANS
    ......................................................................................................................................................    
    Historique :
        29/10/2013 : Création
        15/04/2015 : Ajout du schematron AVC_codedPhysicalExam20150415.sch ( vérification de la presence des sous sections obligatoires)
                     Ajout du schematron neurologicPhysicalExam20110627.sch
                     Mise à jour du schematron AVC_CodedReasonForReferralEntries20131030.sch -> AVC_CodedReasonForReferralEntries20150417.sch
                     Ajout du schematron immunoHemato20150506.sch
                     Ajout du schematron RankinScoreSection20150506.sch
                     Ajout du schematron GlasgowScoreSection20150506.sch
                     Ajout du schematron bilanPretherapeutique20150506.sch
                     Ajout du schematron AVC_activeProblemSection20150417.sch
                     Maj des include telecom20110728.sch                         -> telecom20150317.sch
                     Maj des include codedListOfSurgeries20120718.sch            -> codedListOfSurgeries20150319.sch
       14/03/2018 :  MAJ du pattern variables
       28/10/2020 :  Suppression des schématrons de JDV génériques déjà testé à partir de CI-SIS_StructurationMinimale.sch
       10/09/2021 :  Modification du nom du schematron
--><schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cda="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" defaultPhase="CI-SIS_AVC-AUNV_2.2_2022.01" queryBinding="xslt2" schemaVersion="CI-SIS_AVC-AUNV_2.2_2022.01.sch">
    <title>Vérification de la conformité au modèle AVC-AUNV_2.2</title>
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
    
    <!-- JDV -->
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ModeDeTransport.sch?><pattern id="JDV_ModeDeTransport" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_ModeDeTransport"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.10.3.2']/cda:entry/cda:act/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ModeDeTransport.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TopoTrouble.sch?><pattern id="JDV_TopoTrouble" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_TopoTrouble"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='DA-21100' or cda:value/@code='F-A4580']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TopoTrouble.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_Lateralite.sch?><pattern id="JDV_Lateralite" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_Lateralite"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode/qualifier/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='DA-21100' or cda:value/@code='F-A4580']/cda:targetSiteCode/cda:qualifier/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_Lateralite.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_LateraliteManuelle.sch?><pattern id="JDV_LateraliteManuelle" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_LateraliteManuelle"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value/qualifier/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:value[@code='F-A5400']/cda:qualifier/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_LateraliteManuelle.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TroubleVisuel.sch?><pattern id="JDV_TroubleVisuel" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_TroubleVisuel"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='DA-70080']/cda:entryRelationship/cda:observation/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TroubleVisuel.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_AutresSymptomesAVC.sch?><pattern id="JDV_AutresSymptomesAVC" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_AutresSymptomesAVC"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='AVC-163']/cda:entryRelationship/cda:observation/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_AutresSymptomesAVC.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TypeDiabete.sch?><pattern id="JDV_TypeDiabete" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_TypeDiabete"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation[cda:code/@code='AVC-001']/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TypeDiabete.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TypeMigraine.sch?><pattern id="JDV_TypeMigraine" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_TypeMigraine"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value/qualifier/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:value[@code='DA-38000']/cda:qualifier/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TypeMigraine.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_CddFA.sch?><pattern id="JDV_CddFA" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_CddFA"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:value/@code='D3-31520']/cda:entryRelationship/cda:observation[cda:code/@code='AVC-006']/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_CddFA.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_SiteIntervention.sch?><pattern id="JDV_SiteIntervention" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_SiteIntervention"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/procedure/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.12']/cda:entry/cda:procedure/cda:targetSiteCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_SiteIntervention.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_AutreSymptomeExNeuro.sch?><pattern id="JDV_AutreSymptomeExNeuro" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_AutreSymptomeExNeuro"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.9.35']/cda:entry/cda:observation/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_AutreSymptomeExNeuro.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSConsInt.sch?><pattern id="JDV_NIHSSConsInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSConsInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70184-7']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSConsInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSLocqInt.sch?><pattern id="JDV_NIHSSLocqInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSLocqInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70185-4']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSLocqInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSLoccInt.sch?><pattern id="JDV_NIHSSLoccInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSLoccInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70186-2']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSLoccInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSOculInt.sch?><pattern id="JDV_NIHSSOculInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSOculInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70187-0']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSOculInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSCvInt.sch?><pattern id="JDV_NIHSSCvInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSCvInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70188-8']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSCvInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSPfInt.sch?><pattern id="JDV_NIHSSPfInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSPfInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70189-6']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSPfInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSMsInt.sch?><pattern id="JDV_NIHSSMsInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSMsInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70967-5' or cda:code/@code='70190-4']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSMsInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSMiInt.sch?><pattern id="JDV_NIHSSMiInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSMiInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70968-3' or cda:code/@code='70191-2']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSMiInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSAtaxInt.sch?><pattern id="JDV_NIHSSAtaxInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSAtaxInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70192-0']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSAtaxInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSSensInt.sch?><pattern id="JDV_NIHSSSensInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSSensInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70193-8']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSSensInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSLangInt.sch?><pattern id="JDV_NIHSSLangInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSLangInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70194-6']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSLangInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSDysInt.sch?><pattern id="JDV_NIHSSDysInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSDysInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70195-3']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSDysInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSNeglInt.sch?><pattern id="JDV_NIHSSNeglInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_NIHSSNeglInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70196-1']/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_NIHSSNeglInt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_InterpretationECG.sch?><pattern id="JDV_InterpretationECG" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_InterpretationECG"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:code/@code='F-38000']/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_InterpretationECG.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TypeLesionImagerie.sch?><pattern id="JDV_TypeLesionImagerie" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_TypeLesionImagerie"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:code/@code='ACQK001' or cda:code/@code='ACQN001']/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TypeLesionImagerie.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_territoireInfarctus.sch?><pattern id="JDV_territoireInfarctus" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_territoireInfarctus"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value/qualifier/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:value[@code='D3-89400']/cda:qualifier/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_territoireInfarctus.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ArtereAnt.sch?><pattern id="JDV_ArtereAnt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_ArtereAnt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation[cda:value/@code='G-A105']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ArtereAnt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ArterePost.sch?><pattern id="JDV_ArterePost" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_ArterePost"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation[cda:value/@code='G-A106']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ArterePost.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ArtereTronc.sch?><pattern id="JDV_ArtereTronc" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_ArtereTronc"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation[cda:value/@code='T-A2050']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ArtereTronc.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ArtereCervelet.sch?><pattern id="JDV_ArtereCervelet" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_ArtereCervelet"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='D3-89400']/cda:entryRelationship/cda:observation[cda:value/@code='T-A6000']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ArtereCervelet.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_HemisphereLobaire.sch?><pattern id="JDV_HemisphereLobaire" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_HemisphereLobaire"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='D3-89200']/cda:entryRelationship/cda:observation[cda:value/@code='AVC-161']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_HemisphereLobaire.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_HemisphereProfond.sch?><pattern id="JDV_HemisphereProfond" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_HemisphereProfond"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='D3-89200']/cda:entryRelationship/cda:observation[cda:value/@code='AVC-160']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_HemisphereProfond.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_CerveletLoc.sch?><pattern id="JDV_CerveletLoc" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_CerveletLoc"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='D3-89200']/cda:entryRelationship/cda:observation[cda:value/@code='T-A6000']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_CerveletLoc.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_LocaThromboseVeineuse.sch?><pattern id="JDV_LocaThromboseVeineuse" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_LocaThromboseVeineuse"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='D3-89424']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_LocaThromboseVeineuse.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TypeTraitementIV.sch?><pattern id="JDV_TypeTraitementIV" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_TypeTraitementIV"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/substanceAdministration/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:substanceAdministration/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_TypeTraitementIV.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_StatutEvt.sch?><pattern id="JDV_StatutEvt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_StatutEvt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:code/@code='D9-30171' or cda:code/@code='F-9B721' or cda:code/@code='P2-45020' or cda:code/@code='AVC-004']/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_StatutEvt.sch?>
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ScoreFisher.sch?><pattern id="JDV_ScoreFisher" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_ScoreFisher"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='D3-89110']/cda:entryRelationship/cda:observation/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_ScoreFisher.sch?>   
    <?DSDL_INCLUDE_START include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_AntecedantsMedicaux-CISIS.sch?><pattern id="JDV_AntecedantsMedicaux-CISIS" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_AntecedantsMedicaux-CISIS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.134']/cda:entry/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.39']//cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.37']/cda:value"/>
<param name="nullFlavor" value="0"/>
    
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/AVC_2.2_2022.01/JDV_AntecedantsMedicaux-CISIS.sch?>  
    
    <!--Entete-->
    <?DSDL_INCLUDE_START include/specificationsVolets/AVC_2.2_2022.01/Entete/Entete_AVC.sch?><pattern id="Entete_AVC">
    
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent">
         
        <!-- Teste la présence de la representedOrganisation -->
        <assert test="cda:performer/cda:assignedEntity/cda:representedOrganization">
            [Entete_AVC] L'organisation représentée est obligatoirement présente 
        </assert>
    </rule>
    
    
</pattern><?DSDL_INCLUDE_END include/specificationsVolets/AVC_2.2_2022.01/Entete/Entete_AVC.sch?>
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_AVC-AUNV_2.2_2022.01">
        <active pattern="variables"/>
        
        <!-- JDV -->
        <active pattern="JDV_ModeDeTransport"/>
        <active pattern="JDV_TopoTrouble"/>
        <active pattern="JDV_Lateralite"/>
        <active pattern="JDV_LateraliteManuelle"/>
        <active pattern="JDV_TroubleVisuel"/>
        <active pattern="JDV_AutresSymptomesAVC"/>
        <active pattern="JDV_TypeDiabete"/>
        <active pattern="JDV_TypeMigraine"/>
        <active pattern="JDV_CddFA"/>
        <active pattern="JDV_SiteIntervention"/>
        <active pattern="JDV_AutreSymptomeExNeuro"/>
        <active pattern="JDV_NIHSSConsInt"/>
        <active pattern="JDV_NIHSSLocqInt"/>
        <active pattern="JDV_NIHSSLoccInt"/>
        <active pattern="JDV_NIHSSOculInt"/>
        <active pattern="JDV_NIHSSCvInt"/>
        <active pattern="JDV_NIHSSPfInt"/>
        <active pattern="JDV_NIHSSMsInt"/>
        <active pattern="JDV_NIHSSMiInt"/>
        <active pattern="JDV_NIHSSAtaxInt"/>
        <active pattern="JDV_NIHSSSensInt"/>
        <active pattern="JDV_NIHSSLangInt"/>
        <active pattern="JDV_NIHSSDysInt"/>
        <active pattern="JDV_NIHSSNeglInt"/>
        <active pattern="JDV_InterpretationECG"/>
        <active pattern="JDV_TypeLesionImagerie"/>
        <active pattern="JDV_territoireInfarctus"/>
        <active pattern="JDV_ArtereAnt"/>
        <active pattern="JDV_ArterePost"/>
        <active pattern="JDV_ArtereTronc"/>
        <active pattern="JDV_ArtereCervelet"/>
        <active pattern="JDV_HemisphereLobaire"/>
        <active pattern="JDV_HemisphereProfond"/>
        <active pattern="JDV_CerveletLoc"/>
        <active pattern="JDV_LocaThromboseVeineuse"/>
        <active pattern="JDV_TypeTraitementIV"/>
        <active pattern="JDV_StatutEvt"/>
        <active pattern="JDV_ScoreFisher"/>  
        <active pattern="JDV_AntecedantsMedicaux-CISIS"/> 
        
        <!--Entete-->
        <active pattern="Entete_AVC"/>
        
    </phase>
    
    <!--=<<o#%@O[ Variables globales ]O@%#o>>=-->
    <pattern id="variables">

        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="JDV_ModeDeTransport" value="'../jeuxDeValeurs/JDV_ModeDeTransport-CISIS.xml'"/>
        <let name="JDV_TopoTrouble" value="'../jeuxDeValeurs/JDV_TopoTrouble-CISIS.xml'"/>
        <let name="JDV_Lateralite" value="'../jeuxDeValeurs/JDV_Lateralite-CISIS.xml'"/>
        <let name="JDV_LateraliteManuelle" value="'../jeuxDeValeurs/JDV_LateraliteManuelle-CISIS.xml'"/>
        <let name="JDV_TroubleVisuel" value="'../jeuxDeValeurs/JDV_TroubleVisuel-CISIS.xml'"/>
        <let name="JDV_AutresSymptomesAVC" value="'../jeuxDeValeurs/JDV_AutresSymptomesAVC-CISIS.xml'"/>
        <let name="JDV_TypeDiabete" value="'../jeuxDeValeurs/JDV_TypeDiabete-CISIS.xml'"/>
        <let name="JDV_TypeMigraine" value="'../jeuxDeValeurs/JDV_TypeMigraine-CISIS.xml'"/>
        <let name="JDV_CddFA" value="'../jeuxDeValeurs/JDV_CddFA-CISIS.xml'"/>
        <let name="JDV_SiteIntervention" value="'../jeuxDeValeurs/JDV_SiteIntervention-CISIS.xml'"/>
        <let name="JDV_AutreSymptomeExNeuro" value="'../jeuxDeValeurs/JDV_AutreSymptomeExNeuro-CISIS.xml'"/>
        <let name="JDV_NIHSSConsInt" value="'../jeuxDeValeurs/JDV_NIHSSConsInt-CISIS.xml'"/>  
        <let name="JDV_NIHSSLocqInt" value="'../jeuxDeValeurs/JDV_NIHSSLocqInt-CISIS.xml'"/>  
        <let name="JDV_NIHSSLoccInt" value="'../jeuxDeValeurs/JDV_NIHSSLoccInt-CISIS.xml'"/>  
        <let name="JDV_NIHSSOculInt" value="'../jeuxDeValeurs/JDV_NIHSSOculInt-CISIS.xml'"/>
        <let name="JDV_NIHSSCvInt" value="'../jeuxDeValeurs/JDV_NIHSSCvInt-CISIS.xml'"/>
        <let name="JDV_NIHSSPfInt" value="'../jeuxDeValeurs/JDV_NIHSSPfInt-CISIS.xml'"/>
        <let name="JDV_NIHSSMsInt" value="'../jeuxDeValeurs/JDV_NIHSSMsInt-CISIS.xml'"/>
        <let name="JDV_NIHSSMiInt" value="'../jeuxDeValeurs/JDV_NIHSSMiInt-CISIS.xml'"/>
        <let name="JDV_NIHSSAtaxInt" value="'../jeuxDeValeurs/JDV_NIHSSAtaxInt-CISIS.xml'"/>
        <let name="JDV_NIHSSSensInt" value="'../jeuxDeValeurs/JDV_NIHSSSensInt-CISIS.xml'"/>
        <let name="JDV_NIHSSLangInt" value="'../jeuxDeValeurs/JDV_NIHSSLangInt-CISIS.xml'"/>
        <let name="JDV_NIHSSDysInt" value="'../jeuxDeValeurs/JDV_NIHSSDysInt-CISIS.xml'"/>
        <let name="JDV_NIHSSNeglInt" value="'../jeuxDeValeurs/JDV_NIHSSNeglInt-CISIS.xml'"/>
        <let name="JDV_InterpretationECG" value="'../jeuxDeValeurs/JDV_InterpretationECG-CISIS.xml'"/>
        <let name="JDV_TypeLesionImagerie" value="'../jeuxDeValeurs/JDV_TypeLesionImagerie-CISIS.xml'"/>
        <let name="JDV_territoireInfarctus" value="'../jeuxDeValeurs/JDV_territoireInfarctus-CISIS.xml'"/>
        <let name="JDV_ArtereAnt" value="'../jeuxDeValeurs/JDV_ArtereAnt-CISIS.xml'"/>
        <let name="JDV_ArterePost" value="'../jeuxDeValeurs/JDV_ArterePost-CISIS.xml'"/>
        <let name="JDV_ArtereTronc" value="'../jeuxDeValeurs/JDV_ArtereTronc-CISIS.xml'"/>
        <let name="JDV_ArtereCervelet" value="'../jeuxDeValeurs/JDV_ArtereCervelet-CISIS.xml'"/>
        <let name="JDV_HemisphereLobaire" value="'../jeuxDeValeurs/JDV_HemisphereLobaire-CISIS.xml'"/>
        <let name="JDV_HemisphereProfond" value="'../jeuxDeValeurs/JDV_HemisphereProfond-CISIS.xml'"/>
        <let name="JDV_CerveletLoc" value="'../jeuxDeValeurs/JDV_CerveletLoc-CISIS.xml'"/>
        <let name="JDV_LocaThromboseVeineuse" value="'../jeuxDeValeurs/JDV_LocaThromboseVeineuse-CISIS.xml'"/>
        <let name="JDV_TypeTraitementIV" value="'../jeuxDeValeurs/JDV_TypeTraitementIV-CISIS.xml'"/>
        <let name="JDV_StatutEvt" value="'../jeuxDeValeurs/JDV_StatutEvt-CISIS.xml'"/>
        <let name="JDV_ScoreFisher" value="'../jeuxDeValeurs/JDV_ScoreFisher-CISIS.xml'"/>
        <let name="JDV_AntecedantsMedicaux-CISIS" value="'../jeuxDeValeurs/JDV_AntecedantsMedicaux-CISIS.xml'"/>
        
        <rule context="cda:ClinicalDocument">
            <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.15']"> 
                [CI-SIS_AVC-AUNV_2.2_2022.01] Le template du modèle AVC-AUNV (1.2.250.1.213.1.1.1.15) doit être présent.
            </assert>
            
            <assert test="./cda:code[@code='34133-9' and @codeSystem='2.16.840.1.113883.6.1']"> 
                [CI-SIS_AVC-AUNV_2.2_2022.01] L'élément code doit avoir @code ="34133-9" et @codeSystem = "2.16.840.1.113883.6.1" 
            </assert>
        </rule>
    </pattern>
</schema>