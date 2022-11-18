/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.patientexamination.api.DiseasesList;

import java.util.List;
import org.openmrs.api.APIException;
import org.openmrs.api.UserService;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.patientexamination.api.DiseasesList.DiseasesDao;

public class DiseasesServiceImpl extends BaseOpenmrsService implements DiseasesService {
	
	DiseasesDao dao;
	
	UserService userService;
	
	public void setDao(DiseasesDao dao) {
		this.dao = dao;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@Override
	public Diseases getDiseasesByUuid(String uuid) throws APIException {
		return dao.getDiseasesByUuid(uuid);
	}
	
	@Override
	public Diseases saveDiseases(Diseases diseases) throws APIException {
		return dao.saveDiseases(diseases);
	}
	
	@Override
	public void purgeDiseases(Diseases diseases) throws APIException {
		dao.purgeDiseases(diseases);
	}
	
	@Override
	public List<Diseases> getAllDiseases() throws APIException {
		return dao.getAllDiseases();
	}
	
	public List<Diseases> diseasesByQuery(String query, boolean includeVoided) throws APIException {
		return dao.diseasesByQuery(query, includeVoided);
	}
	
}
