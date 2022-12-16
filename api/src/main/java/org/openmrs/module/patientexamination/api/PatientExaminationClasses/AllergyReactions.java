package org.openmrs.module.patientexamination.api.PatientExaminationClasses;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.openmrs.BaseOpenmrsData;

@Entity(name = "allergy_reaction")
@Table(name = "allergy_reaction")
public class AllergyReactions extends BaseOpenmrsData {
	
	@Id
	@GeneratedValue
	@Column(name = "allergy_reaction_id")
	private Integer id;
	
	private Integer allergy_id;
	
	private Integer reaction_concept_id;
	
	private String reaction_non_coded;
	
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
	
	public Integer getallergy_id() {
		return allergy_id;
	}
	
	public void setallergy_id(Integer allergy_id) {
		this.allergy_id = allergy_id;
	}
	
	public Integer getreaction_concept_id() {
		return reaction_concept_id;
	}
	
	public void setreaction_concept_id(Integer reaction_concept_id) {
		this.reaction_concept_id = reaction_concept_id;
	}
	
	public String getreaction_non_coded() {
		return reaction_non_coded;
	}
	
	public void setcoded_allergen(String reaction_non_coded) {
		this.reaction_non_coded = reaction_non_coded;
	}
	
}
