/**
 * CalendarEvent Model - Enkapsulasi data jadwal, agenda eksekutif, dan sinkronisasi pilar
 */
export class CalendarEvent {
  constructor({
    id,
    title,
    description = '',
    pillar = 'main',
    date = '',
    dayName = '',
    time = '',
    pic = 'Admin',
    location = '',
    status = 'menunggu', // 'selesai' | 'live' | 'menunggu' | 'rescheduled'
    badge = 'Jadwal',
    taskRef = '',
    isHero = false,
    resolution = '',
    passRate = ''
  }) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.pillar = pillar;
    this.date = date;
    this.dayName = dayName;
    this.time = time;
    this.pic = pic;
    this.location = location;
    this.status = status;
    this.badge = badge;
    this.taskRef = taskRef;
    this.isHero = isHero;
    this.resolution = resolution;
    this.passRate = passRate;
  }
}
