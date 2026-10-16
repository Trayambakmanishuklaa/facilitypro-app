const jwt = require('jsonwebtoken');

const verifyToken = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  if (!authHeader) {
    return res.status(401).json({ success: false, message: 'Access denied. No authorization token provided.' });
  }

  const token = authHeader.startsWith('Bearer ') ? authHeader.substring(7) : authHeader;
  if (!token) {
    return res.status(401).json({ success: false, message: 'Access denied. Malformed token.' });
  }

  try {
    const verified = jwt.verify(token, process.env.JWT_SECRET || 'facilitypro_super_secret_jwt_key_2026');
    req.admin = verified;
    next();
  } catch (error) {
    return res.status(403).json({ success: false, message: 'Invalid or expired authorization token.' });
  }
};

module.exports = verifyToken;
