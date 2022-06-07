import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


// Connects to data-controller="navbar-subscription"
export default class extends Controller {
  static values = { userId: Number }
  static targets = ["dot"]
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel" },
      { received: data => this.handleNotification(data) }
    )
    console.log(this.dotTarget)
    console.log(this.userIdValue)
  }

  handleNotification(data) {
    if(data != this.userIdValue && !window.location.pathname.match(/chats\/\d*/)) {
      this.dotTarget.innerText="."
    }
  }

  hideDot(){
    this.dotTarget.remove()
  }
}
