package org.openmrs.module.patientexamination.api.PatientExaminationClasses;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.openmrs.BaseOpenmrsData;

@Entity(name = "allergy")
@Table(name = "allergy")
public class Allergy extends BaseOpenmrsData {
	
	@Id
	@GeneratedValue
	@Column(name = "allergy_id")
	private Integer id;
	
	private Integer patient_id;
	
	private Integer severity_concept_id;
	
	private Integer coded_allergen;
	
	private String non_coded_allergen;
	
	private String encounter_uuid;
	
	private String allergen_type;
	
	private String comments;
	
	private String phn;
	
	public Integer getPatient_id() {
		return this.patient_id;
	}
	
	public void setPatient_id(Integer patient_id) {
		this.patient_id = patient_id;
	}
	
	public Integer getSeverity_concept_id() {
		return this.severity_concept_id;
	}
	
	public void setSeverity_concept_id(Integer severity_concept_id) {
		this.severity_concept_id = severity_concept_id;
	}
	
	public Integer getCoded_allergen() {
		return this.coded_allergen;
	}
	
	public void setCoded_allergen(Integer coded_allergen) {
		this.coded_allergen = coded_allergen;
	}
	
	public String getNon_coded_allergen() {
		return this.non_coded_allergen;
	}
	
	public void setNon_coded_allergen(String non_coded_allergen) {
		this.non_coded_allergen = non_coded_allergen;
	}
	
	public String getEncounter_uuid() {
		return this.encounter_uuid;
	}
	
	public void setEncounter_uuid(String encounter_uuid) {
		this.encounter_uuid = encounter_uuid;
	}
	
	public String getAllergen_type() {
		return allergen_type;
	}
	
	public void setAllergen_type(String allergen_type) {
		this.allergen_type = allergen_type;
	}
	
	public String getComments() {
		return comments;
	}
	
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public String getPhn() {
		return this.phn;
	}
	
	public void setPhn(String phn) {
		this.phn = phn;
	}
	
	@Override
	public Integer getId() {
		return id;
	}
	
	@Override
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Override
	public String getUuid() {
		return super.getUuid();
	}
	
	@Override
	public void setUuid(String uuid) {
		super.setUuid(uuid);
	}
	
	@Override
	public String toString() {
		return "{" + " id='" + getId() + "'" + ", patient_id='" + getPatient_id() + "'" + ", severity_concept_id='"
		        + getSeverity_concept_id() + "'" + ", coded_allergen='" + getCoded_allergen() + "'"
		        + ", non_coded_allergen='" + getNon_coded_allergen() + "'" + ", encounter_uuid='" + getEncounter_uuid()
		        + "'" + ", phn='" + getPhn() + "'" + "}";
	}
	
}
