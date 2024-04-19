package net.codejava.finalcode;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import java.io.IOException;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig {

	@Autowired
	private CustomOAuth2UserService oauthUserService;

	@Autowired
	private UserService userService;

	@Autowired
	private UserDetailsService userDetailsService;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public AuthenticationSuccessHandler authenticationSuccessHandler() {
		return (request, response, authentication) -> {
			// Xử lý sau khi xác thực thành công
			System.out.println("AuthenticationSuccessHandler invoked");
			System.out.println("Authentication name: " + authentication.getName());
			CustomOAuth2User oauthUser = (CustomOAuth2User) authentication.getPrincipal();

			userService.processOAuthPostLogin(oauthUser.getEmail());

			response.sendRedirect("/list");
		};
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/", "/login", "/oauth/**").permitAll()
				.anyRequest().authenticated()
				.and()
				.formLogin().permitAll()
				.loginPage("/login")
				.usernameParameter("email")
				.passwordParameter("pass")
				.defaultSuccessUrl("/list")
				.and()
				.oauth2Login()
				.loginPage("/login")
				.userInfoEndpoint()
				.userService(oauthUserService)
				.and()
				.successHandler(authenticationSuccessHandler())
				.and()
				.logout().logoutSuccessUrl("/").permitAll()
				.and()
				.exceptionHandling().accessDeniedPage("/403");

		return http.build();
	}

	@Bean
	public AuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
		authProvider.setUserDetailsService(userDetailsService);
		authProvider.setPasswordEncoder(passwordEncoder());

		return authProvider;
	}
}

