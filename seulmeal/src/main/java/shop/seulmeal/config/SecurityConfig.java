package shop.seulmeal.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import shop.seulmeal.common.CustomAuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired()
	@Qualifier("userServiceImpl")
	private UserDetailsService userService;
		
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		auth.userDetailsService(userService).passwordEncoder(new BCryptPasswordEncoder());
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		// TODO Auto-generated method stub
		web.ignoring().antMatchers("/resources/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		http
		.authorizeRequests()
			.antMatchers("/","/product/**","/operation/**").permitAll()
			.antMatchers("/admin/**").hasAuthority("1")
			.antMatchers("/community/**").hasAnyAuthority("0","1")
		.and()
			.formLogin()
			.usernameParameter("userId")
			.passwordParameter("password")
			.loginPage("/user/login")
			.failureUrl("/user/login?error")
			.successHandler(successHandler())
			.defaultSuccessUrl("/",false)
		.and()
			.logout()
			.logoutRequestMatcher(new AntPathRequestMatcher("/user/logout"))
			.deleteCookies("JSESSIONID","loginCookie")
			.logoutSuccessUrl("/")		
		.and()
			.sessionManagement()
			.maximumSessions(1)
			.maxSessionsPreventsLogin(true);
			
		
		http
		.csrf().disable();
		
	}
	
	@Bean
	public AuthenticationSuccessHandler successHandler() {
		
		return new CustomAuthenticationSuccessHandler("/");
	}
}
