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

import org.hibernate.Criteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.openmrs.api.db.hibernate.DbSession;
import org.openmrs.api.db.hibernate.DbSessionFactory;

public class DiseasesDao {
	
	DbSessionFactory sessionFactory;
	
	public void setSessionFactory(DbSessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	private DbSession getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public Diseases getDiseasesByUuid(String uuid) {
		return (Diseases) getSession().createCriteria(Diseases.class).add(Restrictions.eq("uuid", uuid)).uniqueResult();
	}
	
	public Diseases saveDiseases(Diseases diseases) {
		getSession().saveOrUpdate(diseases);
		return diseases;
	}
	
	public void purgeDiseases(Diseases diseases) {
		getSession().delete(diseases);
	}
	
	public List<Diseases> getAllDiseases() {
		Criteria crit = sessionFactory.getCurrentSession().createCriteria(Diseases.class);
		return crit.list();
	}
	
	public List<Diseases> diseasesByQuery(String query, boolean includeVoided) {
		
		if (query != null || !query.equals("=") || query.trim().length() != 0) {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Diseases.class, "i");
			// criteria.createAlias("i.owner", "owner");
			if (!includeVoided) {
				criteria.add(Restrictions.eq("i.voided", false));
			}
			
			Disjunction or = Restrictions.disjunction();
			MatchMode mode = MatchMode.ANYWHERE;
			or.add(Restrictions.ilike("i.name", query, mode));
			criteria.add(or);
			return (List<Diseases>) criteria.list();
		} else {
			return getAllDiseases();
		}
	}
}
