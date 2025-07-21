package com.streaming;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CameraStreamingApplication extends SpringBootServletInitializer {

 @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(CameraStreamingApplication.class);
    }


	public static void main(String[] args) {
		SpringApplication.run(CameraStreamingApplication.class, args);
	}
}
