package com.claim.FinalCapstone.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.claim.FinalCapstone.model.Role;


@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {

	Role findByRole(String role);
	
}
