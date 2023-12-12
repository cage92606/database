import React, { useState } from 'react';

export default function Search ({ findKirks }) {
  const [keyword, setKeyword] = useState('');

  const handleChange = event => {
    setKeyword(event.target.value);
    // findKirks(event.target.value);
    setTimeout(() => findKirks(event.target.value), 500);
  };

  const clearSearch = () => {
    setKeyword('');
    findKirks('');
  };

  return (
    <div style={{ position: 'relative', display: 'inline-block' }}>
      {/* <input
        type='text'
        id='keyword'
        name='keyword'
        value={keyword}
        onChange={handleChange}
        placeholder='Search...'
        size='13'
        style={{ paddingRight: '30px' }} // Adjust padding to make room for the button
      /> */}
      <input
        className='search-input' // Add this line
        type='text'
        id='keyword'
        name='keyword'
        value={keyword}
        onChange={handleChange}
        placeholder='Search...'
        style={{ paddingRight: '30px' }} // Adjust padding to make room for the button
      />
      {keyword && (
        <button
          type='button'
          onClick={clearSearch} // Clear the input box
          style={{
            position: 'absolute',
            top: '50%',
            right: '5px', // Adjust this value to move the button inside the box
            transform: 'translateY(-50%)',
            backgroundColor: 'transparent',
            border: 'none',
            color: '#ccc'
          }}
        >
          X
        </button>
      )}
    </div>
  );
}
