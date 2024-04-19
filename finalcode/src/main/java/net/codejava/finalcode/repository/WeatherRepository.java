package net.codejava.finalcode.repository;


import net.codejava.finalcode.entity.WeatherEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WeatherRepository extends JpaRepository<WeatherEntity, Long>{

}