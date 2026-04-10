/**
 * Button Component - intentionally has lint and test coverage issues
 */

interface ButtonProps {
  label: string
  onClick?: () => void
  disabled?: boolean
}

export function Button({ label, onClick, disabled }: ButtonProps) {
  // Missing semicolon - ESLint error
  const handleClick = () => {
    console.log('Button clicked')
    if (onClick) {
      onClick()
    }
  }

  return (
    <button
      onClick={handleClick}
      disabled={disabled}
      // Extra spaces - Prettier error
      className="px-4  py-2  bg-blue-500  text-white  rounded"
    >
      {label}
    </button>
  )
}

export function Counter() {
  // No test coverage for this function
  const increment = () => {
    return Math.random()
  }

  return (
    <div>
      <p>Counter: {increment()}</p>
    </div>
  )
}
