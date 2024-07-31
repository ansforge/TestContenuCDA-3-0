<?xml version="1.0" encoding="UTF-8"?><!-- 
   Schématron : CI-SIS_DLU-EHPAD-FLUDT_2022.01.sch
   Vérification de la conformité au modèle du document DLU_FLUDT_2021.01 (Fiche de transfert de l'EHPAD vers le service des urgences)
   ...................................................................................................................................................... 
   auteur : ANS
   ......................................................................................................................................................     
    Historique :
       06/11/2017 : Création
       14/03/2018 : Suppression du pattern variables
       06/01/2021 : Ajout du contrôle du JDV_ProtheseObjetPersonnel
       19/02/2021 : Test de la présence des sections, du templateId du volet et du code
       28/08/2023 : Migration des terminologies et JDV
   ......................................................................................................................................................
       --><schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cda="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" queryBinding="xslt2" schemaVersion="CI-SIS_DLU-EHPAD-FLUDT_2022.01.sch">
    
        <title>Rapport de conformité au modèle DLU-FLUDT</title>
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
        
        <!-- Schématrons JDV spécifiques au DLU-FLUDT -->
        <?DSDL_INCLUDE_START include/jeuxDeValeurs/DLU-EHPAD-FLUDT_2022.01/JDV_ProtheseObjetPersonnel.sch?><pattern id="JDV_ProtheseObjetPersonnel" is-a="dansJeuDeValeurs">
    <p>Conformité DLU-DLU du code des observations section FR-Resultats-evenements</p>
    <param name="path_jdv" value="$JDV_ProtheseObjetPersonnel"/>
    <param name="vue_elt" value="'observation/code'"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.12']/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern><?DSDL_INCLUDE_END include/jeuxDeValeurs/DLU-EHPAD-FLUDT_2022.01/JDV_ProtheseObjetPersonnel.sch?>
        
        <!-- Schématron Entete spécifiques au DLU-FLUDT -->
        <?DSDL_INCLUDE_START include/specificationsVolets/DLU-EHPAD-FLUDT_2022.01/Entete/Entete_DLU-FLUDT.sch?><pattern id="Entete_DLU-FLUDT">
    
    <rule context="cda:ClinicalDocument">
        
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.23']"> 
            [Entete_DLU-FLUDT] Le templateId "1.2.250.1.213.1.1.1.23" (Conformité au modèle DLU-FLUDT du CI-SIS) doit être présent.
        </assert>
        <assert test="./cda:code[@code='74207-2' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_DLU-FLUDT] L'élément code doit avoir @code ="74207-2" et @codeSystem = "2.16.840.1.113883.6.1"/&gt;. 
        </assert>
        
        <assert test="cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime">
            [Entete_DLU-FLUDT] La date de naissance du patient est obligatoirement présente
        </assert>
        
        <assert test="cda:documentationOf/cda:serviceEvent/cda:code[@code='28651-8']">
            [Entete_DLU-FLUDT] L’attribut code de l’élément documentationOf/serviceEvent/code prend la valeur '28651-8'
        </assert>
        
        <assert test="cda:documentationOf/cda:serviceEvent/cda:effectiveTime">
            [Entete_DLU-FLUDT] Dans le contexte du DLU, la date du début d'exécution de l'acte est obligatoire
        </assert>
        
        <report test="cda:documentationOf/cda:serviceEvent/cda:effectiveTime[@nullFlavor] or cda:documentationOf/cda:serviceEvent/cda:effectiveTime/cda:low[@nullFlavor]">
            [Entete_DLU-FLUDT] Dans le contexte du DLU, l'utilisation du nullFlavor pour la date du début d'exécution de l'acte est interdite
        </report>
        
    </rule>
</pattern><?DSDL_INCLUDE_END include/specificationsVolets/DLU-EHPAD-FLUDT_2022.01/Entete/Entete_DLU-FLUDT.sch?>
        
        
        <!-- Schématron Section spécifiques au DLU-FLUDT -->
        <?DSDL_INCLUDE_START include/specificationsVolets/DLU-EHPAD-FLUDT_2022.01/Sections/S_ResultatsEvenements_DLU-FLUDT.sch?><pattern id="S_ResultatsEvenements_DLU-FLUDT">
    <title>CI-SIS DLU-FLUDT Section Résultats d'évènements</title>
    
    <rule context="cda:section[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.7.3.1.1.13.7&#34;]/cda:entry/cda:observation[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34;]">
        <!-- Vérifier le code de l'entrée 'FR-Simple observation' -->
        <assert test="cda:code/@code=&#34;57277-6&#34;">
            [S_ResultatsEvenements_DLU-FLUDT] Erreur de conformité : l'entrée FR-Simple observation doit avoir le code '57277-6' pour le motif du transfert vers le service des urgences.
        </assert>
    </rule>
    
</pattern><?DSDL_INCLUDE_END include/specificationsVolets/DLU-EHPAD-FLUDT_2022.01/Sections/S_ResultatsEvenements_DLU-FLUDT.sch?>
        <?DSDL_INCLUDE_START include/specificationsVolets/DLU-EHPAD-FLUDT_2022.01/Sections/S_ResultatsExamens_DLU-FLUDT.sch?><pattern id="S_ResultatsExamens_DLU-FLUDT">
    <title>CI-SIS DLU-FLUDT Section Résultats d'examens</title>
    
    <rule context="cda:section[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.28&#34;]">
        <!-- Vérifier le code de l'entrée 'FR-Simple observation' -->
        <assert test="./cda:entry/cda:observation[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34; and not(cda:code/@code=&#34;R52.9&#34;)]/cda:code/@code=&#34;DLU_002&#34; or              ./cda:entry/cda:observation[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34; and not(cda:code/@code=&#34;R52.9&#34;)]/cda:code/@code=&#34;DLU_003&#34; or             ./cda:entry/cda:observation[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34; and not(cda:code/@code=&#34;R52.9&#34;)]/cda:code/@code=&#34;DLU_004&#34;">
            [S_ResultatsExamens_DLU-FLUDT] Erreur de conformité : l'entrée FR-Simple observation doit avoir le code 'DLU_002' ou 'DLU_003' ou  'DLU_004'.
        </assert>
    </rule>
    
</pattern><?DSDL_INCLUDE_END include/specificationsVolets/DLU-EHPAD-FLUDT_2022.01/Sections/S_ResultatsExamens_DLU-FLUDT.sch?>
        
        <phase id="CI-SIS_DLU-EHPAD-FLUDT_2022.01">
           <active pattern="variables"/>
           <active pattern="Entete_DLU-FLUDT"/>
           <active pattern="JDV_ProtheseObjetPersonnel"/>
                <active pattern="S_ResultatsEvenements_DLU-FLUDT"/>
                <active pattern="S_ResultatsExamens_DLU-FLUDT"/>
        </phase>
        
        <pattern id="variables">
                <let name="JDV_ProtheseObjetPersonnel" value="'../jeuxDeValeurs/JDV_ProtheseObjetPersonnel_CISIS.xml'"/>
                <rule context="cda:ClinicalDocument">
                        <assert test="count(cda:component/cda:structuredBody/cda:component/cda:section/cda:templateId[@root='1.3.6.1.4.1.19376.1.7.3.1.1.13.7'])=1"> 
                                [CI-SIS_DLU-EHPAD-FLUDT_2022.01] La section "Resultats d'évenements : Transfert du patient de l'EHPAD vers le SU" doit être présente une fois. Cardinalité [1..1].
                        </assert>
                        <assert test="count(cda:component/cda:structuredBody/cda:component/cda:section/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.3.25'])=1"> 
                                [CI-SIS_DLU-EHPAD-FLUDT_2022.01] La section "Signes vitaux : Pouls / Température / Poids / Tension artérielle haute / Tension artérielle basse" doit être présente une fois. Cardinalité [1..1].
                        </assert>
                        <assert test="count(cda:component/cda:structuredBody/cda:component/cda:section/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.3.28'])=1"> 
                                [CI-SIS_DLU-EHPAD-FLUDT_2022.01] La section "Resultats d'examens : Patient Conscient et éveillé / Eveillable / Non éveillable + Douleurs récentes" doit être présente une fois. Cardinalité [1..1].
                        </assert>
                        <assert test="count(cda:component/cda:structuredBody/cda:component/cda:section/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.3.19'])=1"> 
                                [CI-SIS_DLU-EHPAD-FLUDT_2022.01] La section "Traitements" doit être présente une fois. Cardinalité [1..1].
                        </assert>
                        <assert test="count(cda:component/cda:structuredBody/cda:component/cda:section/cda:templateId[@root='1.3.6.1.4.1.19376.1.7.3.1.1.13.5'])=1"> 
                                [CI-SIS_DLU-EHPAD-FLUDT_2022.01] La section "Evaluation fonctionnelle du sommeil et de l'alimentation : date et l’heure du dernier repas" doit être présente une fois. Cardinalité [1..1].
                        </assert>
                        <assert test="count(cda:component/cda:structuredBody/cda:component/cda:section/cda:templateId[@root='1.2.250.1.213.1.1.2.53'])=1"> 
                                [CI-SIS_DLU-EHPAD-FLUDT_2022.01] La section "Protheses et objets personnels" doit être présente une fois. Cardinalité [1..1].
                        </assert>
                        <assert test="count(cda:component/cda:structuredBody/cda:component/cda:section/cda:templateId[@root='1.3.6.1.4.1.19376.1.4.1.2.16'])&lt; 2"> 
                                [CI-SIS_DLU-EHPAD-FLUDT_2022.01] La section "Commentaire non codé" ne peut être présente qu'une fois. Cardinalité [0..1].
                        </assert>
                        
                </rule>
        </pattern>
        
</schema>