package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.impl.BuildingService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/buildings")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserService userService;

    @PostMapping
    public String addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        buildingService.addOrUpdateBuilding(buildingDTO);
        return new String("Success");
    }

    @DeleteMapping()
    public String deleteBuilding(@RequestBody List<Long> ids) {
        buildingService.deleteBuilding(ids);
        return new String("Delete Success");
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaff(@PathVariable("id") Long id) {

        return buildingService.loadStaffs(id);
    }

    @PutMapping()
    public void  updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        buildingService.updateAssignmentBuilding(assignmentBuildingDTO);
    }
}

