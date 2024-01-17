<?xml version="1.0" encoding="UTF-8"?>

<!-- E_traitementPrescrit_int
     ......................................................................................................................................................
     Vérification de la conformité de l'entrée FR-Traitement-prescrit (IHE-PRE - Prescription-Item - 1.3.6.1.4.1.19376.1.9.1.3.2) à IHE.
     ......................................................................................................................................................
     Historique :
        - 09/06/2020 : Création
        - 30/11/2020 : Finalisation
-->

    <pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_traitementPrescrit_int">
        <title>IHE PRE Prescription Item Entry (1.3.6.1.4.1.19376.1.9.1.3.2)</title>
        <!--
        <rule context="//cda:entry/cda:substanceAdministration[@classCode='SBADM' and @moodCode='INT']/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.2']">-->
            <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.2']">
            
            <let name="count_id" value="count(cda:id) "/>  
            <let name="count_code" value="count(cda:code[@code='DRUG'][@codeSystem='2.16.840.1.113883.5.4'])"/>
            <let name="count_code_1" value="count(cda:code)"/>
            <let name="count_statusCode" value="count(cda:statusCode[@code='completed'])"/>
            <let name="count_statusCode_1" value="count(cda:statusCode)"/>
            <let name="count_text" value="count(cda:text)"/>
            <let name="count_referenceText" value="count(cda:text/cda:reference)"/>
            <let name="count_routeCode" value="count(cda:routeCode)"/>
            <let name="count_approachSiteCode_1" value="count(cda:approachSiteCode)"/> 
            <let name="count_approachSiteCode" value="count(cda:approachSiteCode[@codeSystem='2.16.840.1.113883.1.11.19724'])"/>
            <let name="count_doseQuantity" value="count(cda:doseQuantity)"/>  
            <let name="count_rateQuantity" value="count(cda:rateQuantity)"/>  
            <let name="count_rateQuantity_low" value="count(cda:rateQuantity/cda:low)"/>  
            <let name="count_rateQuantity_high" value="count(cda:rateQuantity/cda:high)"/>  
            <let name="count_maxDoseQuantity" value="count(cda:maxDoseQuantity)"/>  
            <let name="count_maxDoseQuantity_numerator" value="count(cda:maxDoseQuantity/cda:numerator)"/>  
            <let name="count_maxDoseQuantity_denominator" value="count(cda:maxDoseQuantity/cda:denominator)"/>  
            <let name="count_author" value="count(cda:author)"/>  
            <let name="count_reference" value="count(cda:reference)"/>
            <let name="count_effectiveTime" value="count(cda:effectiveTime[not(@operator='A')])"/>
            
            <let name="count_MA_debutDiff" value="count(cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.21'])"/>
            
            <let name="count_consumable" value="count(cda:consumable/cda:manufacturedProduct[@classCode='MANU']/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.2'])"/> 
            <let name="count_ER_AutorisationSubstitution" value="count(cda:entryRelationship[cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.9.1'] and @typeCode='COMP'])"/>
            <let name="count_ER_PeriodeRenouvellement" value="count(cda:entryRelationship[cda:supply/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.15']])"/>
           
            <!-- Test du nombre d'id --> 
            <assert test="$count_id&gt;=1">
                [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                Il faut obligatoirement au moins un élément 'id' pour l'entrée (cardinalité [1..*]).
            </assert>
            
            <!-- Test du code (non obligatoire mais si présent, doit respecter un format spécifique) -->
            <assert test="($count_code=1 and $count_code_1=1) or ($count_code_1=0)">
                 [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                - L'élément optionnel 'code' ne peut être présent plus d'une fois (cardinalité [0..1]), 
                - si présent, ses attributs doivent être @code="DRUG" et @codeSystem="2.16.840.1.113883.5.4".
            </assert>
            
            <!-- Test de la présence d'un élémént <text> -->
            <assert test="($count_text=1)">
               [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                L'entrée doit comporter obligatoirement un élément 'text' (cardinalité [1..1]).
            </assert>
                
             <!-- Test de la présence d'un élémént text/reference -->
                <assert test="($count_referenceText=1)">
                 [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                 L'entrée doit comporter obligatoirement un élément 'text/reference' (cardinalité [1..1]).
            </assert>
            
            <!-- Test de la présence d'un élémént <statusCode> -->
            <assert test="($count_statusCode=1 and $count_statusCode_1=1)">
                 [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                L'entrée doit comporter obligatoirement un élément 'statusCode', dont l'attribut @code est fixé à la valeur 'completed'(cardinalité [1..1]).
            </assert>    
                
                <!-- Test de la présence d'un élémént <effectiveTime[1]> : durée de traitement -->
                <assert test="not(cda:effectiveTime[not(@operator='A')]) or 
                    ($count_MA_debutDiff=0 or ($count_effectiveTime=1 and $count_MA_debutDiff=1 and cda:effectiveTime[not(@operator='A')]/cda:low[not(@nullFlavor='UNK')] and cda:effectiveTime[not(@operator='A')]/cda:high[not(@nullFlavor='UNK')])) or
                    ($count_MA_debutDiff=0 or ($count_effectiveTime=1 and $count_MA_debutDiff=1 and cda:effectiveTime[not(@operator='A')]/cda:low[@nullFlavor='UNK'] and cda:effectiveTime[not(@operator='A')]/cda:width)) ">
                    [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                    L’élément effectiveTime[1] désigne la durée du traitement et est composé :
                    Pour tous les modes d’administration autre que « à début différé » (templateId 
                    1.3.6.1.4.1.19376.1.5.3.1.4.21), 
                    - d’une date de début de traitement (sous-élément "low") et 
                    - d’une date de fin du traitement (sous-élément "high").
                    L’élément effectiveTime[1] désigne la durée du traitement et est composé :
                    Pour un mode d’administration « à début différé » (templateId 1.3.6.1.4.1.19376.1.5.3.1.4.21), Si les dates de début et de fin de traitement sont connues:
                     - d’une date de début de traitement (sous-élément "low") et 
                     - d’une date de fin du traitement (sous-élément "high").
                     - dans le cas particulier où l’on ne connaît que la durée du traitement et la date de 
                       début est inconnue, un élément "width" doit être utilisé à la place des éléments "low" et "high".
                </assert> 
                
                <!-- Test de la présence d'un élémént <effectiveTime[2]>: fréquence d'aministration-->
                <assert test="not(cda:effectiveTime[@operator='A']) or 
                    (cda:effectiveTime[@operator='A'] and cda:effectiveTime[@xsi:type='PIVL_TS' or @xsi:type='EIVL_TS' or @xsi:type='SXPR_TS'] and 
                    ((cda:effectiveTime[@xsi:type='PIVL_TS'] and (cda:effectiveTime/cda:period or cda:effectiveTime/cda:phase or cda:effectiveTime/cda:standardDeviation)) or
                    (cda:effectiveTime[@xsi:type='EIVL_TS'] and (cda:effectiveTime/cda:event or cda:effectiveTime/cda:offset)) or
                    (cda:effectiveTime[@xsi:type='SXPR_TS'] and (cda:effectiveTime/cda:comp))
                    ))">
                    [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE :  L’élément effectiveTime[2] désigne la fréquence d'administration et contient
                    l'attribut @xsi:type pour déterminer le type de donnée utilisé pour représenter la fréquence d'administration du médicament. 
                    Les types possibles pour cet attribut sont 'PIVL_TS' ou 'EIVL_TS' ou 'SXPR_TS'.
                    Si le type est 'PIVL_TS' alors l'élément effectiveTime comporte deux sous-éléments "phase" et "period".
                    Si le type est 'EIVL_TS' alors l'élément effectiveTime comporte deux sous-éléments "event" et "offset".
                    Si le type est 'SXPR_TS' alors l'élément effectiveTime comporte l'élément "comp".
                </assert> 
            
            <!-- Test du repeatNumber : si pas de renouvellement autorisé, value=0 ; si pas limité (période renouvellement fournie), alors @nullFlavor=NI -->
            <assert test="(//cda:substanceAdministration[cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.2']]/cda:repeatNumber[@value&gt;=0]) 
                or (//cda:substanceAdministration[cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.2']]/cda:repeatNumber[@nullFlavor='NI'])">
                
                [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                L'élément 'repeatNumber' est obligatoire pour l'entrée "Prescription Item Entry Content Module" et doit avoir une valeur d'attribut. Selon la situation :
                - Si aucun renouvellement autorisé (dispensation unique) : @value="0"
                - Si x renouvellement(s) autorisé(s) : @value="x"
                - Si le renouvellement n’est pas limité (par ex : si une période de renouvellement est définie), la valeur est fixée à @nullFlavor="NI".
                Note : le nombre total de dispensations est égal au repeatNumber + 1
                
            </assert>
            
            <!-- Test du routeCode (non obligatoire mais si présent, doit respecter un format spécifique)-->
            <assert test="$count_routeCode&lt;2">
                 [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                L'élément optionnel 'routeCode' ne peut être présent plus d'une fois (cardinalité [0..1])
            </assert>
            
            <!-- Test du approachSiteCode (non obligatoire mais si présent, doit respecter un format spécifique)-->
                <assert test="($count_approachSiteCode&gt;0 and $count_approachSiteCode_1&gt;0) or ($count_approachSiteCode_1=0) or (cda:approachSiteCode[@nullFlavor])">
                 [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                - L'élément optionnel 'approachSiteCode' ne peut être présent plus d'une fois (cardinalité [0..*]), 
                - si présent, les valeurs de ses attributs doivent provenir du jeu de valeurs JDV_HL7_HumanSubstanceAdministrationSite-CISIS (2.16.840.1.113883.1.11.19724).
            </assert>
            
            
            <!-- Test, si présent, du format de 'doseQuantity' (non obligatoire)-->
            <assert test="(($count_doseQuantity=1) and (
                (cda:doseQuantity/cda:low) and
                (cda:doseQuantity/cda:high)
                )) or not(cda:doseQuantity)">
                 [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                - L'élément optionnel 'doseQuantity' ne peut être présent plus d'une fois (cardinalité [0..1]).
                - Si présent, alors il doit comporter obligatoirement un 'low' [1..1] et un 'high' [1..1]
            </assert>
            
            <!-- Test, si présent, du format de 'rateQuantity' (non obligatoire)-->
            <assert test="($count_rateQuantity=1) and (
                ($count_rateQuantity_low=1) and
                ($count_rateQuantity_high=1)
                ) or ($count_rateQuantity=0)">
                
                 [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                - L'élément optionnel 'rateQuantity' ne peut être présent plus d'une fois (cardinalité [0..1]).
                - Si présent, alors il doit comporter obligatoirement un 'low' [1..1] et un 'high' [1..1]
            </assert>     
            
            <!--Test, si présent, du format de 'maxDoseQuantity' (cardinalité [0..*]) -->
            <assert test="($count_maxDoseQuantity&gt;=1) and (
                ($count_maxDoseQuantity_numerator=$count_maxDoseQuantity) and
                ($count_maxDoseQuantity_denominator=$count_maxDoseQuantity)
                ) or ($count_maxDoseQuantity=0)">
                
                [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                L'élément optionnel 'maxDoseQuantity' (cardinalité [0..*]), si présent, doit comporter obligatoirement un 'numerator [1..1] et un 'denominator' [1..1]
            </assert>  
            
            <!-- Test présence et format du consumable (obligatoire) -->
            <assert test="$count_consumable =1">
                 [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                L'élément 'consumable' est obligatoire pour l'entrée "Prescription Item Entry Content Module" de type 'manufacturedProduct'(cardinalité [1..1]), 
                et ne peut contenir qu'une entrée "FR-Produit-de-santé-prescrit" dont :
                - l'attribut du 'manufacturedProduct' @classcode="MANU"
                - le premier 'templateId' @root="1.3.6.1.4.1.19376.1.5.3.1.4.7.2" (Conformité de l'entrée au volet IHE Pharm PRE)
            </assert>
            
            <!-- Test de non-présence de l'élément 'author' (car le document est une prescription) -->
            <assert test="$count_author=0">
                 [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                Le document étant une prescription, l'élément 'author' est interdit ici.
            </assert>
            
                  
            <!-- Test, si présente, de l'entryRelationship "Substitution Permission Content Module" (cardinalité [1..1]) -->
            <assert test="($count_ER_AutorisationSubstitution=1)">
                 [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                Si présente, l'entryRelationship de type 'act' "Substitution Permission Content Module" (cardinalité [1..1]) doit avoir l'attribut @typeCode='COMP' et un templateId dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.9.1" (Conformité de l'entrée au volet IHE Pharm PRE)
            </assert> 
            
            <!-- Test, si présente, de l'entryRelationship "Renewal Period General Specification" (cardinalité [0..1]) -->
            <assert test="($count_ER_PeriodeRenouvellement=1) or ($count_ER_PeriodeRenouvellement=0)">
               [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                L'entryRelationship optionnelle "Renewal Period General Specification" de type supply (cardinalité [0..1]), si présente, doit avoir l'attribut @typeCode='COMP' et un 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.15" (Conformité de l'entrée au volet IHE Pharm PRE)
            </assert>
    
            <assert test="$count_reference=0">
                 [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                L'élément 'reference' n'est pas utilisé dans le cas d'une prescription.
            </assert>
            
        </rule>
        
        <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.2']//*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.4.1']">
            <let name="count_ER_MotifTraitement" value="count(self::cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.4.1'])"/>
            
            <assert test="($count_ER_MotifTraitement&gt;=1 and parent::cda:entryRelationship[@typeCode='RSON']) or ($count_ER_MotifTraitement=0)">
                [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                L'entryRelationship optionnelle de type 'act' "IHE Internal Reference Entry" (Motif du traitement) (cardinalité [0..*]),
                si présente, doit avoir un attribut @typeCode="RSON" et un templateId dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.4.1" (Conformité de l'entrée au parent IHE Pharm PRE)
            </assert>
        </rule>
        
        <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.2']//*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.10']">
            <let name="count_ER_RefItemPlanTrait" value="count(self::cda:substanceAdministration/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.10'])"/>
            
        <!-- Test, si présente, du format de l'entryRelationship "Reference to Medication Treatment Plan Item Entry" (cardinalité [0..*]) -->
            <assert test="($count_ER_RefItemPlanTrait&gt;=1 and parent::cda:entryRelationship[@typeCode='REFR' and @inversionInd='false']) or ($count_ER_RefItemPlanTrait=0)">
            [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
            L'entryRelationship optionnelle "Reference to Medication Treatment Plan Item Entry" de type substanceAdministration (cardinalité [0..*]), 
            si présente, doit contenir les attributs @typeCode="COMP" et @inversionInd='false'
            et un 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.10" (Conformité de l'entrée au volet IHE Pharm PRE)
        </assert>
        </rule>
        
        <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.2']//*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.3']">
            <let name="count_ER_InstrucPatient" value="count(self::cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.3'])"/>
            
            <!-- Test, si présente, du format de l'entryRelationship "IHE Patient Medication Instructions" (cardinalité [0..1]) -->
            <assert test="($count_ER_InstrucPatient=1 and parent::cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true']) or ($count_ER_InstrucPatient=0)">
                [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                L'entryRelationship optionnelle "IHE Patient Medication Instructions" de type act (cardinalité [0..1]), 
                si présente, doit contenir les attributs @typeCode="SUBJ" et @inversionInd='true' 
                et un 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.3" (Conformité de l'entrée au volet IHE PCC)
            </assert>
        </rule>
        
        <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.2']//*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.3.1']">
            <let name="count_ER_InstructDispensateur" value="count(self::cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.3.1'])"/>
            <!-- Test, si présente, du format de l'entryRelationship "IHE Medication FulFillment Instructions" (cardinalité [0..1]) -->
            <assert test="($count_ER_InstructDispensateur=1 and parent::cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true']) or ($count_ER_InstructDispensateur=0)">
                [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                L'entryRelationship optionnelle "IHE Medication FulFillment Instructions" de type act (cardinalité [0..1]), si présente, doit contenir  :
                - les attributs @typeCode="SUBJ" et @inversionInd='true' 
                - un premier 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.43" (Conformité de l'entrée au parent CCD)
                - un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.3.1" (Conformité de l'entrée au volet IHE PCC)
            </assert>
        </rule>
        
        <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.2']//*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.8']">
        <let name="count_ER_QuantiteProduit" value="count(self::cda:supply/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.8'])"/>
                <!-- Test, si présente, de l'entryRelationship "Amount of units of the consumable Content Module" (cardinalité [0..1]) -->
            <assert test="($count_ER_QuantiteProduit=1 and parent::cda:entryRelationship[@typeCode='COMP']) or ($count_ER_QuantiteProduit=0)">
                  [E_traitementPrescrit_int.sch] Erreur de conformité IHE Pharm PRE : 
                  L'entryRelationship optionnelle "Amount of units of the consumable Content Module" de type supply (cardinalité [0..1]), si présente, doit avoir un attribut @typeCode="COMP" 
                  et un 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.8" (Conformité de l'entrée au parent IHE Pharm PRE).
                </assert> 
                
        </rule>
    </pattern>
