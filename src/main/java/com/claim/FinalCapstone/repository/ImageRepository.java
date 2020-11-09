package com.claim.FinalCapstone.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.claim.FinalCapstone.model.ImageFiles;



public interface ImageRepository extends JpaRepository <ImageFiles, Long> {

}
