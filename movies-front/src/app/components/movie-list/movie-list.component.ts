import { Component, OnInit } from '@angular/core';

import { MoviesService } from '../../services/movies.service'
 
@Component({
  selector: 'app-movie-list',
  templateUrl: './movie-list.component.html',
  styleUrls: ['./movie-list.component.css']
})
export class MovieListComponent implements OnInit {

  movies: any = []

  constructor(private moviesService: MoviesService) { }

  ngOnInit(): void {
    this.moviesService.getMovies().subscribe(
      res => {
        this.movies = res
      },
      err => console.error(err)
    )
  }

}
