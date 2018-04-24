package com.dgit.mall.controller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ControllerUsingURI extends HttpServlet {
	private Map<String, CommandHandler> commandHandlerMap;

	@Override
	public void init() throws ServletException {
		commandHandlerMap = new HashMap<>();

		String configFile = getInitParameter("configFile");
		String configFilePath = getServletContext().getRealPath(configFile);

		Properties prop = new Properties();
		try (FileReader fr = new FileReader(configFilePath);) {
			prop.load(fr);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Iterator<Object> keyIter = prop.keySet().iterator();
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();
			String handlerClassName = prop.getProperty(command);

			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
				commandHandlerMap.put(command, handlerInstance);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ControllerUsingURI, GET");
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ControllerUsingURI, POST");
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getRequestURI();
		if (command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length());
		}
		
		System.out.println("ControllerUsingURI, command =" + command);

		CommandHandler handler = commandHandlerMap.get(command);
		if (handler == null) {
			handler = new NullHandler();
		}

		String viewPage = null;
		try {
			System.out.println("ControllerUsingURI, handler =" + handler);
			viewPage = handler.process(request, response);
		} catch (Throwable e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
