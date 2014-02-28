package it.sauronsoftware.cron4j;

public aspect AspectRun
{

	before() : execution (public void execute(TaskExecutionContext)) 
	{ 
		System.out.println("--Debut d'exécution de RunnableTask.execute--");
		incremente();
		printValue();
	}

	after() : execution (public void execute(TaskExecutionContext)) 
	{ 
		System.out.println("--Fin d'exécution de RunnableTask.execute--");
	}

	private static final ThreadLocal<Integer> NBInstanceThread = new ThreadLocal<Integer>()
	{
        @Override
        protected Integer initialValue()
        {
            return new Integer(0);
        }
	};

	/**
	* Incrémente le threadlocal
	*/
	protected static void incremente()
    {
    	NBInstanceThread.set(NBInstanceThread.get()+1);
    }

    /**
    * Affiche la valeur actuelle du threadlocal
    */
    protected static void printValue()
    {
       	System.out.println("--Valeur actuelle du threadlocal: "+NBInstanceThread.get()+" --");
    }
}
