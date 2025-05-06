export default function Home() {
  const books = [
    { title: "1984", author: "George Orwell" },
    { title: "Le Meilleur des Mondes", author: "Aldous Huxley" }
  ];

  return (
    <div>
      <h1>Catalogue de livres</h1>
      <ul>
        {books.map((book, i) => (
          <li key={i}>{book.title} - {book.author}</li>
        ))}
      </ul>
    </div>
  );
}