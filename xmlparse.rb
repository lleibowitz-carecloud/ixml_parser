require 'Nokogiri'
require 'pp'


def get_value(tag)
  @doc.xpath("//#{tag}")
end 

@doc = Nokogiri::XML(File.open("./data.xml"))

cc_text = @doc.xpath('//CHRTCC//eNote_FullText//eNote_Text[@Type="TemplateSegment"]').map do |x|
    x.text
end

hpi_text = @doc.xpath('//CHRTHPI//eNote_FullText//eNote_Text[@Type="TemplateSegment"]').map do |x|
    x.text
end

hpi_free_text = @doc.xpath('//CHRTHPI//eNoteDisplay//eNote_Inserted').map do |x|
    x.xpath('eNote_Text[@Type="FreeText"]').text
end


cc_assessment = @doc.xpath('//CHRTCC/CHRTTemplates/CHRTTemplate_List/eTemplate/EMDS_TEMPLATE_ANSWERS/ANSWER_CONTENT//ANSWER_ITEM/ANSWER_DESCRIPTION').map do |item|
  item.text
end

  hpi_assessment = @doc.xpath('//CHRTHPI//CHRTTemplates//CHRTTemplate_List//eTemplate//EMDS_TEMPLATE_ANSWERS//ANSWER_CONTENT//ANSWER_ITEM//ANSWER_DESCRIPTION').map do |item|
      item.text
  end

 ros_assessment_fulltext = @doc.xpath('//CHRTROS//CHRTTemplates//CHRTTemplate_List//eTemplate//SENTENCE_LIST//SENTENCE//SENTENCE_FULL_TEXT//SENTENCE_SEGMENT//SENTENCE_SEGMENT_TEXT').map do |item|
     item.text.strip + " " 
 end

 pmh_fulltext = @doc.xpath('//CHRTPMHxHistory//CHRTHistory_List//CHRTHistory//CHRTPastMedicalHistory//eTemplate//SENTENCE_LIST//SENTENCE//SENTENCE_FULL_TEXT//SENTENCE_SEGMENT//SENTENCE_SEGMENT_TEXT').map do |item|
      item.text.strip + " " 
  end

sh_fulltext = @doc.xpath('//CHRTPMHxHistory//CHRTHistory_List//CHRTHistory//CHRTSurgicalHistory//eTemplate//SENTENCE_LIST//SENTENCE//SENTENCE_FULL_TEXT//SENTENCE_SEGMENT//SENTENCE_SEGMENT_TEXT').map do |item|
       item.text.strip + " " 
   end

 fh_fulltext = @doc.xpath('//CHRTPMHxHistory//CHRTHistory_List//CHRTHistory//CHRTFamilyHistory//eTemplate//SENTENCE_LIST//SENTENCE//SENTENCE_FULL_TEXT//SENTENCE_SEGMENT//SENTENCE_SEGMENT_TEXT').map do |item|
        item.text.strip + " " 
    end

soh_fulltext = @doc.xpath('//CHRTPMHxHistory//CHRTHistory_List//CHRTHistory//CHRTSocialHistory//eTemplate//SENTENCE_LIST//SENTENCE//SENTENCE_FULL_TEXT//SENTENCE_SEGMENT//SENTENCE_SEGMENT_TEXT').map do |item|
       item.text.strip + " " 
   end

 aldr_fulltext = @doc.xpath('//CHRTPMHxHistory//CHRTHistory_List//CHRTHistory//CHRTAlcoholDrugHistory//eTemplate//SENTENCE_LIST//SENTENCE//SENTENCE_FULL_TEXT//SENTENCE_SEGMENT//SENTENCE_SEGMENT_TEXT').map do |item|
        item.text.strip + " " 
    end

