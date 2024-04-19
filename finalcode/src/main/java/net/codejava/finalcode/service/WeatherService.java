package net.codejava.finalcode.service;



import net.codejava.finalcode.entity.WeatherEntity;
import net.codejava.finalcode.repository.WeatherRepository;
import net.codejava.finalcode.weatherapi.WeatherAPI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WeatherService {
    @Autowired
    private final WeatherAPI weatherApiClient;
    @Autowired
    private final WeatherRepository weatherRepository;

    public WeatherService(WeatherAPI weatherApiClient, WeatherRepository weatherRepository) {
        this.weatherApiClient = weatherApiClient;
        this.weatherRepository = weatherRepository;
    }

    public WeatherEntity getCurrentWeatherAndSaveToDatabase() {
        WeatherEntity weatherEntity = weatherApiClient.getCurrentWeather("80350f1b0831443c8f991233231007", "London", "no");
        weatherRepository.save(weatherEntity);
        return weatherEntity;
    }
}