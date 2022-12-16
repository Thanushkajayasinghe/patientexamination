package org.openmrs.module.patientexamination.api.PatientExaminationClasses;

/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */

import org.openmrs.BaseOpenmrsData;
import org.openmrs.Person;
import org.openmrs.User;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Please note that a corresponding table schema must be created in liquibase.xml.
 */
// Uncomment 2 lines below if you want to make the Item class persistable, see
// also PatientexaminationDaoTest and liquibase.xml
@Entity(name = "aatbl_presentingcomplain")
@Table(name = "aatbl_presentingcomplain")
public class PresentingComplains extends BaseOpenmrsData {
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;
	
	private String encounteruuid;
	
	@ManyToOne
	@JoinColumn(name = "patientuuid")
	private Person person;
	
	private String phn;
	
	private String value;
	
	@Override
	public Integer getId() {
		return id;
	}
	
	@Override
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getencounteruuid() {
		return encounteruuid;
	}
	
	public void setencounteruuid(String encounteruuid) {
		this.encounteruuid = encounteruuid;
	}
	
	public Person getperson_id() {
		return person;
	}
	
	public void setperson_id(Person person) {
		this.person = person;
	}
	
	public String getvalue() {
		return value;
	}
	
	public void setvalue(String value) {
		this.value = value;
	}
	
	public String getphn() {
		return phn;
	}
	
	public void setphn(String phn) {
		this.phn = phn;
	}
	
	@Override
	public String getUuid() {
		return super.getUuid();
	}
	
	@Override
	public void setUuid(String uuid) {
		super.setUuid(uuid);
	}
	
}
