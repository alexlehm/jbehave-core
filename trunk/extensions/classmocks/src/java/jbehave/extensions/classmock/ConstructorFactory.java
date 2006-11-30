package jbehave.extensions.classmock;

import java.lang.reflect.Modifier;

public class ConstructorFactory {

	static Object construct(Class clazz) throws InstantiationException, IllegalAccessException {
		Object result = null;
		if (clazz.isPrimitive()) {
			result = constructPrimitive(clazz);
		} else if (clazz.isArray()) {
			result = new Object[] {};
		} else if (Modifier.isFinal(clazz.getModifiers())) {
			result = clazz.newInstance();
		} else if (clazz.isInterface()) {
			result = new UsingClassMock().mock(clazz);
		} else if (clazz.getConstructors().length == 0) {
			result = null; // and hope they're not using it
		} else {
			result = new UsingClassMock().mock(clazz);
		}
		return result;
	}

	private static Object constructPrimitive(Class clazz) {
		if (clazz == byte.class) {
			return new Byte((byte) 0);
		} else if (clazz == boolean.class) {
			return Boolean.FALSE;
		} else if (clazz == char.class) {
			return new Character(' ');
		} else if (clazz == double.class) {
			return new Double(0);
		} else if (clazz == float.class) {
			return new Float(0);
		} else if (clazz == int.class) {
			return new Integer(0);
		} else if (clazz == long.class) {
			return new Long(0L);
		} else if (clazz == short.class) {
			return new Short((short) 0);
		} else {
			throw new IllegalArgumentException("Never heard of a primitive called " + clazz + " before. ");
		}
	}

}
