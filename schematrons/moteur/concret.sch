<?xml version="1.0" encoding="UTF-8"?><schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cda="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" queryBinding="xslt2" schemaVersion="CI-SIS_DLU-EHPAD-FLUDT_2022.01.sch">
    
        <title>Rapport de conformité au modèle DLU-FLUDT</title>
        <ns prefix="cda" uri="urn:hl7-org:v3"/>
        <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
        <ns prefix="jdv" uri="http://esante.gouv.fr"/>
        <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
        
        <!--Suppressed abstract pattern dansJeuDeValeurs was here-->
        <!--Suppressed abstract pattern IVL_TS was here-->   
        
        
        <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_ProtheseObjetPersonnel">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.12']/cda:code">
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
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_ProtheseObjetPersonnel)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'observation/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_ProtheseObjetPersonnel"/>.
        </assert>
    </rule>
</pattern>
        
        
        <pattern id="Entete_DLU-FLUDT">
    
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
</pattern>
        
        
        
        <pattern id="S_ResultatsEvenements_DLU-FLUDT">
    <title>CI-SIS DLU-FLUDT Section Résultats d'évènements</title>
    
    <rule context="cda:section[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.7.3.1.1.13.7&#34;]/cda:entry/cda:observation[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34;]">
        
        <assert test="cda:code/@code=&#34;57277-6&#34;">
            [S_ResultatsEvenements_DLU-FLUDT] Erreur de conformité : l'entrée FR-Simple observation doit avoir le code '57277-6' pour le motif du transfert vers le service des urgences.
        </assert>
    </rule>
    
</pattern>
        <pattern id="S_ResultatsExamens_DLU-FLUDT">
    <title>CI-SIS DLU-FLUDT Section Résultats d'examens</title>
    
    <rule context="cda:section[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.28&#34;]">
        
        <assert test="./cda:entry/cda:observation[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34; and not(cda:code/@code=&#34;R52.9&#34;)]/cda:code/@code=&#34;DLU_002&#34; or              ./cda:entry/cda:observation[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34; and not(cda:code/@code=&#34;R52.9&#34;)]/cda:code/@code=&#34;DLU_003&#34; or             ./cda:entry/cda:observation[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34; and not(cda:code/@code=&#34;R52.9&#34;)]/cda:code/@code=&#34;DLU_004&#34;">
            [S_ResultatsExamens_DLU-FLUDT] Erreur de conformité : l'entrée FR-Simple observation doit avoir le code 'DLU_002' ou 'DLU_003' ou  'DLU_004'.
        </assert>
    </rule>
    
</pattern>
        
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