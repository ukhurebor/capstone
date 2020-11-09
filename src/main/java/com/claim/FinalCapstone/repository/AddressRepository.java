package com.claim.FinalCapstone.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.claim.FinalCapstone.model.Addressess;



public interface AddressRepository extends JpaRepository<Addressess, Long> {

	Optional<Addressess> findByEmail(String email);
}
