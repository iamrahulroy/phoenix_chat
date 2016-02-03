// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"

socket.connect();

// Now that you are connected, you can join channels with a topic:
var channel = socket.channel("rooms:lobby", {});
var chatInput = $("#chat-input");
var messagesContainer = $("#messages");

chatInput.on("keypress", function (event) {
  if (event.keyCode === 13) {
    channel.push("new_msg", { body: chatInput.val() });
    chatInput.val("");
  }
});

channel.on("new_msg", function (payload) {
  messagesContainer.append("<br/>[" + Date() + "] " + payload.body);
});

channel.join().receive("ok", function (resp) {
  console.log("Joined successfully", resp);
}).receive("error", function (resp) {
  console.log("Unable to join", resp);
});

export default socket
