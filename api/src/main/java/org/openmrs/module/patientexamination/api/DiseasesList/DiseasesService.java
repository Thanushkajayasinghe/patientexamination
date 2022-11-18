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
import org.openmrs.annotation.Authorized;
import org.openmrs.api.APIException;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.patientexamination.PatientexaminationConfig;
import org.springframework.transaction.annotation.Transactional;

public interface DiseasesService extends OpenmrsService {
	
	@Authorized()
	@Transactional(readOnly = true)
	Diseases getDiseasesByUuid(String uuid) throws APIException;
	
	@Authorized(PatientexaminationConfig.MODULE_PRIVILEGE)
	@Transactional
	Diseases saveDiseases(Diseases diseases) throws APIException;
	
	@Authorized(PatientexaminationConfig.MODULE_PRIVILEGE)
	@Transactional
	void purgeDiseases(Diseases diseases) throws APIException;
	
	@Authorized()
	@Transactional()
	List<Diseases> getAllDiseases();
	
	@Authorized()
	@Transactional()
	List<Diseases> diseasesByQuery(String query, boolean includeVoided) throws APIException;
}
