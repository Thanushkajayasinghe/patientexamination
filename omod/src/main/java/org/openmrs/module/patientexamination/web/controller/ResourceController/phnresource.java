package org.openmrs.module.patientexamination.web.controller.ResourceController;

import org.openmrs.api.context.Context;
import org.openmrs.module.patientexamination.api.Phn.Phn;
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

@Resource(name = RestConstants.VERSION_1 + "/phn", supportedClass = Phn.class, supportedOpenmrsVersions = { "1.8.*",
        "2.0.*", "2.1.*", "2.2.*", "2.3.*", "2.4.* " })
public class phnresource extends DataDelegatingCrudResource<Phn> {
	
	@Override
	public DelegatingResourceDescription getRepresentationDescription(Representation r) {
		if (r instanceof DefaultRepresentation) {
			DelegatingResourceDescription description = new DelegatingResourceDescription();
			description.addProperty("person_id");
			description.addProperty("person_attribute_type_id");
			description.addProperty("value");
			description.addProperty("uuid");
			description.addSelfLink();
			return description;
		} else if (r instanceof FullRepresentation) {
			DelegatingResourceDescription description = new DelegatingResourceDescription();
			description.addProperty("person_id");
			description.addProperty("person_attribute_type_id");
			description.addProperty("value");
			description.addProperty("uuid");
			description.addSelfLink();
			return description;
		}
		return null;
	}
	
	@Override
	public DelegatingResourceDescription getCreatableProperties() {
		DelegatingResourceDescription description = new DelegatingResourceDescription();
		description.addRequiredProperty("name");
		return description;
	}
	
	@Override
	public DelegatingResourceDescription getUpdatableProperties() throws ResourceDoesNotSupportOperationException {
		return getCreatableProperties();
	}
	
	@Override
	public Phn newDelegate() {
		return new Phn();
	}
	
	@Override
	public Phn getByUniqueId(String val) {
		Phn item = Context.getService(PhnService.class).getByUuid(val);
		return item;
	}
	
	@Override
	public Phn save(Phn arg0) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	protected void delete(Phn arg0, String arg1, RequestContext arg2) throws ResponseException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void purge(Phn t, RequestContext context) throws ResponseException {
		// TODO Auto-generated method stub
	}
	
}
