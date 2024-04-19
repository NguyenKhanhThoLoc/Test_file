package com.fpt.mainproject.weathercontroller;

import com.fpt.mainproject.service.WeatherService;
import com.fpt.mainproject.entity.WeatherEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/weather")
public class WeatherController {

    private final WeatherService weatherService;

    public WeatherController(WeatherService weatherService) {
        this.weatherService = weatherService;
    }

    @GetMapping("")
    public WeatherEntity getCurrentWeatherAndSave() {
        return weatherService.getCurrentWeatherAndSaveToDatabase();
    }

}