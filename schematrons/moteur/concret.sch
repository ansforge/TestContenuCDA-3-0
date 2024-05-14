<?xml version="1.0" encoding="UTF-8"?><schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cda="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" defaultPhase="CI-SIS_AVC-AUNV_2.2_2022.01" queryBinding="xslt2" schemaVersion="CI-SIS_AVC-AUNV_2.2_2022.01.sch">
    <title>Vérification de la conformité au modèle AVC-AUNV_2.2</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>

    
    <!--Suppressed abstract pattern dansJeuDeValeurs was here-->
    <!--Suppressed abstract pattern IVL_TS was here-->

    
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_ModeDeTransport">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.10.3.2']/cda:entry/cda:act/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/code"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/code"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_ModeDeTransport)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/code"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_ModeDeTransport"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_TopoTrouble">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='DA-21100' or cda:value/@code='R27.0']/cda:targetSiteCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_TopoTrouble)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_TopoTrouble"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_Lateralite">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='R27.0']/cda:targetSiteCode/cda:qualifier/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode/qualifier/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode/qualifier/value"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_Lateralite)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode/qualifier/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_Lateralite"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_LateraliteManuelle">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:value[@code='364940007']/cda:qualifier/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/value/qualifier/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/value/qualifier/value"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_LateraliteManuelle)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/value/qualifier/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_LateraliteManuelle"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_TroubleVisuel">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='H53.9']/cda:targetSiteCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_TroubleVisuel)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_TroubleVisuel"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_AutresSymptomesAVC">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='Y06.9']/cda:entryRelationship/cda:observation/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_AutresSymptomesAVC)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_AutresSymptomesAVC"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_CddFA">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:value/@code='D3-31520']/cda:entryRelationship/cda:observation[cda:code/@code='MED-350']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_CddFA)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_CddFA"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_SiteIntervention">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.12']/cda:entry/cda:procedure/cda:targetSiteCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/procedure/targetSiteCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/procedure/targetSiteCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_SiteIntervention)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/procedure/targetSiteCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_SiteIntervention"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_AutreSymptomeExNeuro">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.9.35']/cda:entry/cda:observation/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_AutreSymptomeExNeuro)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_AutreSymptomeExNeuro"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSConsInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70184-7']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSConsInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSConsInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSLocqInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70185-4']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSLocqInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSLocqInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSLoccInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70186-2']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSLoccInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSLoccInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSOculInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70187-0']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSOculInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSOculInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSCvInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70188-8']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSCvInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSCvInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSPfInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70189-6']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSPfInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSPfInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSMsInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70967-5' or cda:code/@code='70190-4']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSMsInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSMsInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSMiInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70968-3' or cda:code/@code='70191-2']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSMiInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSMiInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSAtaxInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70192-0']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSAtaxInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSAtaxInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSSensInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70193-8']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSSensInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSSensInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSLangInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70194-6']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSLangInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSLangInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSDysInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70195-3']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSDysInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSDysInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_NIHSSNeglInt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation         [cda:code/@code='70196-1']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_NIHSSNeglInt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_NIHSSNeglInt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_InterpretationECG">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:code/@code='F-38000']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_InterpretationECG)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_InterpretationECG"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_TypeLesionImagerie">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:code/@code='ACQK001' or cda:code/@code='ACQN001']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_TypeLesionImagerie)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_TypeLesionImagerie"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_TerritoireInfarctus">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:value[@code='D3-89400']/cda:qualifier/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/value/qualifier/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/value/qualifier/value"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_TerritoireInfarctus)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/value/qualifier/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_TerritoireInfarctus"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_ArtereAnt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation[cda:value/@code='255549009']/cda:targetSiteCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_ArtereAnt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_ArtereAnt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_ArterePost">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation[cda:value/@code='255551008']/cda:targetSiteCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_ArterePost)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_ArterePost"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_ArtereTronc">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation[cda:value/@code='15926001']/cda:targetSiteCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_ArtereTronc)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_ArtereTronc"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_ArtereCervelet">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='I63.9']/cda:entryRelationship/cda:observation[cda:value/@code='180924008']/cda:targetSiteCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_ArtereCervelet)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_ArtereCervelet"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_HemisphereLobaire">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='D3-89200']/cda:entryRelationship/cda:observation[cda:value/@code='MED-447']/cda:targetSiteCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_HemisphereLobaire)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_HemisphereLobaire"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_HemisphereProfond">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='D3-89200']/cda:entryRelationship/cda:observation[cda:value/@code='MED-466']/cda:targetSiteCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_HemisphereProfond)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_HemisphereProfond"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_CerveletLoc">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='D3-89200']/cda:entryRelationship/cda:observation[cda:value/@code='180924008']/cda:targetSiteCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_CerveletLoc)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_CerveletLoc"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_LocaThromboseVeineuse">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='I63.6']/cda:targetSiteCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_LocaThromboseVeineuse)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_LocaThromboseVeineuse"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_TypeTraitementIV">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:substanceAdministration/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/substanceAdministration/code"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/substanceAdministration/code"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_TypeTraitementIV)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/substanceAdministration/code"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_TypeTraitementIV"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_StatutEvt">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation[cda:code/@code='57189-3']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_StatutEvt)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_StatutEvt"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_ScoreFisher">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation[cda:code/@code='MED-485']/cda:interpretationCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_ScoreFisher)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_ScoreFisher"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_AntecedantsMedicaux-CISIS">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.134']/cda:entry/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.39']//cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.37']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_AntecedantsMedicaux-CISIS)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_AntecedantsMedicaux-CISIS"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_ExamenHemostaseAUVN-CISIS">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act[cda:code/@code='18720-3']/cda:entryRelationship/cda:observation/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/code"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/code"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_ExamenHemostaseAUVN-CISIS)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/code"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_ExamenHemostaseAUVN-CISIS"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_ExamenBiochimieAUVN-CISIS">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act[cda:code/@code='18719-5']/cda:entryRelationship/cda:observation/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/code"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/code"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_ExamenBiochimieAUVN-CISIS)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/code"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_ExamenBiochimieAUVN-CISIS"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_ExamenHematologieAUNV-CISIS">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act[cda:code/@code='18723-7']/cda:entryRelationship/cda:organizer/cda:component/cda:observation/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/organizer/component/observation/code"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH' or              @nullFlavor='NINF' or              @nullFlavor='PINF' or              @nullFlavor='TRC')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/organizer/component/observation/code"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_ExamenHematologieAUNV-CISIS)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/organizer/component/observation/code"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_ExamenHematologieAUNV-CISIS"/>.
        </assert>
    </rule>
