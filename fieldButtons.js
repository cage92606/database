import * as ActionTypes from './ActionTypes';

export const InitialFieldButtons = {
  isInputIdAscending: false,
  isInputDateAscending: true,
  isInputPlaceAscending: false,
  isInputPersonAscending: false,
  isInputSubjectAscending: false,
  isInputReasonAscending: false,
  isInputConditionAscending: false,
  isInputDataAscending: false,
  isInputUnitAscending: false,
  toggledInputFieldButton: 'ID',
  isProInputIdAscending: false,
  isProInputDateAscending: true,
  isProInputPlaceAscending: false,
  isProInputPersonAscending: false,
  isProInputSubjectAscending: false,
  isProInputReasonAscending: false,
  isProInputCondition1Ascending: false,
  isProInputCondition2Ascending: false,
  isProInputCondition3Ascending: false,
  isProInputCondition4Ascending: false,
  isProInputCondition5Ascending: false,
  isProInputCondition6Ascending: false,
  isProInputCondition7Ascending: false,
  isProInputCondition8Ascending: false,
  isProInputCondition9Ascending: false,
  isProInputCondition10Ascending: false,
  isProInputCondition11Ascending: false,
  isProInputCondition12Ascending: false,
  isProInputCondition13Ascending: false,
  isProInputCondition14Ascending: false,
  isProInputCondition15Ascending: false,
  isProInputCondition16Ascending: false,
  isProInputCondition17Ascending: false,
  isProInputCondition18Ascending: false,
  isProInputCondition19Ascending: false,
  isProInputCondition20Ascending: false,
  isProInputDataAscending: false,
  isProInputUnitAscending: false,
  toggledProInputFieldButton: 'ID',
  isFullContentShown: true,
  itemColors: {}
};

