package net.codejava.finalcode.weatherapi;

import net.codejava.finalcode.entity.WeatherEntity;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "weather-api", url = "https://api.weatherapi.com")
public interface WeatherAPI {

    @GetMapping("/v1/current.json")
    WeatherEntity getCurrentWeather(@RequestParam("key") String apiKey, @RequestParam("q") String location, @RequestParam("api") String api);
}
