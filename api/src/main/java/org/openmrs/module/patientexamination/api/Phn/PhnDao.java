/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.patientexamination.api.Phn;

import org.hibernate.criterion.Restrictions;
import org.openmrs.api.db.hibernate.DbSession;
import org.openmrs.api.db.hibernate.DbSessionFactory;
import org.openmrs.module.patientexamination.api.PatientExaminationClasses.Allergy;
import org.openmrs.module.patientexamination.api.PatientExaminationClasses.AllergyReactions;
import org.openmrs.module.patientexamination.api.PatientExaminationClasses.Concept;
import org.openmrs.module.patientexamination.api.PatientExaminationClasses.Patient;
import org.openmrs.module.patientexamination.api.PatientExaminationClasses.PresentingComplains;

public class PhnDao {
	
	DbSessionFactory sessionFactory;
	
	public void setSessionFactory(DbSessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	private DbSession getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public Phn getByUuid(String val) {
		return (Phn) getSession().createCriteria(Phn.class).add(Restrictions.eq("value", val)).uniqueResult();
	}
	
	public PresentingComplains SavePresentingComplains(PresentingComplains t) {
		getSession().saveOrUpdate(t);
		return t;
	}
	
	public Concept GetConceptId(String uuid) {
		return (Concept) getSession().createCriteria(Concept.class).add(Restrictions.eq("uuid", uuid)).uniqueResult();
	}
	
	public Allergy SaveAllergy(Allergy a) {
		getSession().saveOrUpdate(a);
		return a;
	}
	
	public Patient GetPatientId(String uuid) {
		return (Patient) getSession().createCriteria(Patient.class).add(Restrictions.eq("uuid", uuid)).uniqueResult();
	}
	
	public AllergyReactions SaveAllergyReactions(AllergyReactions t) {
		getSession().saveOrUpdate(t);
		return t;
	}
	
}
