package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.impl.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/customers")
public class CustomerAPI {
    @Autowired
    ICustomerService customerService;
    @PostMapping
    public void addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO) {
        customerService.addOrUpdateCustomer(customerDTO);
    }


    @GetMapping("/staffs/{id}")
    public ResponseDTO loadStaff(@PathVariable("id") Long id) {

        return customerService.loadStaffs(id);
    }

    @PutMapping()
    public void  updateAssignmentCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO) {
        customerService.updateAssignmentCustomer(assignmentCustomerDTO);
    }

    @DeleteMapping()
    public String deleteCustomer(@RequestBody List<Long> ids) {
        customerService.deleteCustomer(ids);
        return new String("Delete Success");
    }

}
