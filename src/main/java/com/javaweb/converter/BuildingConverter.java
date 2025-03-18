package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private RentAreaConverter rentAreaConverter;
    @Autowired
    private UserRepository userRepository;

    public BuildingSearchResponse convertToBuildingSearchResponse(BuildingEntity buildingEntity) {
        BuildingSearchResponse building = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        String district = districtCode.getValueByDistrictCode(buildingEntity.getDistrict());
        building.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + district);
        String rentAreas = buildingEntity.getRentAreas().stream().map(i -> i.getValue().toString()).collect(Collectors.joining(", "));
        building.setRentArea(rentAreas);
        return building;
    }

    public BuildingEntity convertToBuildingEntity(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);

        List<String> typeCode = buildingDTO.getTypeCode();
        buildingEntity.setType(typeCode.stream().collect(Collectors.joining(",")));
        buildingEntity.setRentAreas(rentAreaConverter.convertToListRentAreaEntity(buildingDTO, buildingEntity));
        if (buildingDTO.getId() != null) { // update
            BuildingEntity foundBuilding = buildingRepository.findById(buildingDTO.getId()).get();
            buildingEntity.setImage(foundBuilding.getImage());

            List<UserEntity> userEntities = userRepository.findByBuildings_Id(buildingEntity.getId());
            buildingEntity.setStaffs(userEntities);
        }
        return buildingEntity;
    }

    public BuildingDTO convertToBuildingDTO(BuildingEntity buildingEntity) {
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);

        String rentAreas = buildingEntity.getRentAreas().stream().map(i -> i.getValue().toString()).collect(Collectors.joining(", "));
        buildingDTO.setRentArea(rentAreas);

        String[] listStringTypeCode = buildingEntity.getType().split(",");
        buildingDTO.setTypeCode(Arrays.asList(listStringTypeCode));
        return buildingDTO;
    }
}
