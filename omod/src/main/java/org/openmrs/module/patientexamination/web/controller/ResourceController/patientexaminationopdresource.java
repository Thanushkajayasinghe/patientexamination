package org.openmrs.module.patientexamination.web.controller.ResourceController;

import java.util.List;

import org.openmrs.api.context.Context;
import org.openmrs.module.patientexamination.api.DiseasesList.Diseases;
import org.openmrs.module.patientexamination.api.DiseasesList.DiseasesService;
import org.openmrs.module.webservices.rest.web.RequestContext;
import org.openmrs.module.webservices.rest.web.RestConstants;
import org.openmrs.module.webservices.rest.web.annotation.Resource;
import org.openmrs.module.webservices.rest.web.representation.DefaultRepresentation;
import org.openmrs.module.webservices.rest.web.representation.FullRepresentation;
import org.openmrs.module.webservices.rest.web.representation.Representation;
import org.openmrs.module.webservices.rest.web.resource.api.PageableResult;
import org.openmrs.module.webservices.rest.web.resource.impl.DataDelegatingCrudResource;
import org.openmrs.module.webservices.rest.web.resource.impl.DelegatingResourceDescription;
import org.openmrs.module.webservices.rest.web.resource.impl.NeedsPaging;
import org.openmrs.module.webservices.rest.web.response.ResourceDoesNotSupportOperationException;
import org.openmrs.module.webservices.rest.web.response.ResponseException;

@Resource(name = RestConstants.VERSION_1 + "/diseases", supportedClass = Diseases.class, supportedOpenmrsVersions = {
        "1.8.*", "2.0.*", "2.1.*", "2.2.*", "2.3.*", "2.4.* " })
public class patientexaminationopdresource extends DataDelegatingCrudResource<Diseases> {
	
	@Override
	public DelegatingResourceDescription getRepresentationDescription(Representation r) {
		if (r instanceof DefaultRepresentation) {
			DelegatingResourceDescription description = new DelegatingResourceDescription();
			description.addProperty("uuid");
			description.addProperty("name");
			description.addSelfLink();
			return description;
		} else if (r instanceof FullRepresentation) {
			DelegatingResourceDescription description = new DelegatingResourceDescription();
			description.addProperty("uuid");
			description.addProperty("name");
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
	public Diseases newDelegate() {
		return new Diseases();
	}
	
	@Override
	public Diseases save(Diseases t) {
		Diseases item = Context.getService(DiseasesService.class).saveDiseases(t);
		return item;
	}
	
	@Override
	protected void delete(Diseases t, String arg1, RequestContext arg2) throws ResponseException {
		if (t == null)
			return;
		Context.getService(DiseasesService.class).purgeDiseases(t);
		
	}
	
	@Override
	public Diseases getByUniqueId(String uuid) {
		Diseases item = Context.getService(DiseasesService.class).getDiseasesByUuid(uuid);
		return item;
	}
	
	@Override
	public void purge(Diseases t, RequestContext context) throws ResponseException {
		if (t == null)
			return;
		Context.getService(DiseasesService.class).purgeDiseases(t);
	}
	
	@Override
	public NeedsPaging<Diseases> doGetAll(RequestContext context) {
		return new NeedsPaging<Diseases>(Context.getService(DiseasesService.class).getAllDiseases(), context);
	}
	
	@Override
	protected PageableResult doSearch(RequestContext context) {
		
		String query = context.getParameter("q");
		
		List<Diseases> diseasesByQuery = null;
		
		if (query != null) {
			diseasesByQuery = Context.getService(DiseasesService.class).diseasesByQuery(query, false);
		} else {
			diseasesByQuery = Context.getService(DiseasesService.class).getAllDiseases();
		}
		
		return new NeedsPaging<Diseases>(diseasesByQuery, context);
	}
	
}