subabu_fulltext = @doc.xpath('//CHRTPMHxHistory//CHRTHistory_List//CHRTHistory//CHRTSubstanceAbuseHistory//eTemplate//SENTENCE_LIST//SENTENCE//SENTENCE_FULL_TEXT//SENTENCE_SEGMENT//SENTENCE_SEGMENT_TEXT').map do |item|
       item.text.strip + " " 
   end

 mh_fulltext = @doc.xpath('//CHRTPMHxHistory//CHRTHistory_List//CHRTHistory//CHRTMentalHealthHistory//eTemplate//SENTENCE_LIST//SENTENCE//SENTENCE_FULL_TEXT//SENTENCE_SEGMENT//SENTENCE_SEGMENT_TEXT').map do |item|
        item.text.strip + " " 
    end

id_fulltext = @doc.xpath('//CHRTPMHxHistory//CHRTHistory_List//CHRTHistory//CHRTInfectiousDiseaseHistory//eTemplate//SENTENCE_LIST//SENTENCE//SENTENCE_FULL_TEXT//SENTENCE_SEGMENT//SENTENCE_SEGMENT_TEXT').map do |item|
       item.text.strip + " " 
   end

pmh_legacy = @doc.xpath('//CHRTPMHxHistory//CHRTHistory_List//CHRTHistory//CHRTPMHxLegacy//eTemplate//SENTENCE_LIST//SENTENCE//SENTENCE_FULL_TEXT//SENTENCE_SEGMENT//SENTENCE_SEGMENT_TEXT').map do |item|
      item.text.strip + " " 
  end

chronic_prob_review = @doc.xpath('//CHRTChronicProblems//CHRTChronicProblemReviewInfo').map do |item|
      item.text.strip + " " 
  end

chronic_no_known_problems = @doc.xpath('//CHRTChronicProblems//CHRTNoKnownProblems').map do |item|
      item.text.strip + " " 
  end
