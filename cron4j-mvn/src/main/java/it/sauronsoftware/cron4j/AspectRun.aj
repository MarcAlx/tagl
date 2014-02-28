package it.sauronsoftware.cron4j;

public aspect AspectRun
{

	before() : execution (public void execute(TaskExecutionContext)) 
	{ 
		System.out.println("--Debut d'exécution du classe Runnable--");
	}

	after() : execution (public void execute(TaskExecutionContext)) 
	{ 
		System.out.println("--Fin d'exécution du classe Runnable--");
	}
}
