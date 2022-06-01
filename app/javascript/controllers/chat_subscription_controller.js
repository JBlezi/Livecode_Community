import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chat-subscription"
export default class extends Controller {
  static values = { chatId: Number }
  static targets = ["messages"]
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatChannel", id: this.chatIdValue },
      { received: data => this.#insertMessageAndScrollDown(data)}
    )
    console.log(`Subscribe to the chatroom with the id ${this.chatIdValue}.`)
    console.log(this.messagesTarget)
  }
  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
  resetForm(event) {
    event.target.reset()
  }
}
