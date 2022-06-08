import TwilioVideoController from 'stimulus-twilio-video'

import { connect, createLocalVideoTrack, LocalVideoTrack } from 'twilio-video'

export default class extends TwilioVideoController {
  static targets = ['noCall', 'awaitingBuddy', 'joinCallButton', 'endCallButton', 'screenShareButton', 'endScreenShareButton', 'callView']

  initialize() {
    console.log("hello Geza")
    const observer = new MutationObserver((mutations) => { // callback
      if (mutations[0].addedNodes[0].tagName === "VIDEO") {
        const videoTags = this.buddyVideoTarget.querySelectorAll("video")
        // this.callViewTarget.classList.add("call-video-views-incall")
        if (videoTags.length === 2) {
          videoTags[0].remove()
        }
      }
    });
    observer.observe(this.buddyVideoTarget, {childList: true, subtree: true})
  }

  shareScreenHandler() {
    let screenTrack

    event.preventDefault();

    if (!screenTrack) {
        navigator.mediaDevices.getDisplayMedia()
        .then( stream => {
          screenTrack = LocalVideoTrack(stream.getTracks()[0]);
          console.log(this.room.localParticipant);
            this.room.localParticipant.publishTrack(screenTrack.mediaStreamTrack)
            .then((track) => {
              console.log(track)
            });
            this.screenShareButtonTarget.classList.add("d-none")
            screenTrack.mediaStreamTrack.onended = () => { shareScreenHandler() };
        });

    }
    else {
        this.room.localParticipant.unpublishTrack(screenTrack.mediaStreamTrack);
        screenTrack.stop();
        screenTrack = null;
    }
  };

  callStarted() {
    this.noCallTarget.classList.add('d-none')
    this.awaitingBuddyTarget.classList.remove('d-none')
    this.joinCallButtonTarget.classList.add('d-none')
    this.endCallButtonTarget.classList.remove('d-none')
  }

  callEnded() {
    console.log('Call ended!')
    this.noCallTarget.classList.remove('d-none')
    this.awaitingBuddyTarget.classList.add('d-none')
    this.joinCallButtonTarget.classList.remove('d-none')
    this.endCallButtonTarget.classList.add('d-none')
  }

  buddyJoined() {
    console.log('Buddy has joined')
    this.awaitingBuddyTarget.classList.add('d-none')
  }

  buddyLeft() {
    console.log('Buddy has left')
  }

};