export const FieldButtons = (state = InitialFieldButtons, action) => {
  console.log('Inputs reducer called with action:', action);
  switch (action.type) {
    case 'TOGGLE_IS_INPUT_ID_ASCENDING':
      return {
        ...state,
        toggledInputFieldButton: 'ID',
        isInputIdAscending: !state.isInputIdAscending
      };
    case 'TOGGLE_IS_INPUT_DATE_ASCENDING':
      return {
        ...state,
        toggledInputFieldButton: 'DATE',
        isInputDateAscending: !state.isInputDateAscending
      };
    case 'TOGGLE_IS_INPUT_PLACE_ASCENDING':
      return {
        ...state,
        toggledInputFieldButton: 'PLACE',
        isInputPlaceAscending: !state.isInputPlaceAscending
      };
    case 'TOGGLE_IS_INPUT_PERSON_ASCENDING':
      return {
        ...state,
        toggledInputFieldButton: 'PERSON',
        isInputPersonAscending: !state.isInputPersonAscending
      };
    case 'TOGGLE_IS_INPUT_SUBJECT_ASCENDING':
      return {
        ...state,
        toggledInputFieldButton: 'SUBJECT',
        isInputSubjectAscending: !state.isInputSubjectAscending
      };
    case 'TOGGLE_IS_INPUT_REASON_ASCENDING':
      return {
        ...state,
        toggledInputFieldButton: 'REASON',
        isInputReasonAscending: !state.isInputReasonAscending
      };
    case 'TOGGLE_IS_INPUT_CONDITION_ASCENDING':
      return {
        ...state,
        toggledInputFieldButton: 'CONDITION',
        isInputConditionAscending: !state.isInputConditionAscending
      };
    case 'TOGGLE_IS_INPUT_DATA_ASCENDING':
      return {
        ...state,
        toggledInputFieldButton: 'DATA',
        isInputDataAscending: !state.isInputDataAscending
      };
    case 'TOGGLE_IS_INPUT_UNIT_ASCENDING':
      return {
        ...state,
        toggledInputFieldButton: 'UNIT',
        isInputUnitAscending: !state.isInputUnitAscending
      };
    case 'TOGGLE_IS_PRO_INPUT_ID_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'ID',
        isProInputIdAscending: !state.isProInputIdAscending
      };
    case 'TOGGLE_IS_PRO_INPUT_DATE_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'DATE',
        isProInputDateAscending: !state.isProInputDateAscending
      };
    case 'TOGGLE_IS_PRO_INPUT_PLACE_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'PLACE',
        isProInputPlaceAscending: !state.isProInputPlaceAscending
      };
    case 'TOGGLE_IS_PRO_INPUT_PERSON_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'PERSON',
        isProInputPersonAscending: !state.isProInputPersonAscending
      };
    case 'TOGGLE_IS_PRO_INPUT_SUBJECT_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'SUBJECT',
        isProInputSubjectAscending: !state.isProInputSubjectAscending
      };
    case 'TOGGLE_IS_PRO_INPUT_REASON_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'REASON',
        isProInputReasonAscending: !state.isProInputReasonAscending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION1_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION1',
        isProInputCondition1Ascending: !state.isProInputCondition1Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION2_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION2',
        isProInputCondition2Ascending: !state.isProInputCondition2Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION3_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION3',
        isProInputCondition3Ascending: !state.isProInputCondition3Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION4_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION4',
        isProInputCondition4Ascending: !state.isProInputCondition4Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION5_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION5',
        isProInputCondition5Ascending: !state.isProInputCondition5Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION6_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION6',
        isProInputCondition6Ascending: !state.isProInputCondition6Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION7_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION7',
        isProInputCondition7Ascending: !state.isProInputCondition7Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION8_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION8',
        isProInputCondition8Ascending: !state.isProInputCondition8Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION9_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION9',
        isProInputCondition9Ascending: !state.isProInputCondition9Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION10_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION10',
        isProInputCondition10Ascending: !state.isProInputCondition10Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION11_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION11',
        isProInputCondition11Ascending: !state.isProInputCondition11Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION12_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION12',
        isProInputCondition12Ascending: !state.isProInputCondition12Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION13_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION13',
        isProInputCondition13Ascending: !state.isProInputCondition13Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION14_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION14',
        isProInputCondition14Ascending: !state.isProInputCondition14Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION15_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION15',
        isProInputCondition15Ascending: !state.isProInputCondition15Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION16_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION16',
        isProInputCondition16Ascending: !state.isProInputCondition16Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION17_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION17',
        isProInputCondition17Ascending: !state.isProInputCondition17Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION18_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION18',
        isProInputCondition18Ascending: !state.isProInputCondition18Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION19_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION19',
        isProInputCondition19Ascending: !state.isProInputCondition19Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_CONDITION20_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'CONDITION20',
        isProInputCondition20Ascending: !state.isProInputCondition20Ascending
      };
    case 'TOGGLE_IS_PRO_INPUT_DATA_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'DATA',
        isProInputDataAscending: !state.isProInputDataAscending
      };
    case 'TOGGLE_IS_PRO_INPUT_UNIT_ASCENDING':
      return {
        ...state,
        toggledProInputFieldButton: 'UNIT',
        isProInputUnitAscending: !state.isProInputUnitAscending
      };
    case 'TOGGLE_IS_FULL_CONTENT_SHOWN':
      return {
        ...state,
        isFullContentShown: !state.isFullContentShown
      };
    case 'SET_ITEM_COLOR':
      return {
        ...state,
        itemColors: {
          ...state.itemColors,
          [action.payload.id]: action.payload.color
        }
      };
    default:
      return state;
  }
};

// export const InitialFieldButtons = {
//   isInputSubjectAscending: false
// };

// export const FieldButtons = (state = { InitialFieldButtons }, action) => {
//   console.log('Inputs reducer called with action:', action);
//   switch (action.type) {
//     case 'TOGGLE_IS_INPUT_SUBJECT_ASCENDING':
//       return {
//         ...state,
//         isInputSubjectAscending: !state.fieldButtons.isInputSubjectAscending
//       };
//     default:
//       return state;
//   }
// };
