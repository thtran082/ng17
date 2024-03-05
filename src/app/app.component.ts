import { Component, inject } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
  providers: [DatePipe],
})
export class AppComponent {
  title = 'ng17';
  date: any = '';

  #datePipe = inject(DatePipe);

  ngAfterViewInit() {
    this.date = this.#datePipe.transform(new Date(), "hh:mm:ss");
  }
}
