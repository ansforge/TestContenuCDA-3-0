<?xml version="1.0" encoding="UTF-8"?>

<!-- E_traitementPrescrit_fr
     ......................................................................................................................................................
     Vérification de la conformité de l'entrée FR-Traitement-prescrit aux spécifications du CI-SIS.
     ......................................................................................................................................................
     Historique :
     - 09/06/2020 : Création
     - 30/11/2020 : Finalisation
-->

    <pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_traitementPrescrit_fr">
        <title>CI-SIS Entrée "FR-Traitement-prescrit"</title>
        
        <rule context="//cda:section[cda:templateId[@root='1.2.250.1.213.1.1.2.171']]/cda:entry/cda:substanceAdministration[cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.2']]">
            
            <!-- Formule count des templateId -->
            <let name="count_templateId" value="count(//cda:section[cda:templateId[@root='1.2.250.1.213.1.1.2.171']]/cda:entry/cda:substanceAdministration/cda:templateId)"/>
    
            <let name="count_MA_normales" value="count(cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.1'])"/>
            <let name="count_MA_progressives" value="count(cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.8'])"/>   
            <let name="count_MA_fractionnees" value="count(cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.9'])"/>         
            <let name="count_MA_conditionnees" value="count(cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.10'])"/> 
            <let name="count_MA_combinees" value="count(cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.11'])"/> 
            <let name="count_MA_debutDiff" value="count(cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.21'])"/> 
    
            <let name="count_ER_HorsAMM" value="count(cda:entryRelationship[@typeCode='COMP']/cda:observation[cda:templateId[@root='1.2.250.1.213.1.1.3.48.12']])"/>
            <let name="count_ER_EnRapportAT" value="count(cda:entryRelationship[@typeCode='COMP']/cda:observation[cda:templateId[@root='1.2.250.1.213.1.1.3.48.14']])"/>
            <let name="count_ER_NonRemboursable" value="count(cda:entryRelationship[@typeCode='COMP']/cda:observation[cda:templateId[@root='1.2.250.1.213.1.1.3.48.15']])"/>
            <let name="count_ER_EnRapportALD" value="count(cda:entryRelationship[@typeCode='COMP']/cda:observation[cda:templateId[@root='1.2.250.1.213.1.1.3.48.13']])"/>
            <let name="count_E_traitementPrescrit" value="count(cda:entryRelationship/cda:substanceAdministration/cda:templateId[@root='1.2.250.1.213.1.1.3.83.1'])"/>
            <let name="count_ER_TraitementPrescritSub" value="count(cda:entryRelationship[cda:sequenceNumber])"/>
            <!-- Conformité du mode d'administration -->
            <assert test="
                (($count_MA_normales&gt;=1) and ($count_ER_TraitementPrescritSub=0) and ($count_E_traitementPrescrit=0)) or
                (($count_MA_progressives&gt;=1) and ($count_ER_TraitementPrescritSub&gt;=1) and ($count_E_traitementPrescrit&gt;0)) or
                (($count_MA_fractionnees&gt;=1) and ($count_ER_TraitementPrescritSub&gt;=1) and ($count_E_traitementPrescrit&gt;0)) or
                (($count_MA_conditionnees&gt;=1) and ($count_ER_TraitementPrescritSub&gt;=1) and ($count_E_traitementPrescrit&gt;0)) or
                (($count_MA_combinees&gt;=1) and ($count_ER_TraitementPrescritSub&gt;=1) and ($count_E_traitementPrescrit&gt;0)) or
                (($count_MA_debutDiff&gt;=1) and ($count_ER_TraitementPrescritSub=0) and ($count_E_traitementPrescrit=0))
                ">
                
                 [E_traitementPrescrit_fr.sch] Erreur de conformité IHE Pharm PRE : 
                Le dernier 'templateId' indique le mode d'administration choisi pour le traitement prescrit. Il doit être choisi parmi la liste suivante :
                
                1.3.6.1.4.1.19376.1.5.3.1.4.7.1  (Mode d'administration : doses normales). De ce fait : 
                - il ne peut pas y avoir d'entryRelationship de type "Prescription Item Entry Content Module" subordonnée
                
                1.3.6.1.4.1.19376.1.5.3.1.4.8    (Mode d'administration : doses progressives). De ce fait :
                - il doit y avoir une entryRelationship de type "Prescription Item Entry Content Module" subordonnée
                
                1.3.6.1.4.1.19376.1.5.3.1.4.9    (Mode d'administration : doses fractionnées). De ce fait : 
                - il doit y avoir une entryRelationship de type "Prescription Item Entry Content Module" subordonnée
                
                1.3.6.1.4.1.19376.1.5.3.1.4.10   (Mode d'administration : doses conditionnelles). De ce fait : 
                - il doit y avoir une entryRelationship de type "Prescription Item Entry Content Module" subordonnée
                
                1.3.6.1.4.1.19376.1.5.3.1.4.11   (Mode d'administration : doses combinées). De ce fait :
                - il doit y avoir une entryRelationship de type "Prescription Item Entry Content Module" subordonnée
                
                1.3.6.1.4.1.19376.1.5.3.1.4.21   (Mode d'administration : doses à début différé). De ce fait : 
                - il ne peut pas y avoir d'entryRelationship de type "Prescription Item Entry Content Module" subordonnée
            </assert>
            
            <!-- Vérification conformité CI-SIS -->
            <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.83']">
                 [E_traitementPrescrit_fr.sch] Erreur de conformité CI-SIS : 
                L'entrée "FR-Traitement-prescrit" doit avoir un templateId dont l'attribut @root="1.2.250.1.213.1.1.3.83" (Conformité de l'entrée aux spécifications CI-SIS)
            </assert>
            
            <assert test="$count_templateId&gt;4">
                [E_traitementPrescrit_fr.sch] Erreur de conformité CI-SIS : Il doit y avoir au minimum 5 occurences de l'élément 'templateId' dans cette entrée :
                - La première pour la déclaration de conformité de l'entrée aux spécifications IHE Pharm PRE @root="1.3.6.1.4.1.19376.1.9.1.3.2"
                - La deuxième pour la déclaration de conformité de l'entrée aux spécifications CCD @root="2.16.840.1.113883.10.20.1.24"
                - La troisème pour la déclaration de conformité de l'entrée aux spécifications IHE PCC @root="1.3.6.1.4.1.19376.1.5.3.1.4.7"
                - La quatrième pour la déclaration de conformité de l'entrée aux spécifications CI-SIS @root="1.2.250.1.213.1.1.3.83"
                - La cinquième pour la déclaration du mode d'administration du traitement prescrit (à choisir parmi la liste des modes d'administration)
            </assert>     
          
            <!-- Test, si présente, de l'entryRelationship "FR-Hors-AMM" (cardinalité [1..1]) -->
            <assert test="$count_ER_HorsAMM=1">
                 [E_traitementPrescrit_fr.sch] Erreur de conformité CI-SIS : 
                - L'entryRelationship optionnelle "FR-Hors-AMM" doit être présente une fois (cardinalité [1..1]). 
                - Elle doit contenir un attribut @typeCpde='COMP' et un 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.48.12" (Conformité de l'entrée au format CI-SIS) 
            </assert>     
            
            <!-- Test, si présente, de l'entryRelationship "FR-En-rapport-avec-ALD" (cardinalité [1..1]) -->
            <assert test="$count_ER_EnRapportALD=1">
                 [E_traitementPrescrit_fr.sch] Erreur de conformité CI-SIS : 
                - L'entryRelationship optionnelle "FR-En-rapport-avec-ALD" doit être présente une fois (cardinalité [1..1]). 
                - Elle doit contenir un attribut @typeCpde='COMP' et un 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.48.13" (Conformité de l'entrée au format CI-SIS) 
            </assert>  

          <!-- Test, si présente, de l'entryRelationship "FR-En-rapport-avec-accident-travail" (cardinalité [1..1]) -->
            <assert test="$count_ER_EnRapportAT=1">
                 [E_traitementPrescrit_fr.sch] Erreur de conformité CI-SIS : 
                - L'entryRelationship optionnelle "FR-En-rapport-avec-accident-travail" doit être présente une fois (cardinalité [1..1]). 
                - Elle doit contenir un attribut @typeCpde='COMP' et un 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.48.14" (Conformité de l'entrée au format CI-SIS) 
            </assert>  
            
            <!-- Test, si présente, de l'entryRelationship "FR-Non-remboursable" (cardinalité [1..1]) -->
            <assert test="$count_ER_NonRemboursable=1">
                [E_traitementPrescrit_fr.sch] Erreur de conformité CI-SIS : 
                - L'entryRelationship optionnelle "FR-Non-remboursable" doit être présente une fois (cardinalité [1..1]). 
                - Elle doit contenir un attribut @typeCpde='COMP' et un 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.48.15" (Conformité de l'entrée au format CI-SIS)  
            </assert>  
        </rule>
        
        <!-- Entrée FR-Traitement-prescrit-subordonne -->
        <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.83.1']">
            
            <let name="count_E_traitementPrescritSub" value="count(self::cda:substanceAdministration/cda:templateId[@root='1.2.250.1.213.1.1.3.83.1'])"/>
            <let name="count_code_1" value="count(cda:code)"/>
            <let name="count_statusCode" value="count(cda:statusCode[@code='completed'])"/>
            <let name="count_statusCode_1" value="count(cda:statusCode)"/>
            <let name="count_text" value="count(cda:text)"/>
            <let name="count_referenceText" value="count(cda:text/cda:reference)"/>
            <let name="count_id" value="count(cda:id) "/> 
            <let name="count_doseQuantity" value="count(cda:doseQuantity)"/>  
            <let name="count_rateQuantity" value="count(cda:rateQuantity)"/>  
            <let name="count_rateQuantity_low" value="count(cda:rateQuantity/cda:low)"/>  
            <let name="count_rateQuantity_high" value="count(cda:rateQuantity/cda:high)"/> 
            
            <!-- Test conformité de  l'entryRelationship optionnelle "FR-Traitement-prescrit-subordonne" (cardinalité [0..*])-->        
            <assert test="($count_E_traitementPrescritSub&gt;=1 and parent::cda:entryRelationship[@typeCode='COMP']) or ($count_E_traitementPrescritSub=0)">
                [E_traitementPrescrit_fr.sch] Erreur de conformité IHE Pharm PRE : 
                L'entryRelationship de type 'substanceAdministration' (FR-Traitement-prescrit-subordonne) (cardinalité [0..*]),
                si présente, doit avoir un attribut @typeCode="COMP" et un templateId dont l'attribut @root="1.2.250.1.213.1.1.3.83.1" (Conformité de l'entrée au parent IHE Pharm PRE)
            </assert>
            
            <!-- Test conformité des attributs de l'élément substanceAdministration -->        
            <assert test="self::cda:substanceAdministration[@classCode='SBADM' and  @moodCode='INT']">
                [E_traitementPrescrit_fr.sch] Erreur de conformité IHE Pharm PRE : 
                L'élément 'substanceAdministration' de l'entrée FR-Traitement-prescrit-subordonne doit avoir un attribut @classCode="SBADM" et @moodCode='INT'.
            </assert>
            
            <!-- Test conformité de l'élément id-->        
            <assert test="count($count_id)&gt;=1">
                [E_traitementPrescrit_fr.sch] Erreur de conformité IHE Pharm PRE : 
                L'entryRelationship (FR-Traitement-prescrit-subordonne), si présente, doit avoir un ou plusieurs identifiant (id) avec
                une cardinalité [1..*].
            </assert>
            
            <!-- Test conformité de l'élément text-->        
            <assert test="count($count_text)=1">
                [E_traitementPrescrit_fr.sch] Erreur de conformité IHE Pharm PRE : 
                L'entryRelationship (FR-Traitement-prescrit-subordonne), si présente, doit avoir un élément text avec
                une cardinalité [1..1].
            </assert>
            
            <!-- Test conformité de l'élément text/reference -->        
            <assert test="count($count_referenceText)=1">
                [E_traitementPrescrit_fr.sch] Erreur de conformité IHE Pharm PRE : 
                L'entryRelationship (FR-Traitement-prescrit-subordonne), si présente, doit avoir un élément text/reference avec
                une cardinalité [1..1].
            </assert>
            
            <!-- Test de la présence d'un élémént <statusCode> -->
            <assert test="($count_statusCode=1 and $count_statusCode_1=1)">
                [8] [E_traitementPrescrit_fr.sch] Erreur de conformité IHE Pharm PRE : 
                Si présente, l'entrée FR-Traitement-prescrit-subordonne doit comporter obligatoirement un élément 'statusCode', dont l'attribut @code est fixé à la valeur 'completed'(cardinalité [1..1]).
            </assert>   
            
            <!-- Test, si présent, du format de 'doseQuantity' (non obligatoire)-->
            <assert test="(($count_doseQuantity=1) and (
                (cda:doseQuantity/cda:low) and
                (cda:doseQuantity/cda:high)
                )) or not(cda:doseQuantity)">
                [E_traitementPrescrit_fr.sch] Erreur de conformité IHE Pharm PRE : 
                - L'élément optionnel 'doseQuantity' ne peut être présent plus d'une fois (cardinalité [0..1]).
                - Si présent, alors il doit comporter obligatoirement un 'low' [1..1] et un 'high' [1..1]
            </assert>
            
            <!-- Test, si présent, du format de 'rateQuantity' (non obligatoire)-->
            <assert test="($count_rateQuantity=1) and (
                ($count_rateQuantity_low=1) and
                ($count_rateQuantity_high=1)
                ) or ($count_rateQuantity=0)">
                
                [E_traitementPrescrit_fr.sch] Erreur de conformité IHE Pharm PRE : 
                - L'élément optionnel 'rateQuantity' ne peut être présent plus d'une fois (cardinalité [0..1]).
                - Si présent, alors il doit comporter obligatoirement un 'low' [1..1] et un 'high' [1..1]
            </assert>
            
            <!-- Test présence et format du consumable (obligatoire) -->
            <assert test="cda:consumable[@typeCode='CSM']/cda:manufacturedProduct/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.2']">
                
                [E_traitementPrescrit_fr.sch] Erreur de conformité IHE Pharm PRE : 
                L'élément 'consumable' de type 'manufacturedProduct' est obligatoire pour l'entrée "FR-Traitement-prescrit-subordonne" (cardinalité [1..1]), 
                et ne peut contenir qu'une entrée "FR-Produit-de-santé-prescrit" dont :
                - l'attribut du 'consumable' @typeCode="CSM"
                - le premier 'templateId' @root="1.3.6.1.4.1.19376.1.5.3.1.4.7.2" (Conformité de l'entrée au volet IHE Pharm PRE)
            </assert>
        </rule>
        
    </pattern>
