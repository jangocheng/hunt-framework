/*
 * Copyright 2002-2015 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module hunt.framework.messaging.simp.stomp;

import java.lang.reflect.Type;



/**
 * Abstract adapter class for {@link StompSessionHandler} with mostly empty
 * implementation methods except for {@link #getPayloadType} which returns string
 * as the default Object type expected for STOMP ERROR frame payloads.
 *
 * @author Rossen Stoyanchev
 * @since 4.2
 */
abstract class StompSessionHandlerAdapter implements StompSessionHandler {

	/**
	 * This implementation returns string as the expected payload type
	 * for STOMP ERROR frames.
	 */
	override
	public Type getPayloadType(StompHeaders headers) {
		return string.class;
	}

	/**
	 * This implementation is empty.
	 */
	override
	public void handleFrame(StompHeaders headers, Object payload) {
	}

	/**
	 * This implementation is empty.
	 */
	override
	public void afterConnected(StompSession session, StompHeaders connectedHeaders) {
	}

	/**
	 * This implementation is empty.
	 */
	override
	public void handleException(StompSession session, StompCommand command,
			StompHeaders headers, byte[] payload, Throwable exception) {
	}

	/**
	 * This implementation is empty.
	 */
	override
	public void handleTransportError(StompSession session, Throwable exception) {
	}

}