package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.model.response.TransactionResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
@Transactional
public class CustomerService implements ICustomerService {
    @Autowired
    CustomerRepository customerRepository;
    @Autowired
    CustomerConverter customerConverter;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TransactionConverter transactionConverter;
    @Autowired
    private TransactionRepository transactionRepository;

    @Override
    public List<CustomerEntity> getListCustomer(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        return customerRepository.findAll(customerSearchRequest, pageable);
    }

    @Override
    public int countTotalItems(CustomerSearchRequest customerSearchRequest) {
        return customerRepository.countTotalItem(customerSearchRequest);
    }

    @Override
    public void addOrUpdateCustomer(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = customerConverter.convertToCustomerEntity(customerDTO);
        customerRepository.save(customerEntity);
    }

    @Override
    public ResponseDTO loadStaffs(Long customerId) {
        List<UserEntity> userEntities = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<StaffResponseDTO> staffAssignment = new ArrayList<>();

        CustomerEntity customerEntity = customerRepository.findById(customerId).get();
        List<UserEntity> assignedStaffs = customerEntity.getCustomerStaffs();
        for (UserEntity user : userEntities) {

            StaffResponseDTO staff = new StaffResponseDTO();
            staff.setStaffId((user.getId()));
            staff.setFullName(user.getFullName());
            staff.setChecked("");

            if(assignedStaffs.contains(user)) {
                staff.setChecked("checked");
            }
            staffAssignment.add(staff);
        }

        ResponseDTO result = new ResponseDTO();
        result.setData(staffAssignment);
        result.setMessage("Success");

        return result;
    }

    @Override
    public void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        List<UserEntity> userEntities = userRepository.findAllById(assignmentCustomerDTO.getStaffs());
        CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();

        customerEntity.setCustomerStaffs(userEntities);
        customerRepository.save(customerEntity);
    }


    @Override
    public void deleteCustomer(List<Long> ids) {
        List<CustomerEntity> listCustomer = new ArrayList<>();
        for(Long id : ids) {
            CustomerEntity customerEntity = customerRepository.findById(id).get();
            customerEntity.setIsActive(0L);
            listCustomer.add(customerEntity);
        }
        customerRepository.saveAll(listCustomer);
    }

    @Override
    public List<TransactionResponseDTO> getListTransaction(String code, Long id) {
        List<TransactionEntity> transactionEntities = transactionRepository.findByCodeAndTransactionCustomer_Id(code, id);
        List<TransactionResponseDTO> result = new ArrayList<>();
        for(TransactionEntity transactionEntity : transactionEntities) {
            result.add(transactionConverter.convertoToTransactionResponseDTO(transactionEntity));
        }
        return result;
    }


}
