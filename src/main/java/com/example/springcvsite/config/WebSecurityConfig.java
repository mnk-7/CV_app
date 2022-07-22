package com.example.springcvsite.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    protected PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("user").password(passwordEncoder().encode("user")).roles("USER")
                .and()
                .withUser("admin").password(passwordEncoder().encode("admin")).roles("ADMIN")
                .and()
                .withUser("developer").password(passwordEncoder().encode("developer")).roles("DEVELOPER");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers(
                        "/profiles",
                        "/home/{id:\\d+}",
                        "/about/{id:\\d+}",
                        "/skills/{id:\\d+}",
                        "/resume/{id:\\d+}",
                        "/contact/{id:\\d+}")
                .hasAnyRole("USER", "ADMIN", "DEVELOPER")
                .antMatchers(
                        "/profiles/edit/person/1/**",
                        "/home/1/edit/**",
                        "/about/1/edit/**",
                        "/skills/1/edit/**",
                        "/resume/1/edit/**",
                        "/contact/1/edit/**")
                .hasRole("DEVELOPER")
                .antMatchers(
                        "/profiles/edit/**",
                        "/home/**",
                        "/about/**",
                        "/skills/**",
                        "/resume/**",
                        "/contact/**")
                .hasAnyRole("ADMIN", "DEVELOPER")
                .and()
                .csrf().disable()
                .headers().frameOptions().disable()
                .and()
                .formLogin()
                .loginPage("/")
                .usernameParameter("username")
                .passwordParameter("password")
                .loginProcessingUrl("/")
                .failureForwardUrl("/")
                .defaultSuccessUrl("/profiles")
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/");
    }

}