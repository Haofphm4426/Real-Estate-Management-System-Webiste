package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface IBuildingService {
    public List<BuildingSearchResponse> getListBuilding(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    public void addOrUpdateBuilding(BuildingDTO buildingDTO);

    public void deleteBuilding(List<Long> ids);

    public ResponseDTO loadStaffs(Long id);

    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
    public int countTotalItems(BuildingSearchRequest buildingSearchRequest);
}
