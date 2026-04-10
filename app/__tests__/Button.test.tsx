import React from 'react'
import { render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { Button } from '../components/Button'

describe('Button Component', () => {
  it('should render button with label', () => {
    render(<Button label="Click me" />)
    const button = screen.getByRole('button', { name: /click me/i })
    expect(button).toBeInTheDocument()
  })

  it('should call onClick handler when clicked', async () => {
    const handleClick = jest.fn()
    render(<Button label="Test Button" onClick={handleClick} />)
    
    const button = screen.getByRole('button', { name: /test button/i })
    await userEvent.click(button)
    
    expect(handleClick).toHaveBeenCalled()
  })

  // Intentional failing test - wrong assertion
  it('should disable button when disabled prop is true', () => {
    render(<Button label="Disabled" disabled={true} />)
    const button = screen.getByRole('button', { name: /disabled/i })
    // This will fail - button should be disabled but assertion is wrong
    expect(button).not.toBeDisabled()
  })
})
