const Header = (props) => {
  return <h1>{props.course}</h1>
}
const Content = (props) => {
  return (
    <div>
      <Part part={props.part[0]} />
      <Part part={props.part[1]} />
      <Part part={props.part[2]} />
    </div>
  )
}
const Part = (props) => {
  return (
    <p>
      {props.part.part} {props.part.exercise}
    </p>
  )
}
const Total = (props) => {
  return (
    <p>
      Number of exercises{' '}
      {props.part[0].exercise + props.part[1].exercise + props.part[2].exercise}
    </p>
  )
}
const App = () => {
  const course = 'Half Stack application development'
  const parts = [
    { part: 'Fundamentals of React', exercise: 10 },
    { part: 'Using props to pass data', exercise: 7 },
    { part: 'State of a component', exercise: 14 },
  ]

  return (
    <div>
      <Header course={course} />
      <Content part={parts} />
      <Total part={parts} />
    </div>
  )
}

export default App
