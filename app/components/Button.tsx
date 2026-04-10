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
  return (
    <div>
      <p>Counter: 1</p>
    </div>
  )
}
