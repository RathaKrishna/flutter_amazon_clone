const mongoose = require('mongoose');

const addressSchema = mongoose.Schema({

  name: {
    type: String,
    required: true,
  },
  mobile: {
    type: String,
    required: true,
  },
  flat: {
    required: true,
    type: String,
  },
  area: {
    type: String,
    required: true,
  },
  pincode: {
    type: String,
    default: 0,
    },
  city: {
    required: true,
    type: String,
    },
    isDefault: {
        type: Boolean,
        required: true,
  }
});


const Address = mongoose.model('Address', addressSchema);
module.exports = Address;