chronic_problem_list = @doc.xpath('//CHRTChronicProblems//CHRTChronicProblem_List//CHRTChronicProblem//CHRTChronicProblem_DisplayDescription').map do |item|
      item.text.strip + " " 
  end

  immunization_none = @doc.xpath('//CHRTImmunizations//CCHRTImmunization_NoneText//eNoteDisplay//eNote_Text').map do |item|
        item.text
    end

  immunizations_list = @doc.xpath('//CHRTImmunizations//CHRTImmunization_List').map do |item|
        item.text.strip + " " 
    end

  allergies_reviewed = @doc.xpath('//CHRTAllergies//CHRTAllergyReviewInfo//eNote_Text').map do |item|
        item.text
    end

  allergies = @doc.xpath('//CHRTAllergies//CHRTAllergies_NoneText//eNoteDisplay//eNote_Text').map do |item|
        item.text
    end

  drug_allergies_list = @doc.xpath('//CHRTAllergies//CHRTDrugAllergies//CHRTNoKnownAllergies//eNoteDisplay//eNote_Text').map do |item|
        item.text
    end

  non_drug_allergies_list = @doc.xpath('//CHRTAllergies//CHRTNonDrugAllergies//CHRTAllergy_List//CHRTAllergy//eNoteDisplay//eNote_Text').map do |item|
              item.text
          end 

  medications_reviewed = @doc.xpath('//CHRTCurrentMeds//CHRTMedicationReviewInfo//eNoteDisplay//eNote_Text').map do |item|
        item.text
    end

  current_medications_list = @doc.xpath('//CHRTCurrentMeds//CHRTCurrentMed_List//CHRTCurrentMed//eNoteDisplay//eNote_Text').map do |item|
        item.text
    end


  not_known_medications_list = @doc.xpath('//CHRTCurrentMeds/CHRTNoKnownMedications/eNoteDisplay//eNote_Text').map do |item|
              item.text
          end

    vitals_history_fulltext = @doc.xpath('//CHRTObjective/CHRTVitals/CHRTVitalsHistory//eNoteDisplay').map do |item|
          item.xpath("eNote_Text").text
    end

    vitals_current_fulltext = @doc.xpath('//CHRTObjective/CHRTVitals/CHRTVitalsCurrent//eNoteDisplay').map do |item|
        item.xpath("eNote_Text").text
    end

    vitals_repeat_fulltext = @doc.xpath('//CHRTObjective/CHRTVitals/CHRTVitalsRepeat//eNoteDisplay').map do |item|
          item.xpath("eNote_Text").text
    end

    exam_fulltext = @doc.xpath('//CHRTObjective//CHRTExams//CHRTTemplates//CHRTTemplate_List//eTemplate//SENTENCE_LIST//SENTENCE//SENTENCE_FULL_TEXT//SENTENCE_SEGMENT//SENTENCE_SEGMENT_TEXT').map do |item|
        item.text.strip + " " 
    end

    labs_test_results_fulltext = @doc.xpath('//CHRTObjective/CHRTLabs/CHRTTemplates/CHRTTemplate_List/eTemplate/SENTENCE_LIST/SENTENCE/SENTENCE_FULL_TEXT//SENTENCE_SEGMENT/SENTENCE_SEGMENT_TEXT').map do |item|
        item.text.strip + " " 
    end

     procedures= @doc.xpath('//CHRTObjective/CHRTProcedures/CHRTProcedureDiagnosis_List/CHRTProcedureDiagnosis//eNoteDisplay').map do |item|
         item.xpath("eNote_Text").text
     end

    diagnosis_text = @doc.xpath('//CHRTAssessment/CHRTDiagnosis_List/CHRTDiagnosis//eNoteDisplay').map do |item|
        item.xpath("eNote_Text").text
    end
    
    med_orders = @doc.xpath('//CHRTOrders/CHRTOrdersMedsPrescribed/CHRTOrdersMedsPrescribed_List/CHRTOrdersScript//eNoteDisplay').map do |item|
        item.xpath("eNote_Text").text
    end
    
    radiology_orders = @doc.xpath('//CHRTOrders/CHRTOrdersRadiologyTests/CHRTOrdersRadiologyTest_List/CHRTCPTOrder//eNoteDisplay').map do |item|
      item.xpath("eNote_Text").text
    end
    
    lab_orders = @doc.xpath('//CHRTOrders/CHRTOrdersLabs/CHRTOrdersLab_List/CHRTCPTOrder//eNoteDisplay').map do |item|
      item.xpath("eNote_Text").text
    end
    
    procedure_orders = @doc.xpath('//CHRTOrders/CHRTOrdersProcedures/CHRTOrdersProcedure_List/CHRTCPTOrder//eNoteDisplay').map do |item|
      item.xpath("eNote_Text").text
   end

   
   other_orders = @doc.xpath('//CHRTOrders/CHRTOrdersOther/CHRTOrdersOther_List/CHRTCPTOrder//eNoteDisplay').map do |item|
     item.xpath("eNote_Text").text
  end

    plan_types = @doc.xpath("//CHRTPlan/CHRTPlanDiagnosis_List/CHRTPlanDiagnosis").map do |item|
      code = item.xpath("CHRTPlanDiagnosis_ICDCode").text
      type = item.xpath("CHRTPlanDiagnosis_DisplayDescription").text
      text = item.xpath("CHRTTemplates/CHRTTemplate_List/eTemplate/SENTENCE_LIST/SENTENCE/SENTENCE_FULL_TEXT/SENTENCE_SEGMENT/SENTENCE_SEGMENT_TEXT").text
      prescriptions = item.xpath("CHRTPlanPrescriptions/CHRTPlanPrescription_List").text
      orders = item.xpath("CHRTPlanOrders/CHRTPlanOrder_List/CHRTCPTOrder//eNoteDisplay/eNote_Text").text
      patient_ed = item.xpath("CHRTPlanPatientEd/CHRTPlanPatientEd_List/CHRTPlanPatientEd//eNoteDisplay/eNote_Text").text
    [{:code => code,:type => type,:text => text,:prescriptions =>prescriptions ,:orders => orders,:patient_ed =>patient_ed}]
   end
 other_plan_types = @doc.xpath("//CHRTPlan").map do |item|
   prescriptions = item.xpath("CHRTPlanOtherPrescriptions/CHRTPlanPrescription_List//eNoteDisplay/eNote_Text").text
   orders = item.xpath("CHRTPlanOtherOrders/CHRTPlanOrder_List//eNoteDisplay/eNote_Text").text
   patient_ed = item.xpath("CHRTPlanOtherPatientEd/CHRTPlanPatientEd_List//eNoteDisplay/eNote_Text").text
 [{:prescriptions => prescriptions,:orders => orders,:patient_ed => patient_ed}]
