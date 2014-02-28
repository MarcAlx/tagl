package it.sauronsoftware;

import it.sauronsoftware.cron4j.Scheduler;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import java.util.Date;

public class AspectTest {

  @BeforeClass
  public static void testSetup() {
  }

  @AfterClass
  public static void testCleanup() {
    // Teardown for data used by the unit tests
  }

  @Test
  public void testAspect() 
  {
    MyTask2 task = new MyTask2();
    // Creates the scheduler.
    Scheduler scheduler = new Scheduler();
    // Schedules the task, once every minute.
    scheduler.schedule("* * * * *", task);
    // Starts the scheduler.
    scheduler.start();
    // Stays alive for five minutes.
    try {
      Thread.sleep(2L * 60L * 1000L);
    } catch (InterruptedException e) {
      ;
    }
    // Stops the scheduler.
    scheduler.stop();
  }

  public class MyTask2 implements Runnable {

    public void run() {
      System.out.println("Current system time: " + new Date());
      System.out.println("Another minute ticked away...");
    }

  }
}