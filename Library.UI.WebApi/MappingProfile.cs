
using AutoMapper;
using Library.Dto;
using Library.Entities;

namespace Library.UI.WebApi
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Edition, EditionDto>();
            CreateMap<EditionDto, Edition>();

            CreateMap<Author, AuthorDto>();
            CreateMap<AuthorDto, Author>();

            CreateMap<Book, BookDto>();
            CreateMap<BookDto, Book>();

            CreateMap<NewsPaper, NewsPaperDto>();
            CreateMap<NewsPaperDto, NewsPaper>();

            CreateMap<Patent, PatentDto>();
            CreateMap<PatentDto, Patent>();
        }
    }
}
