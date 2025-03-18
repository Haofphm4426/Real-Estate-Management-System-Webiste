package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.RentAreaConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingResponseDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import com.javaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class BuildingService implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private UploadFileUtils uploadFileUtils;

    @Override
    public List<BuildingSearchResponse> getListBuilding(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchRequest, pageable);
        List<BuildingSearchResponse> result = new ArrayList<>();

        for(BuildingEntity item : buildingEntities) {
            BuildingSearchResponse building = buildingConverter.convertToBuildingSearchResponse(item);
            result.add(building);
        }
        return result;
    }

    public BuildingDTO getBuildingById(long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        return buildingConverter.convertToBuildingDTO(buildingEntity);
    }

    @Transactional
    @Override
    public void addOrUpdateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.convertToBuildingEntity(buildingDTO);
        saveThumbnail(buildingDTO, buildingEntity);
        buildingRepository.save(buildingEntity);

    }

    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getImage()) {
                if (!path.equals(buildingEntity.getImage())) {
                    File file = new File("C://home/office" + buildingEntity.getImage());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setImage(path);
        }
    }


    @Transactional
    @Override
    public void deleteBuilding(List<Long> ids) {
        buildingRepository.deleteByIdIn(ids);
    }

    @Override
    public ResponseDTO loadStaffs(Long buildingId) {
        List<UserEntity> userEntities = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<StaffResponseDTO> staffAssignment = new ArrayList<>();

        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
        List<UserEntity> assignedStaffs = buildingEntity.getStaffs();
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

    @Transactional
    @Override
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<UserEntity> userEntities = userRepository.findAllById(assignmentBuildingDTO.getStaffs());
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();

        buildingEntity.setStaffs(userEntities);
        buildingRepository.save(buildingEntity);
    }

    @Override
    public int countTotalItems(BuildingSearchRequest buildingSearchRequest) {
        return buildingRepository.countTotalItem(buildingSearchRequest);
    }
}
