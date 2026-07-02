class HostedImageService {
  // Base URL for your Firebase Hosting site where you deployed the kits folder.
  // Change this if your hosting URL differs.
  static const String hostingBase = 'https://chelsea-app-7f916.web.app';

  /// Convert a local asset path like `assets/images/kits/2010_home.png`
  /// or `assets/legends/lampard.jpg` to the hosted URL
  /// `https://.../kits/2010_home.png` or `https://.../legends/lampard.jpg`.
  ///
  /// This method is backwards-compatible with earlier usage for kits.
  static String hostedUrlFromAssetPath(String assetPath) {
    final parts = assetPath.split('/');
    final fileName = parts.isNotEmpty ? parts.last : assetPath;

    // Determine known folder names and map them to top-level hosted folders.
    if (assetPath.contains('/kits/')) {
      return "$hostingBase/kits/$fileName";
    }
    if (assetPath.contains('/legends/')) {
      return "$hostingBase/legends/$fileName";
    }
    if (assetPath.contains('/trophies/')) {
      return "$hostingBase/trophies/$fileName";
    }

    // Fallback: host at top-level with filename only.
    return "$hostingBase/$fileName";
  }
}
