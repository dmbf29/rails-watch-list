import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'selected' ];

  connect() {
    console.log(this.selectedTarget);
  };

  select(event) {
    this.selectedTarget.innerHTML = event.currentTarget.dataset.template
  }
}
