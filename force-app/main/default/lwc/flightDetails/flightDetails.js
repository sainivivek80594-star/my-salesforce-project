import { LightningElement, api } from 'lwc';

export default class FlightDetails extends LightningElement {
    flightData = [];

    _value;

    @api
    get value() {
        return this._value;
    }

    set value(value) {
        this._value = value;
    }

    connectedCallback() {
        if (this.value && Array.isArray(this.value.flights)) {
            this.flightData = this.value.flights.map((flight) => {
                return {
                    ...flight,
                    arrivalInHr: this.arrivalTime(flight.departureTime, flight.durationInMin),
                    petAllowedStatus: flight.isPetAllowed ? 'Yes' : 'No',
                    durationInHr: this.formattedDuration(flight.durationInMin)
                };
            });
        }
    }

    formattedDuration(durationInMin) {
        if (!durationInMin) return '';
        const hours = Math.floor(durationInMin / 60);
        const minutes = durationInMin % 60;
        return `${hours} hr ${minutes} min`;
    }

    arrivalTime(departureTime, durationInMin) {
        if (!departureTime || !durationInMin) return '';
        const [hours, minutes] = departureTime.split(':').map(Number);
        const departureDate = new Date(2025, 0, 1, hours, minutes);
        const arrivalDate = new Date(departureDate.getTime() + durationInMin * 60000);
        const arrivalHours = String(arrivalDate.getHours()).padStart(2, '0');
        const arrivalMinutes = String(arrivalDate.getMinutes()).padStart(2, '0');
        return `${arrivalHours}:${arrivalMinutes}`;
    }

    handleBookFlight(event) {
        const flightId = event.currentTarget.dataset.flightId;
        const bookEvent = new CustomEvent('bookflight', {
            detail: { flightId }
        });
        this.dispatchEvent(bookEvent);
    }
}