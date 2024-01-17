<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_DICOMAdministrationProduitDeSante_fr
   Teste la conformité de l'entrée FR-DICOM-Administration-produit-de-sante aux spécifications DICOM
   
   15/01/2024 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOMAdministrationProduitDeSante_fr">
    <title>Vérification de la conformité de l'entrée FR-DICOM-Administration-produit-de-sante aux spécifications DICOM</title>
    <rule context="*[cda:templateId/@root = '1.2.840.10008.9.13']">
        
        <assert test="self::cda:substanceAdministration[@classCode ='SBADM' and (@moodCode = 'EVN' or @moodCode='fr')] ">
            [E_DICOMAdministrationProduitDeSante_fr] Erreur de conformité : L'élément "substanceAdministration"
            doit contenir les attributs @classCode="SBADM" et 
            @moodCode = 'EVN' : Si le traitement a déjà été administré ou si information rapportée par le patient ou si aucun traitement. 
            or @moodCode='fr' : Si le traitement est en attente d'administration.
        </assert>
        
        <assert test="cda:templateId[@root = '1.2.840.10008.9.13']">
            [E_DICOMAdministrationProduitDeSante_fr] Erreur de conformité DICOM : L'entrée FR-DICOM-Administration-produit-de-sante
            doit contenir l'élément "templateId" avec l'attribut @root fixé à
            "1.2.840.10008.9.13". 
        </assert>
        
        <assert test="cda:templateId[@root = '1.2.250.1.213.1.1.3.151']">
            [E_DICOMAdministrationProduitDeSante_fr] Erreur de conformité DICOM : L'entrée FR-DICOM-Administration-produit-de-sante
            doit contenir l'élément "templateId" avec l'attribut @root fixé à
            "1.2.250.1.213.1.1.3.151". 
        </assert>
        
        <assert test="count(cda:id)=1"> 
            [E_DICOMAdministrationProduitDeSante_fr] Erreur de conformité DICOM : L'entrée FR-DICOM-Administration-produit-de-sante doit contenur un élement "id". 
        </assert>
        
        <assert test="cda:statusCode[@code = 'completed']"> 
            [E_DICOMAdministrationProduitDeSante_fr]
            Erreur de conformité DICOM: L'entrée FR-DICOM-Administration-produit-de-sante doit contenir l'élément "statusCode" avec
            l'attribut @code fixé à 'completed'.
        </assert>
        
        <assert test="count(cda:routeCode)&lt;=1"> 
            [E_DICOMAdministrationProduitDeSante_fr] Erreur de conformité DICOM : L'entrée FR-DICOM-Administration-produit-de-sante peut contenir un élément "routeCode".
        </assert>
        
        <assert test="count(cda:doseQuantity)&lt;=1"> 
            [E_DICOMAdministrationProduitDeSante_fr] Erreur de conformité DICOM : L'entrée FR-DICOM-Administration-produit-de-sante peut contenir un élément "doseQuantity".
        </assert>
        
        <assert test="count(cda:rateQuantity)&lt;=1"> 
            [E_DICOMAdministrationProduitDeSante_fr] Erreur de conformité DICOM : L'entrée FR-DICOM-Administration-produit-de-sante peut contenir un élément "rateQuantity".
        </assert>
        
        <assert test="count(cda:consumable)=1"> 
            [E_DICOMAdministrationProduitDeSante_fr] Erreur de conformité DICOM : L'entrée FR-DICOM-Administration-produit-de-sante doit contenir un élément "consumable".
        </assert>
        
        <assert test="cda:consumable/cda:manufacturedProduct"> 
            [E_DICOMAdministrationProduitDeSante_fr] Erreur de conformité DICOM : L'élément "consumable" doit contenir un élément "manufacturedProduct".
        </assert>
        <assert test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial"> 
            [E_DICOMAdministrationProduitDeSante_fr] Erreur de conformité DICOM : L'élément "manufacturedProduct" doit contenir un élément "manufacturedMaterial".
        </assert>
        
        
    </rule>
</pattern>
