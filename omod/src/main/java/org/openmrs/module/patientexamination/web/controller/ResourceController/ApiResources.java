package org.openmrs.module.patientexamination.web.controller.ResourceController;

import org.springframework.stereotype.Controller;
import org.openmrs.api.context.Context;
import org.openmrs.module.patientexamination.api.PatientExaminationClasses.Allergy;
import org.openmrs.module.patientexamination.api.PatientExaminationClasses.Concept;
import org.openmrs.module.patientexamination.api.PatientExaminationClasses.Patient;
import org.openmrs.module.patientexamination.api.Phn.PhnService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/rest/v1/patientexamination/")
public class ApiResources {
	
	@RequestMapping(value = "/concept/{uuid}", method = RequestMethod.GET)
	public Concept GetConceptId(@PathVariable(value = "uuid") String uuid) {
		Concept res = Context.getService(PhnService.class).GetConceptId(uuid);
		return res;
	}
	
	@RequestMapping(value = "/patient/{uuid}", method = RequestMethod.GET)
	public Patient GetPatientId(@PathVariable(value = "uuid") String uuid) {
		Patient res = Context.getService(PhnService.class).GetPatientId(uuid);
		return res;
	}
	
	@RequestMapping(value = "/allergy", method = RequestMethod.POST)
	public Allergy SaveAllergy(@RequestBody Allergy a) {
		Allergy res = Context.getService(PhnService.class).SaveAllergy(a);
		return res;
	}
	
	// @RequestMapping(value = "/allergyreactions", method = RequestMethod.POST)
	// public Test SaveAllergyReactions(@RequestBody Test a) {
	// Test res = Context.getService(PhnService.class).SaveAllergyReactions(a);
	// return res;
	// }
	
}
