import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chat-subscription"
export default class extends Controller {
  static values = { chatId: Number, userId: Number }
  static targets = ["messages", "form"]
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatChannel", id: this.chatIdValue },
      { received: data => this.#insertMessageAndScrollDown(data)}
    )
    console.log(this.enterTarget)
    console.log(this.userIdValue)
  }



  #insertMessageAndScrollDown(data) {
    let doc = new DOMParser().parseFromString(data, 'text/html');
    let div = doc.body.firstChild;
    console.log(div)
    console.log(div.dataset.user)
    if(div.dataset.user != this.userIdValue){
      div.classList.remove('message-individual')
    }
    // this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.appendChild(div)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
  resetForm(event) {
    event.target.reset()
  }
}