end

recommedations = @doc.xpath("//CHRTPatientRecommendations/CHRTRecommendation_List").map do |item|
  recommedation = item.xpath("CHRTRecommendation//eNoteDisplay//eNote_Text").text
  recommedation
end
  
  caputre_codes = @doc.xpath("//CHRTChargeCapture/CHRTChargeCaptureDiagnosis_List/CHRTChargeCaptureDiagnosis").map do |item|
    code = item.xpath("CHRTChargeCaptureDiagnosis_ICDCode").text
    description =item.xpath("CHRTChargeCaptureDiagnosis_DisplayDescription").text
    codes = item.xpath("CHRTChargeCaptureICD10s/CHRTChargeCaptureICD10_List").map do |c|
      a = c.xpath("CHRTChargeCaptureDiagnosisICD10/CHRTChargeCaptureDiagnosisICD10_ICDCode").text
      b= c.xpath("CHRTChargeCaptureDiagnosisICD10/CHRTChargeCaptureDiagnosisICD10_DisplayDescription").text
      [a,b]
    end
    orders = item.xpath("CHRTChargeCaptureOrders/CHRTChargeCaptureOrder_List/CHRTCPTOrder//eNoteDisplay/eNote_Text").text
    [{:code => code,:description => description, :codes =>codes,:orders => orders}]
    end
  
primary_code = @doc.xpath("//CHRTHPI/CHRTIllness_List/CHRTIllness").map do |x|
     x.xpath("CHRTIllness_ICDCode").text+", " +x.xpath("CHRTIllness_DisplayDescription").text
end

