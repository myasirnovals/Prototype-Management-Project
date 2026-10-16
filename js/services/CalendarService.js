import { CalendarEvent } from '../models/CalendarEvent.js';

/**
 * CalendarService - Single Responsibility Principle (SRP)
 * Manages calendar events, granularity views (Month, Week, Day, Agenda), and rescheduling logic.
 */
export class CalendarService {
  /**
   * @param {EventBus} eventBus
   * @param {NotificationService} notificationService
   */
  constructor(eventBus, notificationService) {
    this.eventBus = eventBus;
    this.notifications = notificationService;
    this.events = [];
    this.activeFilterPillar = 'all'; // 'all' | 'ruangkreasi' | 'layarbaca' | etc.
    this.currentViewMode = 'agenda'; // 'month' | 'week' | 'day' | 'agenda'
    this.initDefaultEvents();
  }

  initDefaultEvents() {
    this.events = [];
  }

  getEvents(pillarFilter = null) {
    const filter = pillarFilter || this.activeFilterPillar;
    if (!filter || filter === 'all') {
      return this.events;
    }
    return this.events.filter(e => e.pillar.toLowerCase() === filter.toLowerCase());
  }

  setFilterPillar(pillar) {
    this.activeFilterPillar = pillar;
    this.eventBus.emit('calendar:filter-changed', pillar);
  }

  setViewMode(mode) {
    this.currentViewMode = mode;
    this.eventBus.emit('calendar:view-mode-changed', mode);
  }

  /**
   * Reschedule an existing event
   * @param {string} eventId
   * @param {string} newDate
   * @param {string} newTime
   * @param {string} reason
   */
  rescheduleEvent(eventId, newDate, newTime, reason) {
    const event = this.events.find(e => e.id === eventId);
    if (event) {
      event.date = newDate;
      event.time = newTime;
      event.status = 'rescheduled';
      event.description += ` (Dijadwalkan ulang: ${reason})`;
      this.eventBus.emit('calendar:updated', this.events);
      this.notifications.success(`Jadwal "${event.title}" berhasil diperbarui ke ${newDate}, ${newTime}.`);
      return true;
    }
    return false;
  }

  /**
   * Add a new calendar event
   * @param {Object} eventData
   * @returns {CalendarEvent}
   */
  addEvent(eventData) {
    const newEvent = new CalendarEvent({
      id: 'evt-' + Date.now(),
      title: eventData.title || 'Deliverable Baru',
      description: eventData.description || '',
      pillar: eventData.pillar || 'ruangkreasi',
      date: eventData.date || '2026-09-11',
      dayName: eventData.dayName || 'Jumat',
      time: eventData.time || '09:00 - 17:00 WIB',
      pic: eventData.pic || 'Tim Terkait',
      location: 'Workspace Central',
      status: eventData.status || 'in-progress',
      badge: eventData.badge || 'Tugas Baru',
      taskRef: eventData.taskRef || ''
    });
    this.events.unshift(newEvent);
    this.eventBus.emit('calendar:updated', this.events);
    return newEvent;
  }

  /**
   * Get workload stats by member
   */
  getWorkloadStats() {
    return [];
  }
}
