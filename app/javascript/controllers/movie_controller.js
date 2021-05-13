import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'selectedMovie' ];

  connect() {};

  select(event) {
    console.log(event);
  }
}
