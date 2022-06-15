package shop.seulmeal.config;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.junit.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Aspect
@Component
public class AspectConfig {

    private static final Logger LOGGER = LoggerFactory.getLogger(AspectConfig.class);

    /**
     *   @GetMapping 설정된 메소드 또는 클래스 설정
     *   GetMapping 노테이션이 설정된 특정 클래스/메소드에만 AspectJ가 적용됨.
     */
    @Pointcut("execution(* shop.seulmeal.web..*.*(..))")
    //@Pointcut("@annotation(org.springframework.web.bind.annotation.GetMapping)")
    public void joinCut(){ }

    /**
     * @param joinPoint
     */
    @Before("joinCut()")
    public void before(JoinPoint joinPoint) {
        LOGGER.info("=====================AspectJ  : Before Logging Start=====================");
        LOGGER.info("=====================AspectJ  : Before Logging End=====================");
    }

    /**
     * @param joinPoint
     * @param result
     */
    @AfterReturning(pointcut = "joinCut()", returning = "result")
    public void AfterReturning(JoinPoint joinPoint, Object result) {
        LOGGER.info("=====================AspectJ  : AfterReturning Logging Start=====================");
        LOGGER.info("=====================AspectJ  : AfterReturning Logging END=====================");
    }
    
    @AfterThrowing(pointcut = "joinCut()", throwing ="ex")
    public void AfterThrowing(JoinPoint joinPoint, Throwable ex) {
    	System.out.println("============ 타겟메소드 예외 설정 : "
    	        + joinPoint.getSignature().toShortString()+"========================================");
    }

    /**
     *
     * @param joinPoint
     * @return
     * @throws Throwable
     */
    @Around("joinCut()")
    public Object Around(ProceedingJoinPoint joinPoint) throws Throwable {
        LOGGER.info("=====================AspectJ  : Around Logging Start=====================");
        StopWatch sw = new StopWatch();
        sw.start();
        
        
        try {
            Object result = joinPoint.proceed();
            sw.stop();
            
            LOGGER.info("성능 측정이 끝났습니다.");
            LOGGER.info("걸린시간: {} ms", sw.getLastTaskTimeMillis());
            
            return result;
        }catch (Exception e) {
            LOGGER.error("=====================AspectJ Around Exception=====================");
            LOGGER.error(e.toString());
            return null;
        }
    }

}