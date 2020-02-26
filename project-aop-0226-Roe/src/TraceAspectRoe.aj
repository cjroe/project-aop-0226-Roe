
public aspect TraceAspectRoe {

	pointcut classToTrace(): within(*App);
	
	pointcut methodToTrace(): classToTrace() && execution(String *App.get*());
	
	
	before(): methodToTrace(){
		String info = thisJoinPointStaticPart.getSignature() + ", Line: " +
						thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println(info);
	}
	after(): methodToTrace(){
		String info = thisJoinPointStaticPart.getSourceLocation().getFileName();
		System.out.println(info);
	}
}
