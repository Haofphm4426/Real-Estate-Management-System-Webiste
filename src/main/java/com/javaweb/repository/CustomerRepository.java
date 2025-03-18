package com.javaweb.repository;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepository extends JpaRepository<CustomerEntity,Long>, CustomerRepositoryCustom {
//    CustomerEntity findOneByIdAndIs_Active(Long id, int active);
    void deleteByIdIn(List<Long> ids);
    List<CustomerEntity> findByCustomerStaffs_IdAndIsActive(Long id, Long active);
    CustomerEntity findByIdAndIsActive(Long id, Long active);
}
