package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.Status;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.MyUserDetail;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.TransactionResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController(value = "customerControllerOfAdmin")
public class CustomerController {
    @Autowired
    IUserService userService;
    @Autowired
    private ICustomerService customerService;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private UserRepository userRepository;

    @GetMapping(value = "admin/customer-list")
    public ModelAndView getNews(@ModelAttribute(SystemConstant.MODEL) CustomerSearchRequest model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        model.setTableId("customerList");
        DisplayTagUtils.of(request, model);

        mav.addObject("statusCode", Status.type());
        mav.addObject("staffs", userService.getStaffs());

        List<CustomerEntity> customers;
        String statusCode = model.getStatus();
        if(model.getStatus() != "") {
            model.setStatus(Status.getValueByStatusCode(model.getStatus()));
        }

        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")) {
            Long staffId = SecurityUtils.getPrincipal().getId();
            model.setStaffId(staffId);
            customers = customerService.getListCustomer(model, PageRequest.of(model.getPage() - 1, model.getMaxPageItems()));
        }
        else {
            customers = customerService.getListCustomer(model, PageRequest.of(model.getPage() - 1, model.getMaxPageItems()));
        }
        model.setStatus(statusCode);

        model.setListResult(customers);
        model.setTotalItems(customerService.countTotalItems(model));
        mav.addObject("customers", model);
        return mav;
    }
    @GetMapping(value = "/admin/customer-edit")
    public ModelAndView addCustomer(@ModelAttribute("customerEdit") CustomerDTO customerDTO) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("statusCode", Status.type());

        return mav;
    }

    @GetMapping(value = "/admin/customer-edit-{id}")
    public ModelAndView updateCustomer(@PathVariable("id") Long id) {

        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")) {
            Long staffId = SecurityUtils.getPrincipal().getId();
            UserEntity staff = userRepository.findById(staffId).get();
            CustomerEntity customer = customerRepository.findById(id).get();
            if(!staff.getCustomers().contains(customer)) {
                return new ModelAndView();
            }
        }

        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("statusCode", Status.type());
        mav.addObject("transactionType", TransactionType.transactionType());

        CustomerEntity customer = customerRepository.findByIdAndIsActive(id, 1L);
        if(customer == null) {
            return new ModelAndView();
        }
        customer.setStatus(Status.getCodeByValue(customer.getStatus()));
        mav.addObject("customerEdit", customer);

        //Lay 2 ds theo transaction type CSKH va DDX: findByCodeAndCustomerId
        List<TransactionResponseDTO>CSKHTransactions = customerService.getListTransaction("CSKH", id);
        List<TransactionResponseDTO>DDXTransactions = customerService.getListTransaction("DDX", id);

        mav.addObject("CSKHTransactions", CSKHTransactions);
        mav.addObject("DDXTransactions", DDXTransactions);
        return mav;
    }
}
