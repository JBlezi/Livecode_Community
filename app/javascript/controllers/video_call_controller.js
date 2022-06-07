import TwilioVideoController from 'stimulus-twilio-video'

import { connect, createLocalVideoTrack, LocalVideoTrack } from 'twilio-video'

export default class extends TwilioVideoController {
  static targets = ['noCall', 'awaitingBuddy', 'joinCallButton', 'endCallButton', 'screenShareButton', 'endScreenShareButton', 'screenSharing']



  shareScreenHandler() {
    let screenTrack

    console.log('click on share screen')

    event.preventDefault();

    if (!screenTrack) {
        navigator.mediaDevices.getDisplayMedia()
        .then( stream => {
          screenTrack = LocalVideoTrack(stream.getTracks()[0]);
            this.room.localParticipant.publishTrack(screenTrack.mediaStreamTrack);
            this.innerHTML = 'Stop sharing';
            screenTrack.mediaStreamTrack.onended = () => { shareScreenHandler() };
        });
        // .catch(() => {
        //     alert('Could not share the screen.');
        // });
    }
    else {
        this.room.localParticipant.unpublishTrack(screenTrack.mediaStreamTrack);
        screenTrack.stop();
        screenTrack = null;
        this.innerHTML = 'Share screen';
    }
  };
};

// callStarted() {
  //   this.noCallTarget.classList.add('d-none')
  //   this.awaitingBuddyTarget.classList.remove('d-none')
  //   this.joinCallButtonTarget.classList.add('d-none')
  //   this.endCallButtonTarget.classList.remove('d-none')
  // }

  // callEnded() {
  //   console.log('Call ended!')
  //   this.noCallTarget.classList.remove('d-none')
  //   this.awaitingBuddyTarget.classList.add('d-none')
  //   this.joinCallButtonTarget.classList.remove('d-none')
  //   this.endCallButtonTarget.classList.add('d-none')
  // }

  // buddyJoined() {
  //   console.log('Buddy has joined')
  //   this.awaitingBuddyTarget.classList.add('d-none')
  // }

  // buddyLeft() {
  //   console.log('Buddy has left')
  // }
