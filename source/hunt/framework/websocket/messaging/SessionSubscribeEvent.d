/*
 * Copyright 2002-2017 the original author or authors.
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

module hunt.framework.websocket.messaging.SessionSubscribeEvent;

import hunt.framework.websocket.messaging.AbstractSubProtocolEvent;

import hunt.security.Principal;
import hunt.framework.messaging.Message;

/**
 * Event raised when a new WebSocket client using a Simple Messaging Protocol
 * (e.g. STOMP) sends a subscription request.
 *
 * @author Rossen Stoyanchev
 * @since 4.0.3
 */

class SessionSubscribeEvent : AbstractSubProtocolEvent {

	this(Object source, Message!(byte[]) message) {
		super(source, message);
	}

	this(Object source, Message!(byte[]) message, Principal user) {
		super(source, message, user);
	}

}
