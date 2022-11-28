package org.openmrs.module.patientexamination.api.Phn;

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
@Entity(name = "person_attribute")
@Table(name = "person_attribute")
public class Phn extends BaseOpenmrsData {
	
	@Id
	@GeneratedValue
	@Column(name = "person_attribute_id")
	private Integer person_attribute_id;
	
	private String value;
	
	private Integer person_attribute_type_id;
	
	private String uuid;
	
	@ManyToOne
	@JoinColumn(name = "person_id")
	private Person person_id;
	
	public Integer getperson_attribute_id() {
		return person_attribute_id;
	}
	
	public void setperson_attribute_id(Integer person_attribute_id) {
		this.person_attribute_id = person_attribute_id;
	}
	
	public Person getperson_id() {
		return person_id;
	}
	
	public void setperson_id(Person person_id) {
		this.person_id = person_id;
	}
	
	public String getvalue() {
		return value;
	}
	
	public void setvalue(String value) {
		this.value = value;
	}
	
	public Integer getperson_attribute_type_id() {
		return person_attribute_type_id;
	}
	
	public void setperson_attribute_type_id(Integer person_attribute_type_id) {
		this.person_attribute_type_id = person_attribute_type_id;
	}
	
	public String getuuid() {
		return uuid;
	}
	
	public void setuuid(String uuid) {
		this.uuid = uuid;
	}
	
	@Override
	public Integer getId() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void setId(Integer arg0) {
		// TODO Auto-generated method stub
		
	}
}
