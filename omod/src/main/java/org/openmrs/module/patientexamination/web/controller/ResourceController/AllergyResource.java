package org.openmrs.module.patientexamination.web.controller.ResourceController;

import org.openmrs.api.context.Context;
import org.openmrs.module.patientexamination.api.PatientExaminationClasses.Allergy;
import org.openmrs.module.patientexamination.api.Phn.PhnService;
import org.openmrs.module.webservices.rest.web.RequestContext;
import org.openmrs.module.webservices.rest.web.RestConstants;
import org.openmrs.module.webservices.rest.web.annotation.Resource;
import org.openmrs.module.webservices.rest.web.representation.DefaultRepresentation;
import org.openmrs.module.webservices.rest.web.representation.FullRepresentation;
import org.openmrs.module.webservices.rest.web.representation.Representation;
import org.openmrs.module.webservices.rest.web.resource.impl.DataDelegatingCrudResource;
import org.openmrs.module.webservices.rest.web.resource.impl.DelegatingResourceDescription;
import org.openmrs.module.webservices.rest.web.response.ResourceDoesNotSupportOperationException;
import org.openmrs.module.webservices.rest.web.response.ResponseException;

@Resource(name = RestConstants.VERSION_1 + "/AllergySave", supportedClass = Allergy.class, supportedOpenmrsVersions = {
        "1.8.*", "2.0.*", "2.1.*", "2.2.*", "2.3.*", "2.4.* " })
public class AllergyResource extends DataDelegatingCrudResource<Allergy> {
	
	@Override
	public DelegatingResourceDescription getRepresentationDescription(Representation r) {
		if (r instanceof DefaultRepresentation) {
			DelegatingResourceDescription description = new DelegatingResourceDescription();
			description.addProperty("id");
			description.addProperty("patient_id");
			description.addProperty("severity_concept_id");
			description.addProperty("coded_allergen");
			description.addProperty("non_coded_allergen");
			description.addProperty("encounter_uuid");
			description.addProperty("allergen_type");
			description.addProperty("comments");
			description.addProperty("phn");
			description.addProperty("uuid");
			description.addSelfLink();
			return description;
		} else if (r instanceof FullRepresentation) {
			DelegatingResourceDescription description = new DelegatingResourceDescription();
			description.addProperty("id");
			description.addProperty("patient_id");
			description.addProperty("severity_concept_id");
			description.addProperty("coded_allergen");
			description.addProperty("non_coded_allergen");
			description.addProperty("encounter_uuid");
			description.addProperty("allergen_type");
			description.addProperty("comments");
			description.addProperty("phn");
			description.addProperty("uuid");
			description.addSelfLink();
			return description;
		}
		return null;
	}
	
	@Override
	public DelegatingResourceDescription getCreatableProperties() {
		DelegatingResourceDescription description = new DelegatingResourceDescription();
		description.addRequiredProperty("patient_id");
		description.addRequiredProperty("severity_concept_id");
		description.addRequiredProperty("coded_allergen");
		description.addRequiredProperty("non_coded_allergen");
		description.addRequiredProperty("encounter_uuid");
		description.addRequiredProperty("allergen_type");
		description.addRequiredProperty("comments");
		description.addRequiredProperty("phn");
		return description;
	}
	
	@Override
	public DelegatingResourceDescription getUpdatableProperties() throws ResourceDoesNotSupportOperationException {
		return getCreatableProperties();
	}
	
	@Override
	public Allergy newDelegate() {
		return new Allergy();
	}
	
	@Override
	public Allergy save(Allergy t) {
		Allergy item = Context.getService(PhnService.class).SaveAllergy(t);
		return item;
	}
	
	@Override
	protected void delete(Allergy arg0, String arg1, RequestContext arg2) throws ResponseException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public Allergy getByUniqueId(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void purge(Allergy arg0, RequestContext arg1) throws ResponseException {
		// TODO Auto-generated method stub
		
	}
	
}
