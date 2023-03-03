package com.devpro.finalProjectJavaweb21.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.finalProjectJavaweb21.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

}
