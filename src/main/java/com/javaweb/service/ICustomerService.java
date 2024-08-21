package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.TransactionResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ICustomerService {
    public List<CustomerEntity> getListCustomer(CustomerSearchRequest customerSearchRequest, Pageable pageable);
    public int countTotalItems(CustomerSearchRequest customerSearchRequest);
    public void addOrUpdateCustomer(CustomerDTO customerDTO);
    public ResponseDTO loadStaffs(Long id);

    public void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO);
    public void deleteCustomer(List<Long> ids);


    public List<TransactionResponseDTO> getListTransaction(String code, Long id);

}
