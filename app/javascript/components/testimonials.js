import Flickity from 'flickity';
import 'flickity/dist/flickity.min.css';

function initTestimonials() {
var flkty = new Flickity( '.main-gallery', {
  cellAlign: 'left',
  contain: true,
  wrapAround: true,
  prevNextButtons: false,
  autoPlay: 5000
});
}
export { initTestimonials };
