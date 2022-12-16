package org.openmrs.module.patientexamination.api.PatientExaminationClasses;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.openmrs.BaseOpenmrsData;

@Entity(name = "patient")
@Table(name = "patient")
public class Patient extends BaseOpenmrsData {
	
	@Id
	@GeneratedValue
	@Column(name = "patient_id")
	private Integer id;
	
	private String uuid;
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getUuid() {
		return uuid;
	}
	
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
}
