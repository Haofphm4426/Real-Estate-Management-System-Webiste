package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.repository.RentAreaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class RentAreaConverter {
    @Autowired
    RentAreaRepository rentAreaRepository;

    public List<Long> convertToList(String rentAreaString) {
        List<Long> rentAreas = new ArrayList<>();
        if(rentAreaString.contains(",")) {
            String[] listStringRentArea = rentAreaString.split(",");
            rentAreas = Arrays.stream(listStringRentArea).map(i -> Long.parseLong(i.trim())).collect(Collectors.toList());
        } else {
            rentAreas.add(Long.parseLong(rentAreaString.trim()));
        }
        return rentAreas;
    }

    public List<RentAreaEntity>  convertToListRentAreaEntity (BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        List<Long> rentAreas = convertToList(buildingDTO.getRentArea());
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();

        for(Long item : rentAreas) {
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setValue(item);
            rentAreaEntity.setBuilding(buildingEntity);
            rentAreaEntities.add(rentAreaEntity);
        }
        return rentAreaEntities;
    }

}