arr= { 
    :business_entity_id => 4561,
    :location => get_value("//CHRTMedicalFacility//eNote_Text[@Type='MedicalFacility']").text,
    :legacy_patient_id =>  get_value("CHRTPatient").attr("Patient_ID").value,
    :first_name =>  get_value("CHRTPatient/CHRT_Name/CHRT_FirstName").text,
    :last_name =>  get_value("CHRTPatient/CHRT_Name/CHRT_LastName").text,
    :middle_initial =>  get_value("CHRTPatient/CHRT_Name/CHRT_MiddleName").text.chars.first, #protect from nil
    :date_of_birth =>  get_value('eNote_Text[@Type="DateOfBirth"]').text,
    :gender =>  get_value("CHRT_Gender").text,
    :date_signed => get_value('CHRTSignOff[@Type="SignOff"]/CHRTDateOccurred/CHRT_DateTime').text.strip,
    :signed_by => get_value('eNote_Text[@Type="SignOffTitle"]').text.strip,
    :date_of_service =>  get_value('CHRTVisitDetails/CHRTDateOccurred/CHRT_DateTime').text,
    :nature_of_visit => get_value('eNote_Text[@Type="CPTCategory"]').text,
    :provider_first_name =>  get_value('CHRTHealthCareProfessionals/CHRTHealthCare[@Type="Provider"]/CHRT_Name/CHRT_FirstName').text,
    :provider_last_name =>  get_value('CHRTHealthCareProfessionals/CHRTHealthCare[@Type="Provider"]/CHRT_Name/CHRT_LastName').text,
    :provider_middle_initial =>  get_value('CHRTHealthCareProfessionals/CHRTHealthCare[@Type="Provider"]/CHRT_Name/CHRT_MiddleName').text.chars.first,
    :assitant_first_name =>  get_value('CHRTHealthCareProfessionals/CHRTHealthCare_Other/CHRTHealthCare_List/CHRTHealthCare[@Type="Assistant"]/CHRT_Name/CHRT_FirstName').text,
    :assitant_last_name =>  get_value('CHRTHealthCareProfessionals/CHRTHealthCare_Other/CHRTHealthCare_List/CHRTHealthCare[@Type="Assistant"]/CHRT_Name/CHRT_LastName').text,
    :assitant_middle_initial =>  get_value('CHRTHealthCareProfessionals/CHRTHealthCare_Other/CHRTHealthCare_List/CHRTHealthCare[@Type="Assistant"]/CHRT_Name/CHRT_MiddleName').text.chars.first,
    :supervisor_first_name =>  get_value('CHRTHealthCareProfessionals/CHRTHealthCare_Other/CHRTHealthCare_List/CHRTHealthCare[@Type="Supervisor"]/CHRT_Name/CHRT_FirstName').text,
    :supervisor_last_name =>  get_value('CHRTHealthCareProfessionals/CHRTHealthCare_Other/CHRTHealthCare_List/CHRTHealthCare[@Type="Supervisor"]/CHRT_Name/CHRT_LastName').text,
    :supervisor_middle_initial =>  get_value('CHRTHealthCareProfessionals/CHRTHealthCare_Other/CHRTHealthCare_List/CHRTHealthCare[@Type="Supervisor"]/CHRT_Name/CHRT_MiddleName').text.chars.first, #protect from nil
    :chief_complaint_text => cc_text.join,
    # :cc_assessment => cc_assessment,
    :hpi_free_text => hpi_free_text.to_s,
    :hpi_text => hpi_text.join.to_s,
    # :hpi_assessment => hpi_assessment,
    # :primary_diagnoses => primary_code,
    :ros => ros_assessment_fulltext.join,
    :PMH_FMH_SH => @doc.xpath('//CHRTPMHxHistory/CHRTHistory_List/CHRTHistory/CHRTHistory_Text/CHRTHistoryReview/eNoteDisplay/eNote_Text[@Type="HistoryReviewInfo"]').text,
    :pmh_text => pmh_fulltext.join,
    :surgical_history => sh_fulltext.join,
    :family_histroy => fh_fulltext.join,
    :social_histroy => soh_fulltext.join,
    :alcohol_and_drug_history => aldr_fulltext.join,
    :substance_abuse_histroy => subabu_fulltext.join,
    :mental_health_history => mh_fulltext.join,
    :communicable_diseases =>  id_fulltext.join,
    :pmh_legacy => pmh_legacy.join,
    :chronic_prob_review => chronic_prob_review.join,
    :chronic_no_known_problems => chronic_no_known_problems.join,
    :current_problem_list => chronic_problem_list,
    :immunization_none => immunization_none,
    :immunizations_list => immunizations_list,
    :allergies_reviewed => allergies_reviewed.join,
    :allergies => allergies,
    :drug_allergies_list =>  drug_allergies_list.join,
    :non_drug_allergies_list => non_drug_allergies_list.join,
    :medications_reviewed => medications_reviewed.join,
    :current_medications_list => current_medications_list,
    :non_known_medications => not_known_medications_list,
    :vitals_history => vitals_history_fulltext,
    :vitals_current => vitals_current_fulltext,
    :vitals_repeat => vitals_repeat_fulltext,
    :exams => exam_fulltext.join,
    :lab_test_results => labs_test_results_fulltext.join,
    :assessment_diagnosis => diagnosis_text,
    :procedures => procedures,
    :medication_orders => med_orders.join,
    :radiology_orders => radiology_orders.join,
    :lab_orders => lab_orders.join,
    :procedure_orders => procedure_orders.join,
    :other_orders => other_orders,
    :plans => plan_types,
    :other_plans => other_plan_types,
    :recomendations => recommedations,
    :caputre_codes => caputre_codes

}
puts arr