</pattern>


    
    <pattern id="Entete_AVC-AUNV">
    
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent">
         
        
        <assert test="cda:performer/cda:assignedEntity/cda:representedOrganization">
            [Entete_AVC-AUNV] L'organisation représentée est obligatoirement présente 
        </assert>
    </rule>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.15']"> 
            [Entete_AVC-AUNV] Le template du modèle AVC-AUNV (1.2.250.1.213.1.1.1.15) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='34133-9' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_AVC-AUNV] L'élément code doit avoir @code ="34133-9" et @codeSystem = "2.16.840.1.113883.6.1" 
        </assert>
    </rule>
    
    
</pattern>

    
    
    

    <phase id="CI-SIS_AVC-AUNV_2.2_2022.01">
        <active pattern="variables"/>

        
        <active pattern="JDV_ModeDeTransport"/>
        <active pattern="JDV_TopoTrouble"/>
        <active pattern="JDV_Lateralite"/>
        <active pattern="JDV_LateraliteManuelle"/>
        <active pattern="JDV_TroubleVisuel"/>
        <active pattern="JDV_AutresSymptomesAVC"/>
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
        <active pattern="JDV_TerritoireInfarctus"/>
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
        <active pattern="JDV_ExamenHemostaseAUVN-CISIS"/>
        <active pattern="JDV_ExamenBiochimieAUVN-CISIS"/>
        <active pattern="JDV_ExamenHematologieAUNV-CISIS"/>


        
        <active pattern="Entete_AVC-AUNV"/>

    </phase>

    
    <pattern id="variables">

        
        <let name="JDV_ModeDeTransport" value="'../jeuxDeValeurs/JDV_ModeDeTransport_CISIS.xml'"/>
        <let name="JDV_TopoTrouble" value="'../jeuxDeValeurs/JDV_TopoTrouble_CISIS.xml'"/>
        <let name="JDV_Lateralite" value="'../jeuxDeValeurs/JDV_Lateralite_CISIS.xml'"/>
        <let name="JDV_LateraliteManuelle" value="'../jeuxDeValeurs/JDV_LateraliteManuelle_CISIS.xml'"/>
        <let name="JDV_TroubleVisuel" value="'../jeuxDeValeurs/JDV_TroubleVisuel_CISIS.xml'"/>
        <let name="JDV_AutresSymptomesAVC" value="'../jeuxDeValeurs/JDV_AutresSymptomesAVC_CISIS.xml'"/>
        <let name="JDV_CddFA" value="'../jeuxDeValeurs/JDV_CddFA_CISIS.xml'"/>
        <let name="JDV_SiteIntervention" value="'../jeuxDeValeurs/JDV_SiteIntervention_CISIS.xml'"/>
        <let name="JDV_AutreSymptomeExNeuro" value="'../jeuxDeValeurs/JDV_AutreSymptomeExNeuro_CISIS.xml'"/>
        <let name="JDV_NIHSSConsInt" value="'../jeuxDeValeurs/JDV_NIHSSConsInt_CISIS.xml'"/>
        <let name="JDV_NIHSSLocqInt" value="'../jeuxDeValeurs/JDV_NIHSSLocqInt_CISIS.xml'"/>
        <let name="JDV_NIHSSLoccInt" value="'../jeuxDeValeurs/JDV_NIHSSLoccInt_CISIS.xml'"/>
        <let name="JDV_NIHSSOculInt" value="'../jeuxDeValeurs/JDV_NIHSSOculInt_CISIS.xml'"/>
        <let name="JDV_NIHSSCvInt" value="'../jeuxDeValeurs/JDV_NIHSSCvInt_CISIS.xml'"/>
        <let name="JDV_NIHSSPfInt" value="'../jeuxDeValeurs/JDV_NIHSSPfInt_CISIS.xml'"/>
        <let name="JDV_NIHSSMsInt" value="'../jeuxDeValeurs/JDV_NIHSSMsInt_CISIS.xml'"/>
        <let name="JDV_NIHSSMiInt" value="'../jeuxDeValeurs/JDV_NIHSSMiInt_CISIS.xml'"/>
        <let name="JDV_NIHSSAtaxInt" value="'../jeuxDeValeurs/JDV_NIHSSAtaxInt_CISIS.xml'"/>
        <let name="JDV_NIHSSSensInt" value="'../jeuxDeValeurs/JDV_NIHSSSensInt_CISIS.xml'"/>
        <let name="JDV_NIHSSLangInt" value="'../jeuxDeValeurs/JDV_NIHSSLangInt_CISIS.xml'"/>
        <let name="JDV_NIHSSDysInt" value="'../jeuxDeValeurs/JDV_NIHSSDysInt_CISIS.xml'"/>
        <let name="JDV_NIHSSNeglInt" value="'../jeuxDeValeurs/JDV_NIHSSNeglInt_CISIS.xml'"/>
        <let name="JDV_InterpretationECG" value="'../jeuxDeValeurs/JDV_InterpretationECG_CISIS.xml'"/>
        <let name="JDV_TypeLesionImagerie" value="'../jeuxDeValeurs/JDV_TypeLesionImagerie_CISIS.xml'"/>
        <let name="JDV_TerritoireInfarctus" value="'../jeuxDeValeurs/JDV_TerritoireInfarctus_CISIS.xml'"/>
        <let name="JDV_ArtereAnt" value="'../jeuxDeValeurs/JDV_ArtereAnt_CISIS.xml'"/>
        <let name="JDV_ArterePost" value="'../jeuxDeValeurs/JDV_ArterePost_CISIS.xml'"/>
        <let name="JDV_ArtereTronc" value="'../jeuxDeValeurs/JDV_ArtereTronc_CISIS.xml'"/>
        <let name="JDV_ArtereCervelet" value="'../jeuxDeValeurs/JDV_ArtereCervelet_CISIS.xml'"/>
        <let name="JDV_HemisphereLobaire" value="'../jeuxDeValeurs/JDV_HemisphereLobaire_CISIS.xml'"/>
        <let name="JDV_HemisphereProfond" value="'../jeuxDeValeurs/JDV_HemisphereProfond_CISIS.xml'"/>
        <let name="JDV_CerveletLoc" value="'../jeuxDeValeurs/JDV_CerveletLoc_CISIS.xml'"/>
        <let name="JDV_LocaThromboseVeineuse" value="'../jeuxDeValeurs/JDV_LocaThromboseVeineuse_CISIS.xml'"/>
        <let name="JDV_TypeTraitementIV" value="'../jeuxDeValeurs/JDV_TypeTraitementIV_CISIS.xml'"/>
        <let name="JDV_StatutEvt" value="'../jeuxDeValeurs/JDV_StatutEvt_CISIS.xml'"/>
        <let name="JDV_ScoreFisher" value="'../jeuxDeValeurs/JDV_ScoreFisher_CISIS.xml'"/>
        <let name="JDV_AntecedantsMedicaux-CISIS" value="'../jeuxDeValeurs/JDV_AntecedantsMedicaux_CISIS.xml'"/>
        <let name="JDV_ExamenHemostaseAUVN-CISIS" value="'../jeuxDeValeurs/JDV_ExamenHemostaseAUVN_CISIS.xml'"/>
        <let name="JDV_ExamenBiochimieAUVN-CISIS" value="'../jeuxDeValeurs/JDV_ExamenBiochimieAUVN_CISIS.xml'"/>
        <let name="JDV_ExamenHematologieAUNV-CISIS" value="'../jeuxDeValeurs/JDV_ExamenHematologieAUVN_CISIS.xml'"/>

    </pattern>
</schema>